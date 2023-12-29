import 'package:balhom/src/features/account/domain/dtos/account_edit_values_dto.dart';
import 'package:balhom/src/features/account/domain/failures/account_edit_failure.dart';
import 'package:balhom/src/features/account/domain/repositories/account_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountUpdateUseCase extends StateNotifier<AsyncValue<void>> {
  final AccountRepositoryInterface accountRepository;

  AccountUpdateUseCase({required this.accountRepository})
      : super(const AsyncValue.data(null));

  Future<void> handle(final AccountEditValuesDto accountEditValuesDto,
      final AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    await accountEditValuesDto.toEntity().fold<Future<void>>((failure) async {
      state = AsyncValue.error(failure, StackTrace.empty);
      return Future.value();
    }, (accountEntity) async {
      final res = await accountRepository.update(accountEntity);
      res.fold((failure) {
        state = AsyncValue.error(
            AccountEditFailure.fromFailure(failure, appLocalizations),
            StackTrace.empty);
      }, (_) {
        state = const AsyncValue.data(null);
      });
    });
  }
}
