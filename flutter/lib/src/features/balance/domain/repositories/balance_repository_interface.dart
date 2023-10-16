import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balance_home_app/src/features/balance/domain/entities/balance_summary_entity.dart';
import 'package:balance_home_app/src/features/balance/domain/enums/balance_sorting_enum.dart';
import 'package:balance_home_app/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:fpdart/fpdart.dart';

/// Balance Repository Interface.
abstract class BalanceRepositoryInterface {
  /// Get [BalanceEntity] by `id`.
  Future<Either<Failure, BalanceEntity>> getBalance(int id);

  /// Get a list of [BalanceEntity].
  Future<Either<Failure, List<BalanceEntity>>> getBalances(
      {required BalanceTypeEnum balanceTypeEnum,
      required BalanceSortingEnum balanceSortingEnum,
      required int page,
      required DateTime dateFrom,
      required DateTime dateTo});

  /// Get a list of years related to existing [BalanceEntity] years.
  Future<Either<Failure, List<int>>> getBalanceYears(
      final BalanceTypeEnum balanceTypeEnum);

  Future<Either<Failure, List<BalanceSummaryEntity>>> getMonthSummary(
      final int month, final int year);

  Future<Either<Failure, List<BalanceSummaryEntity>>> getYearSummary(
      final int year);

  /// Store a [BalanceEntity].
  Future<Either<Failure, BalanceEntity>> createBalance(BalanceEntity balance);

  /// Update a [BalanceEntity].
  Future<Either<Failure, BalanceEntity>> updateBalance(BalanceEntity balance);

  /// Delete a [BalanceEntity].
  Future<Either<Failure, void>> deleteBalance(BalanceEntity balance);
}
