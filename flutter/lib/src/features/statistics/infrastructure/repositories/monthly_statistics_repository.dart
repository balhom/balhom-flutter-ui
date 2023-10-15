import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/statistics/domain/entities/monthly_statistics_entity.dart';
import 'package:balance_home_app/src/features/statistics/domain/repositories/monthly_statistics_repository_interface.dart';
import 'package:balance_home_app/src/features/statistics/infrastructure/datasources/remote/monthly_statistics_remote_data_source.dart';
import 'package:fpdart/fpdart.dart';

class MonthlyStatisticsRepository
    implements MonthlyStatisticsRepositoryInterface {
  final MonthlyStatisticsRemoteDataSource monthlyStatisticsRemoteDataSource;

  MonthlyStatisticsRepository(
      {required this.monthlyStatisticsRemoteDataSource});

  /// Get a list of [MonthlyStatisticsEntity].
  @override
  Future<Either<Failure, List<MonthlyStatisticsEntity>>> list(int year) async {
    final res = await monthlyStatisticsRemoteDataSource.list(year);
    return await res.fold((failure) async {
      return left(failure);
    }, (monthlyBalances) async {
      return right(monthlyBalances);
    });
  }
}
