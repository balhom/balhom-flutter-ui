import 'package:balhom/src/features/account/domain/entities/account_entity.dart';
import 'package:balhom/src/features/account/domain/repositories/account_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountGetUseCase extends StateNotifier<AsyncValue<AccountEntity?>> {
  final AccountRepositoryInterface accountRepository;

  AccountGetUseCase({required this.accountRepository})
      : super(const AsyncValue.data(null));

  Future<void> handle() async {
    state = const AsyncValue.loading();
    final res = await accountRepository.get();
    res.fold((failure) async {
      state = AsyncValue.error(failure, StackTrace.empty);
    }, (value) {
      state = AsyncValue.data(value);
    });
  }
}
