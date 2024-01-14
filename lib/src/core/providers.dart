import 'package:balhom/config/app_env_vars.dart';
import 'package:balhom/config/app_theme.dart';
import 'package:balhom/config/balhom_api_contract.dart';
import 'package:balhom/src/core/clients/api_client.dart';
import 'package:balhom/src/core/clients/local_db_client.dart';
import 'package:balhom/src/core/clients/local_preferences_client.dart';
import 'package:balhom/src/core/presentation/states/app_localizations_state.dart';
import 'package:balhom/src/core/presentation/states/theme_data_state.dart';
import 'package:balhom/src/features/account/infrastructure/datasources/local/account_local_data_source.dart';
import 'package:balhom/src/features/account/providers.dart';
import 'package:balhom/src/features/auth/domain/entities/jwt_entity.dart';
import 'package:balhom/src/features/balance/infrastructure/datasources/local/balance_type_local_data_source.dart';
import 'package:balhom/src/features/settings/providers.dart';
import 'package:balhom/src/features/statistics/infrastructure/datasources/local/annual_savings_local_data_source.dart';
import 'package:balhom/src/features/statistics/infrastructure/datasources/local/monthly_savings_local_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_io/io.dart';

/// Triggered from bootstrap() to complete futures
Future<void> initializeProviders(ProviderContainer container) async {
  usePathUrlStrategy();

  /// Core
  container.read(localPreferencesClientProvider);
  container.read(localDbClientProvider);
  container.read(balhomApiClientProvider);
  container.read(currencyConversionClientProvider);

  // Change aplication language at account fetch
  container.listen(accountGetUseCaseProvider, (_, accountEntityState) {
    if (accountEntityState.asData != null &&
        accountEntityState.asData!.value != null) {
      container
          .read(appLocalizationsProvider.notifier)
          .setLocale(Locale(accountEntityState.asData!.value!.locale));
    }
  });
  // Change theme
  container.read(settingsRepositoryProvider).getTheme().then((value) {
    value.fold((_) => null, (theme) {
      container.read(themeDataProvider.notifier).setThemeData(theme);
    });
  });
}

///
/// Infrastructure dependencies
///

/// Exposes [LocalPreferencesClient] instance
final localPreferencesClientProvider =
    Provider((ref) => LocalPreferencesClient());

/// Exposes [LocalDbClient] instance
final localDbClientProvider =
    Provider((ref) => LocalDbClient(dbName: "balhomDbV2", tableNames: {
          UserLocalDataSource.tableName,
          BalanceTypeLocalDataSource.tableName,
          AnnualSavingsLocalDataSource.tableName,
          MonthlySavingLocalDataSource.tableName,
        }));

/// Exposes balhom [ApiClient] instance
final balhomApiClientProvider = Provider((ref) {
  final apiClient = ApiClient(baseUrl: AppEnvVars.balhomApiUrl);
  apiClient.addInterceptors([
    InterceptorsWrapper(onError: (exception, handler) async {
      if (exception.response?.statusCode == HttpStatus.unauthorized &&
          exception.requestOptions.path != BalhomAPIContract.authAccess &&
          exception.requestOptions.path != BalhomAPIContract.authRefresh) {
        apiClient.dioClient.options.headers
            .remove(HttpHeaders.authorizationHeader);
        exception.requestOptions.headers
            .remove(HttpHeaders.authorizationHeader);
        final String? storedRefresh =
            (await SharedPreferences.getInstance()).getString("refreshToken");
        if (storedRefresh != null) {
          final response = await apiClient.postRequest(
              BalhomAPIContract.authRefresh,
              data: {"refresh_token": storedRefresh});
          final JwtEntity? newJwt = response.fold(
              (_) => null, (value) => JwtEntity.fromJson(value.data));
          if (newJwt != null) {
            (await SharedPreferences.getInstance())
                .setString("refreshToken", newJwt.refreshToken!);
            apiClient.dioClient.options
                    .headers[HttpHeaders.authorizationHeader] =
                "Bearer ${newJwt.accessToken}";
            exception.requestOptions.headers[HttpHeaders.authorizationHeader] =
                "Bearer ${newJwt.accessToken}";
            // Repeat the request with the updated header
            return handler.resolve(
                await apiClient.dioClient.fetch(exception.requestOptions));
          }
        }
      }
      return handler.next(exception);
    })
  ]);
  return apiClient;
});

/// Exposes currency conversion [ApiClient] instance
final currencyConversionClientProvider = Provider((ref) {
  return ApiClient(baseUrl: AppEnvVars.currencyConversionApiUrl)
    ..setHeader(HttpHeaders.authorizationHeader,
        "APIKey ${AppEnvVars.currencyConversionApiKey}");
});

///
/// Presentation dependencies
///

/// Provides a [ValueNotifier] to the app to check http connection state
final connectionStateListenable = ValueNotifier<bool>(true);

final themeDataProvider =
    StateNotifierProvider<ThemeDataState, ThemeData>((ref) {
  final theme =
      (SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.light)
          ? AppTheme.lightTheme
          : AppTheme.darkTheme;
  return ThemeDataState(theme);
});

final appLocalizationsProvider =
    StateNotifierProvider<AppLocalizationsState, AppLocalizations>((_) {
  Locale locale = Locale(Platform.localeName.substring(0, 2));
  // If system's locale is not supported, Enlish will be used as default
  if (!AppLocalizations.supportedLocales.contains(locale)) {
    locale = const Locale("en");
  }
  return AppLocalizationsState(lookupAppLocalizations(locale));
});
