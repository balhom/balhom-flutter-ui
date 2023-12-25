import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_summary_entity.dart';
import 'package:balhom/src/features/balance/domain/repositories/balance_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

class BalanceSummaryController extends StateNotifier<AsyncValue<void>> {
  final BalanceRepositoryInterface balanceRepository;

  BalanceSummaryController({required this.balanceRepository})
      : super(const AsyncValue.loading());

  Future<Either<Failure, List<BalanceSummaryEntity>>> getMonthSummary(
      final int month, final int year) async {
    state = const AsyncValue.loading();
    final res = await balanceRepository.getMonthSummary(month, year);
    state = const AsyncValue.data(null);
    return res.fold((failure) => left(failure), (value) => right(value));
  }

  Future<Either<Failure, List<BalanceSummaryEntity>>> getYearSummary(
      final int year) async {
    state = const AsyncValue.loading();
    final res = await balanceRepository.getYearSummary(year);
    state = const AsyncValue.data(null);
    return res.fold((failure) => left(failure), (value) => right(value));
  }
}
