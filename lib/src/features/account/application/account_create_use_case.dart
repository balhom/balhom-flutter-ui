import 'package:balhom/src/features/account/domain/dtos/register_values_dto.dart';
import 'package:balhom/src/features/account/domain/failures/register_failure.dart';
import 'package:balhom/src/features/account/domain/repositories/account_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountCreateUseCase extends StateNotifier<AsyncValue<void>> {
  final AccountRepositoryInterface accountRepository;

  AccountCreateUseCase({required this.accountRepository})
      : super(const AsyncValue.data(null));

  Future<void> handle(final RegisterValuesDto registerValuesDto,
      final AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();

    await registerValuesDto.toEntity().fold<Future<void>>((failure) async {
      state = const AsyncValue.data(null);
      return Future.value();
    }, (registerEntity) async {
      final res = await accountRepository.create(registerEntity);
      state = const AsyncValue.data(null);
      return res.fold((failure) {
        state = AsyncValue.error(
            RegisterFailure.fromFailure(failure, appLocalizations),
            StackTrace.empty);
      }, (_) => state = const AsyncValue.data(null));
    });
  }
}
