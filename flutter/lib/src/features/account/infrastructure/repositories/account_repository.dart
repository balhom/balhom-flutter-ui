import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/http_connection_failure.dart';
import 'package:balance_home_app/src/features/account/domain/entities/register_entity.dart';
import 'package:balance_home_app/src/features/account/domain/repositories/account_repository_interface.dart';
import 'package:balance_home_app/src/features/account/infrastructure/datasources/local/account_local_data_source.dart';
import 'package:balance_home_app/src/features/account/infrastructure/datasources/remote/account_remote_data_source.dart';
import 'package:balance_home_app/src/features/account/domain/entities/account_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

/// Repository that account CRUD
class AccountRepository implements AccountRepositoryInterface {
  /// Remote account data provider
  final AccountRemoteDataSource accountRemoteDataSource;

  /// Local account data provider
  final UserLocalDataSource accountLocalDataSource;

  /// Default constructor
  AccountRepository({
    required this.accountRemoteDataSource,
    required this.accountLocalDataSource,
  });

  @override
  Future<Either<Failure, AccountEntity>> get() async {
    final response = await accountRemoteDataSource.get();
    return await response.fold((failure) async {
      if (failure is HttpConnectionFailure) {
        return await accountLocalDataSource.get();
      }
      return left(failure);
    }, (remoteAccount) async {
      // Store account data
      await accountLocalDataSource.put(remoteAccount);
      return right(remoteAccount);
    });
  }

  @override
  Future<Either<Failure, void>> create(
      final RegisterEntity registration) async {
    return await accountRemoteDataSource.create(registration);
  }

  @override
  Future<Either<Failure, AccountEntity>> update(
      final AccountEntity account) async {
    return await accountRemoteDataSource.update(account);
  }

  @override
  Future<Either<Failure, void>> updateImage(
      final Uint8List imageBytes, final String imageType) async {
    return await accountRemoteDataSource.updateImage(imageBytes, imageType);
  }

  @override
  Future<Either<Failure, void>> delete() async {
    await accountLocalDataSource.delete();
    return await accountRemoteDataSource.delete();
  }
}
