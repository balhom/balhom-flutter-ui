import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/features/statistics/domain/entities/monthly_statistics_entity.dart';
import 'package:fpdart/fpdart.dart';

/// Monthly Statistics Repository Interface.
abstract class MonthlyStatisticsRepositoryInterface {
  /// Get a list of [MonthlyStatisticsEntity].
  Future<Either<Failure, List<MonthlyStatisticsEntity>>> list(int year);
}
