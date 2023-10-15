import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/local_db/no_local_entry_failure.dart';
import 'package:balance_home_app/src/core/presentation/models/selected_date.dart';
import 'package:balance_home_app/src/features/balance/domain/dtos/balance_dates_dto.dart';
import 'package:balance_home_app/src/features/statistics/domain/repositories/annual_balance_repository_interface.dart';
import 'package:balance_home_app/src/features/statistics/domain/repositories/monthly_balance_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

class BalanceDateListController
    extends StateNotifier<AsyncValue<Either<Failure, BalanceDateListDto>>> {
  final AnnualBalanceRepositoryInterface annualBalanceRepository;
  final MonthlyBalanceRepositoryInterface monthlyBalanceRepository;

  BalanceDateListController({
    required this.annualBalanceRepository,
    required this.monthlyBalanceRepository,
  }) : super(const AsyncValue.loading());

  Future<void> get(final SelectedDateDto date) async {
    // Monthly balances
    final monthlyBalances =
        await monthlyBalanceRepository.getMonthlyBalances(year: date.year);
    state = await monthlyBalances.fold((failure) {
      if (failure is NoLocalEntryFailure) {
        return AsyncValue.data(left(failure));
      }
      return AsyncValue.error(failure.detail, StackTrace.empty);
    }, (monthlyBalances) async {
      // Annual balances
      final annualBalances = await annualBalanceRepository.getAnnualBalances();
      return await annualBalances.fold((failure) {
        if (failure is NoLocalEntryFailure) {
          return AsyncValue.data(left(failure));
        }
        return AsyncValue.error(failure.detail, StackTrace.empty);
      }, (annualBalances) async {
        return AsyncValue.data(right(BalanceDateListDto(
          monthlyBalances: monthlyBalances,
          annualBalances: annualBalances,
        )));
      });
    });
  }
}
