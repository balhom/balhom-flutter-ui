import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/features/statistics/domain/entities/annual_saving_entity.dart';
import 'package:fpdart/fpdart.dart';

/// Annual Savings Repository Interface.
abstract class AnnualSavingsRepositoryInterface {
  /// Get a list of [AnnualSavingEntity].
  Future<Either<Failure, List<AnnualSavingEntity>>> getAnnualSavings();
}
