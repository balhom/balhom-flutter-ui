import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/features/statistics/domain/entities/daily_statistics_entity.dart';
import 'package:balhom/src/features/statistics/domain/repositories/daily_statistics_repository_interface.dart';
import 'package:balhom/src/features/statistics/infrastructure/datasources/remote/daily_statistics_remote_data_source.dart';
import 'package:fpdart/fpdart.dart';

class DailyStatisticsRepository implements DailyStatisticsRepositoryInterface {
  final DailyStatisticsRemoteDataSource dailyStatisticsRemoteDataSource;

  DailyStatisticsRepository({required this.dailyStatisticsRemoteDataSource});

  /// Get a list of [DailyStatisticsEntity].
  @override
  Future<Either<Failure, List<DailyStatisticsEntity>>> list(
      int year, int month) async {
    final res = await dailyStatisticsRemoteDataSource.list(year, month);
    return await res.fold((failure) async {
      return left(failure);
    }, (dailyBalances) async {
      return right(dailyBalances);
    });
  }
}
