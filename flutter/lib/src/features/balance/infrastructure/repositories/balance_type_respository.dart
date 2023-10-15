import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/http_connection_failure.dart';
import 'package:balance_home_app/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balance_home_app/src/features/balance/infrastructure/datasources/local/balance_type_local_data_source.dart';
import 'package:balance_home_app/src/features/balance/infrastructure/datasources/remote/balance_type_remote_data_source.dart';
import 'package:balance_home_app/src/features/balance/domain/entities/balance_type_entity.dart';
import 'package:balance_home_app/src/features/balance/domain/repositories/balance_type_respository_interface.dart';
import 'package:fpdart/fpdart.dart';

/// Balance Type Repository.
class BalanceTypeRepository implements BalanceTypeRepositoryInterface {
  final BalanceTypeRemoteDataSource balanceTypeRemoteDataSource;
  final BalanceTypeLocalDataSource balanceTypeLocalDataSource;

  BalanceTypeRepository(
      {required this.balanceTypeRemoteDataSource,
      required this.balanceTypeLocalDataSource});

  /// Get [BalanceTypeEntity] by `name`.
  @override
  Future<Either<Failure, BalanceTypeEntity>> getBalanceType(
      final String name, final BalanceTypeEnum balanceTypeEnum) async {
    final response =
        await balanceTypeRemoteDataSource.get(name, balanceTypeEnum);
    return await response.fold((failure) async {
      if (failure is HttpConnectionFailure) {
        return await balanceTypeLocalDataSource.get(name, balanceTypeEnum);
      }
      return left(failure);
    }, (balanceType) async {
      // Store balance type data
      await balanceTypeLocalDataSource.put(balanceType, balanceTypeEnum);
      return right(balanceType);
    });
  }

  /// Get a list of all [BalanceTypeEntity].
  @override
  Future<Either<Failure, List<BalanceTypeEntity>>> getBalanceTypes(
      final BalanceTypeEnum balanceTypeEnum) async {
    final response = await balanceTypeRemoteDataSource.list(balanceTypeEnum);
    return await response.fold((failure) async {
      if (failure is HttpConnectionFailure) {
        return await balanceTypeLocalDataSource.list(balanceTypeEnum);
      }
      return left(failure);
    }, (balanceTypes) async {
      // Delete stored balance types data
      await balanceTypeLocalDataSource.deleteAll(balanceTypeEnum);
      // Store balance types data
      for (final balanceType in balanceTypes) {
        await balanceTypeLocalDataSource.put(balanceType, balanceTypeEnum);
      }
      return right(balanceTypes);
    });
  }
}
