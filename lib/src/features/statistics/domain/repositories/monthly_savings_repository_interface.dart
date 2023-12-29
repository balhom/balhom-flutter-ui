import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/features/statistics/domain/entities/monthly_saving_entity.dart';
import 'package:fpdart/fpdart.dart';

/// Monthly Savings Repository Interface.
abstract class MonthlySavingsRepositoryInterface {
  /// Get [MonthlySavingEntity] by `id`.
  Future<Either<Failure, MonthlySavingEntity>> getMonthlySaving(int id);

  /// Get a list of [MonthlySavingEntity].
  Future<Either<Failure, List<MonthlySavingEntity>>> getMonthlySavings(
      {int? year});
}
