import 'package:balhom/src/core/domain/failures/invalid_value_failure.dart';
import 'package:balhom/src/features/account/domain/entities/account_entity.dart';
import 'package:balhom/src/features/account/domain/repositories/account_repository_interface.dart';
import 'package:balhom/src/features/settings/domain/repositories/settings_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReceiveEmailUpdateUseCase extends StateNotifier<AsyncValue<void>> {
  final AccountRepositoryInterface accountRepository;
  final SettingsRepositoryInterface settingsRepository;

  ReceiveEmailUpdateUseCase(
      {required this.accountRepository, required this.settingsRepository})
      : super(const AsyncValue.data(null));

  Future<void> handle(
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
    res.fold((_) {
      state = AsyncValue.error(
          InvalidValueFailure(detail: appLocalizations.genericError),
          StackTrace.empty);
    }, (_) {
      state = const AsyncValue.data(null);
    });
  }
}
