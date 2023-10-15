import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/http_connection_failure.dart';
import 'package:balance_home_app/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balance_home_app/src/features/balance/domain/enums/balance_sorting_enum.dart';
import 'package:balance_home_app/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balance_home_app/src/features/balance/infrastructure/datasources/remote/balance_remote_data_source.dart';
import 'package:balance_home_app/src/features/balance/domain/repositories/balance_repository_interface.dart';
import 'package:fpdart/fpdart.dart';

/// Balance Repository.
class BalanceRepository implements BalanceRepositoryInterface {
  final BalanceRemoteDataSource balanceRemoteDataSource;

  BalanceRepository({required this.balanceRemoteDataSource});

  /// Get [BalanceEntity] by `id`.
  @override
  Future<Either<Failure, BalanceEntity>> getBalance(final int id) async {
    final response = await balanceRemoteDataSource.get(id);
    return await response.fold((failure) async {
      return left(failure);
    }, (balance) async {
      return right(balance);
    });
  }

  /// Get a list of [BalanceEntity].
  @override
  Future<Either<Failure, List<BalanceEntity>>> getBalances(
      {required BalanceTypeEnum balanceTypeEnum,
      required BalanceSortingEnum balanceSortingEnum,
      required int page,
      DateTime? dateFrom,
      DateTime? dateTo}) async {
    final response = await balanceRemoteDataSource.list(
        page: page,
        balanceSortingEnum: balanceSortingEnum,
        balanceTypeEnum: balanceTypeEnum,
        dateFrom: dateFrom,
        dateTo: dateTo);
    return await response.fold((failure) async {
      return left(failure);
    }, (balances) async {
      return right(balances);
    });
  }

  /// Get a list of years related to existing [BalanceEntity] years.
  @override
  Future<Either<Failure, List<int>>> getBalanceYears(
      final BalanceTypeEnum balanceTypeEnum) async {
    final res = await balanceRemoteDataSource.getYears(balanceTypeEnum);
    return res.fold((failure) {
      if (failure is HttpConnectionFailure) {
        return right([DateTime.now().year]);
      }
      return left(failure);
    }, (value) => right(value));
  }

  /// Store a [BalanceEntity].
  @override
  Future<Either<Failure, BalanceEntity>> createBalance(
      final BalanceEntity balance) async {
    return await balanceRemoteDataSource.create(balance);
  }

  /// Update a [BalanceEntity].
  @override
  Future<Either<Failure, BalanceEntity>> updateBalance(
      final BalanceEntity balance) async {
    return await balanceRemoteDataSource.update(balance);
  }

  /// Delete a [BalanceEntity].
  @override
  Future<Either<Failure, void>> deleteBalance(
      final BalanceEntity balance) async {
    return await balanceRemoteDataSource.delete(balance);
  }
}
