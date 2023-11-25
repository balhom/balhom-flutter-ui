import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balance_home_app/src/features/account/domain/entities/account_entity.dart';
import 'package:balance_home_app/src/features/account/domain/repositories/account_repository_interface.dart';
import 'package:balance_home_app/src/features/settings/domain/repositories/settings_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsController extends StateNotifier<AsyncValue<void>> {
  final AccountRepositoryInterface accountRepository;
  final SettingsRepositoryInterface settingsRepository;

  SettingsController(
      {required this.accountRepository, required this.settingsRepository})
      : super(const AsyncValue.data(null));

  Future<Either<Failure, AccountEntity>> updateLanguage(
      final AccountEntity oldAccount,
      final Locale locale,
      final AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    final res = await accountRepository.update(
      AccountEntity(
          username: oldAccount.username,
          email: oldAccount.email,
          receiveEmailBalance: oldAccount.receiveEmailBalance,
          currentBalance: oldAccount.currentBalance,
          expectedAnnualBalance: oldAccount.expectedAnnualBalance,
          expectedMonthlyBalance: oldAccount.expectedMonthlyBalance,
          locale: locale.languageCode,
          prefCurrencyType: oldAccount.prefCurrencyType,
          lastLogin: null,
          image: null),
    );
    return res.fold((_) {
      state = const AsyncValue.data(null);
      return left(
          UnprocessableValueFailure(detail: appLocalizations.genericError));
    }, (value) {
      state = const AsyncValue.data(null);
      return right(value);
    });
  }

  Future<Either<Failure, AccountEntity>> updateReceiveEmailBalance(
      final AccountEntity oldAccount,
      final bool receiveEmailBalance,
      final AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    final res = await accountRepository.update(
      AccountEntity(
          username: oldAccount.username,
          email: oldAccount.email,
          receiveEmailBalance: receiveEmailBalance,
          currentBalance: oldAccount.currentBalance,
          expectedAnnualBalance: oldAccount.expectedAnnualBalance,
          expectedMonthlyBalance: oldAccount.expectedMonthlyBalance,
          locale: oldAccount.locale,
          prefCurrencyType: oldAccount.prefCurrencyType,
          lastLogin: null,
          image: null),
    );
    return res.fold((_) {
      state = const AsyncValue.data(null);
      return left(
          UnprocessableValueFailure(detail: appLocalizations.genericError));
    }, (value) {
      state = const AsyncValue.data(null);
      return right(value);
    });
  }

  Future<Either<Failure, bool>> updateThemeMode(
      ThemeData theme, AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    final res = await settingsRepository.saveTheme(theme);
    return res.fold((_) {
      state = const AsyncValue.data(null);
      return left(
          UnprocessableValueFailure(detail: appLocalizations.genericError));
    }, (value) {
      state = const AsyncValue.data(null);
      return right(value);
    });
  }
}
