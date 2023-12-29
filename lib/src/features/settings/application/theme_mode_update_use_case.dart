import 'package:balhom/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balhom/src/features/account/domain/repositories/account_repository_interface.dart';
import 'package:balhom/src/features/settings/domain/repositories/settings_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeModeUpdateUseCase extends StateNotifier<AsyncValue<void>> {
  final AccountRepositoryInterface accountRepository;
  final SettingsRepositoryInterface settingsRepository;

  ThemeModeUpdateUseCase(
      {required this.accountRepository, required this.settingsRepository})
      : super(const AsyncValue.data(null));

  Future<void> handle(
      ThemeData theme, AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    final res = await settingsRepository.saveTheme(theme);
    return res.fold((_) {
      state = AsyncValue.error(
          InvalidValueFailure(detail: appLocalizations.genericError),
          StackTrace.empty);
    }, (_) {
      state = const AsyncValue.data(null);
    });
  }
}
