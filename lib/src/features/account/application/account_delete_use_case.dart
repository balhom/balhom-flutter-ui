import 'package:balhom/src/features/account/domain/repositories/account_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountDeleteUseCase extends StateNotifier<AsyncValue<void>> {
  final AccountRepositoryInterface accountRepository;

  AccountDeleteUseCase({required this.accountRepository})
      : super(const AsyncValue.data(null));

  /// Delete current account data
  Future<void> handle() async {
    final res = await accountRepository.delete();
    res.fold((failure) => state = AsyncError(failure, StackTrace.empty),
        (_) => const AsyncData(null));
  }
}
