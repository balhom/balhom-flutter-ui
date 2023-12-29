import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/domain/failures/http/http_connection_failure.dart';
import 'package:balhom/src/features/statistics/infrastructure/datasources/local/monthly_savings_local_data_source.dart';
import 'package:balhom/src/features/statistics/infrastructure/datasources/remote/monthly_savings_remote_data_source.dart';
import 'package:balhom/src/features/statistics/domain/entities/monthly_saving_entity.dart';
import 'package:balhom/src/features/statistics/domain/repositories/monthly_savings_repository_interface.dart';
import 'package:fpdart/fpdart.dart';

class MonthlySavingsRepository implements MonthlySavingsRepositoryInterface {
  final MonthlySavingsRemoteDataSource monthlyBalanceRemoteDataSource;
  final MonthlySavingLocalDataSource monthlyBalanceLocalDataSource;

  MonthlySavingsRepository(
      {required this.monthlyBalanceRemoteDataSource,
      required this.monthlyBalanceLocalDataSource});

  /// Get a list of [MonthlySavingEntity].
  @override
  Future<Either<Failure, List<MonthlySavingEntity>>> getMonthlySavings(
      {int? year}) async {
    final res = await monthlyBalanceRemoteDataSource.list(year: year);
    return await res.fold((failure) async {
      if (failure is HttpConnectionFailure) {
        return await monthlyBalanceLocalDataSource.list(year: year);
      }
      return left(failure);
    }, (monthlyBalances) async {
      for (final monthlyBalance in monthlyBalances) {
        await monthlyBalanceLocalDataSource.put(monthlyBalance);
      }
      return right(monthlyBalances);
    });
  }
}
