import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/features/statistics/domain/entities/daily_statistics_entity.dart';
import 'package:fpdart/fpdart.dart';

/// Daily Statistics Repository Interface.
abstract class DailyStatisticsRepositoryInterface {
  /// Get a list of [DailyStatisticsEntity].
  Future<Either<Failure, List<DailyStatisticsEntity>>> list(
      int year, int month);
}
