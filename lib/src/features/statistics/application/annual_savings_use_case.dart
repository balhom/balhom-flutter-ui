import 'package:balhom/src/core/domain/dtos/selected_date_dto.dart';
import 'package:balhom/src/features/statistics/domain/entities/annual_saving_entity.dart';
import 'package:balhom/src/features/statistics/domain/repositories/annual_savings_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnnualSavingsUseCase
    extends StateNotifier<AsyncValue<List<AnnualSavingEntity>>> {
  final AnnualSavingsRepositoryInterface annualBalanceRepository;

  AnnualSavingsUseCase({
    required this.annualBalanceRepository,
  }) : super(const AsyncValue.loading());

  Future<void> handle(final SelectedDateDto date) async {
    final dailyStatistics = await annualBalanceRepository.getAnnualSavings();
    state = await dailyStatistics.fold((failure) {
      return AsyncValue.error(failure.detail, StackTrace.empty);
    }, (dateBalanceList) async {
      return AsyncValue.data(dateBalanceList);
    });
  }
}
