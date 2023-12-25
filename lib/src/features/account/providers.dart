import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/account/application/account_controller.dart';
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

final accountControllerProvider =
    StateNotifierProvider<AccountController, AsyncValue<AccountEntity?>>((ref) {
  final accountRepo = ref.read(accountRepositoryProvider);
  return AccountController(accountRepository: accountRepo);
});
