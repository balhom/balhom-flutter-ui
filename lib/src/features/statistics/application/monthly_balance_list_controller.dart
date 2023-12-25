import 'package:balhom/src/core/presentation/models/selected_date.dart';
import 'package:balhom/src/features/statistics/domain/entities/monthly_balance_entity.dart';
import 'package:balhom/src/features/statistics/domain/repositories/monthly_balance_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonthlyBalanceListController
    extends StateNotifier<AsyncValue<List<MonthlyBalanceEntity>>> {
  final MonthlyBalanceRepositoryInterface monthlyBalanceRepository;

  MonthlyBalanceListController({
    required this.monthlyBalanceRepository,
  }) : super(const AsyncValue.loading());

  Future<void> get(final SelectedDateDto date) async {
    final dailyStatistics =
        await monthlyBalanceRepository.getMonthlyBalances(year: date.year);
    state = await dailyStatistics.fold((failure) {
      return AsyncValue.error(failure.detail, StackTrace.empty);
    }, (dateBalanceList) async {
      return AsyncValue.data(dateBalanceList);
    });
  }
}
