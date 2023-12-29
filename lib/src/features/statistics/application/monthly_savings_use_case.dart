import 'package:balhom/src/core/domain/dtos/selected_date_dto.dart';
import 'package:balhom/src/features/statistics/domain/entities/monthly_saving_entity.dart';
import 'package:balhom/src/features/statistics/domain/repositories/monthly_savings_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonthlySavingsUseCase
    extends StateNotifier<AsyncValue<List<MonthlySavingEntity>>> {
  final MonthlySavingsRepositoryInterface monthlyBalanceRepository;

  MonthlySavingsUseCase({
    required this.monthlyBalanceRepository,
  }) : super(const AsyncValue.loading());

  Future<void> handle(final SelectedDateDto date) async {
    final dailyStatistics =
        await monthlyBalanceRepository.getMonthlySavings(year: date.year);
    state = await dailyStatistics.fold((failure) {
      return AsyncValue.error(failure.detail, StackTrace.empty);
    }, (dateBalanceList) async {
      return AsyncValue.data(dateBalanceList);
    });
  }
}
