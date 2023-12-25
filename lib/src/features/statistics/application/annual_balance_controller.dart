import 'package:balhom/src/core/presentation/models/selected_date.dart';
import 'package:balhom/src/features/statistics/domain/entities/annual_balance_entity.dart';
import 'package:balhom/src/features/statistics/domain/repositories/annual_balance_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnnualBalanceListController
    extends StateNotifier<AsyncValue<List<AnnualBalanceEntity>>> {
  final AnnualBalanceRepositoryInterface annualBalanceRepository;

  AnnualBalanceListController({
    required this.annualBalanceRepository,
  }) : super(const AsyncValue.loading());

  Future<void> get(final SelectedDateDto date) async {
    final dailyStatistics = await annualBalanceRepository.getAnnualBalances();
    state = await dailyStatistics.fold((failure) {
      return AsyncValue.error(failure.detail, StackTrace.empty);
    }, (dateBalanceList) async {
      return AsyncValue.data(dateBalanceList);
    });
  }
}
