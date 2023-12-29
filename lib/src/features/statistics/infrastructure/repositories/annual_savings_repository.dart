import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/domain/failures/http/http_connection_failure.dart';
import 'package:balhom/src/features/statistics/infrastructure/datasources/local/annual_savings_local_data_source.dart';
import 'package:balhom/src/features/statistics/infrastructure/datasources/remote/annual_savings_remote_data_source.dart';
import 'package:balhom/src/features/statistics/domain/entities/annual_saving_entity.dart';
import 'package:balhom/src/features/statistics/domain/repositories/annual_savings_repository_interface.dart';
import 'package:fpdart/fpdart.dart';

class AnnualSavingsRepository implements AnnualSavingsRepositoryInterface {
  final AnnualSavingsRemoteDataSource annualBalanceRemoteDataSource;
  final AnnualSavingsLocalDataSource annualBalanceLocalDataSource;

  AnnualSavingsRepository(
      {required this.annualBalanceRemoteDataSource,
      required this.annualBalanceLocalDataSource});

  /// Get a list of [AnnualSavingEntity].
  @override
  Future<Either<Failure, List<AnnualSavingEntity>>> getAnnualSavings() async {
    final res = await annualBalanceRemoteDataSource.list();
    return await res.fold((failure) async {
      if (failure is HttpConnectionFailure) {
        return await annualBalanceLocalDataSource.list();
      }
      return left(failure);
    }, (annualBalances) async {
      for (final annualBalance in annualBalances) {
        await annualBalanceLocalDataSource.put(annualBalance);
      }
      return right(annualBalances);
    });
  }
}
