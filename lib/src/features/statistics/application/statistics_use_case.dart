import 'package:balhom/src/core/domain/dtos/selected_date_dto.dart';
import 'package:balhom/src/features/statistics/domain/dtos/statistics_data_dto.dart';
import 'package:balhom/src/features/statistics/domain/repositories/daily_statistics_repository_interface.dart';
import 'package:balhom/src/features/statistics/domain/repositories/monthly_statistics_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatisticsUseCase extends StateNotifier<AsyncValue<StatisticsDataDto>> {
  final DailyStatisticsRepositoryInterface dailyStatisticsRepository;
  final MonthlyStatisticsRepositoryInterface monthlyStatisticsRepository;

  StatisticsUseCase({
    required this.dailyStatisticsRepository,
    required this.monthlyStatisticsRepository,
  }) : super(const AsyncValue.loading());

  Future<void> handle(final SelectedDateDto date) async {
    final dailyStatistics =
        await dailyStatisticsRepository.list(date.year, date.month);
    state = await dailyStatistics.fold((failure) async {
      return AsyncValue.error(failure.detail, StackTrace.empty);
    }, (dailyStatistics) async {
      final monthlyStatistics =
          await monthlyStatisticsRepository.list(date.year);
      return await monthlyStatistics.fold((failure) async {
        return AsyncValue.error(failure.detail, StackTrace.empty);
      }, (monthlyStatistics) async {
        return AsyncValue.data(StatisticsDataDto(
            dailyStatistics: dailyStatistics,
            monthlyStatistics: monthlyStatistics));
      });
    });
  }
}
