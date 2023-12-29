import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/account/application/account_create_use_case.dart';
import 'package:balhom/src/features/account/application/account_delete_use_case.dart';
import 'package:balhom/src/features/account/application/account_get_use_case.dart';
import 'package:balhom/src/features/account/application/account_update_image_use_case.dart';
import 'package:balhom/src/features/account/application/account_update_use_case.dart';
import 'package:balhom/src/features/account/domain/entities/account_entity.dart';
import 'package:balhom/src/features/account/domain/repositories/account_repository_interface.dart';
import 'package:balhom/src/features/account/infrastructure/datasources/local/account_local_data_source.dart';
import 'package:balhom/src/features/account/infrastructure/datasources/remote/account_remote_data_source.dart';
import 'package:balhom/src/features/account/infrastructure/repositories/account_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// Infrastructure dependencies
///

final accountRepositoryProvider = Provider<AccountRepositoryInterface>((ref) {
  return AccountRepository(
      accountRemoteDataSource:
          AccountRemoteDataSource(apiClient: ref.read(balhomApiClientProvider)),
      accountLocalDataSource:
          UserLocalDataSource(localDbClient: ref.read(localDbClientProvider)));
});

///
/// Application dependencies
///

final accountGetUseCaseProvider =
    StateNotifierProvider<AccountGetUseCase, AsyncValue<AccountEntity?>>((ref) {
  final accountRepo = ref.read(accountRepositoryProvider);
  return AccountGetUseCase(accountRepository: accountRepo);
});

final accountCreateUseCaseProvider =
    StateNotifierProvider<AccountCreateUseCase, AsyncValue<void>>((ref) {
  final accountRepo = ref.read(accountRepositoryProvider);
  return AccountCreateUseCase(accountRepository: accountRepo);
});

final accountUpdateUseCaseProvider =
    StateNotifierProvider<AccountUpdateUseCase, AsyncValue<void>>((ref) {
  final accountRepo = ref.read(accountRepositoryProvider);
  return AccountUpdateUseCase(accountRepository: accountRepo);
});

final accountUpdateImageUseCaseProvider =
    StateNotifierProvider<AccountUpdateImageUseCase, AsyncValue<void>>((ref) {
  final accountRepo = ref.read(accountRepositoryProvider);
  return AccountUpdateImageUseCase(accountRepository: accountRepo);
});

final accountDeleteUseCaseProvider =
    StateNotifierProvider<AccountDeleteUseCase, AsyncValue<void>>((ref) {
  final accountRepo = ref.read(accountRepositoryProvider);
  return AccountDeleteUseCase(accountRepository: accountRepo);
});
