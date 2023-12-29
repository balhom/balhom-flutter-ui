import 'package:balhom/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balhom/src/features/account/domain/entities/account_entity.dart';
import 'package:balhom/src/features/account/domain/repositories/account_repository_interface.dart';
import 'package:balhom/src/features/settings/domain/repositories/settings_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageUpdateUseCase extends StateNotifier<AsyncValue<void>> {
  final AccountRepositoryInterface accountRepository;
  final SettingsRepositoryInterface settingsRepository;

  LanguageUpdateUseCase(
      {required this.accountRepository, required this.settingsRepository})
      : super(const AsyncValue.data(null));

  Future<void> handle(final AccountEntity oldAccount, final Locale locale,
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
    res.fold((_) {
      state = AsyncValue.error(
          InvalidValueFailure(detail: appLocalizations.genericError),
          StackTrace.empty);
    }, (_) {
      state = const AsyncValue.data(null);
    });
  }
}
