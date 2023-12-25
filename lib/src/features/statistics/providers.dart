import 'package:balhom/src/core/presentation/models/selected_date.dart';
import 'package:balhom/src/core/presentation/models/selected_date_mode.dart';
import 'package:balhom/src/core/presentation/states/selected_date_state.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/balance/providers.dart';
import 'package:balhom/src/features/statistics/application/annual_balance_controller.dart';
import 'package:balhom/src/features/statistics/application/monthly_balance_list_controller.dart';
import 'package:balhom/src/features/statistics/application/statistics_controller.dart';
import 'package:balhom/src/features/statistics/domain/dtos/statistics_data_dto.dart';
import 'package:balhom/src/features/statistics/domain/entities/annual_balance_entity.dart';
import 'package:balhom/src/features/statistics/domain/entities/monthly_balance_entity.dart';
import 'package:balhom/src/features/statistics/domain/repositories/daily_statistics_repository_interface.dart';
import 'package:balhom/src/features/statistics/domain/repositories/monthly_statistics_repository_interface.dart';
import 'package:balhom/src/features/statistics/infrastructure/datasources/remote/daily_statistics_remote_data_source.dart';
import 'package:balhom/src/features/statistics/infrastructure/datasources/remote/monthly_statistics_remote_data_source.dart';
import 'package:balhom/src/features/statistics/infrastructure/repositories/daily_statistics_repository.dart';
import 'package:balhom/src/features/statistics/infrastructure/repositories/monthly_statistics_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// Infrastructure dependencies
///

/// Daily Statistics repository
final dailyStatisticsRepositoryProvider =
    Provider<DailyStatisticsRepositoryInterface>(
        (ref) => DailyStatisticsRepository(
              dailyStatisticsRemoteDataSource: DailyStatisticsRemoteDataSource(
                  apiClient: ref.read(balhomApiClientProvider)),
            ));

/// Monthly Statistics repository
final monthlyStatisticsRepositoryProvider =
    Provider<MonthlyStatisticsRepositoryInterface>(
        (ref) => MonthlyStatisticsRepository(
              monthlyStatisticsRemoteDataSource:
                  MonthlyStatisticsRemoteDataSource(
                      apiClient: ref.read(balhomApiClientProvider)),
            ));

///
/// Application dependencies
///

final monthlyBalanceListControllerProvider = StateNotifierProvider<
    MonthlyBalanceListController,
    AsyncValue<List<MonthlyBalanceEntity>>>((ref) {
  final monthlyBalanceRepository = ref.read(monthlyBalanceRepositoryProvider);
  return MonthlyBalanceListController(
      monthlyBalanceRepository: monthlyBalanceRepository);
});

final annualBalanceListControllerProvider = StateNotifierProvider<
    AnnualBalanceListController, AsyncValue<List<AnnualBalanceEntity>>>((ref) {
  final annualBalanceRepository = ref.read(annualBalanceRepositoryProvider);
  return AnnualBalanceListController(
      annualBalanceRepository: annualBalanceRepository);
});

final statisticsControllerProvider =
    StateNotifierProvider<StatisticsController, AsyncValue<StatisticsDataDto>>(
        (ref) {
  final dailyStatisticsRepository = ref.read(dailyStatisticsRepositoryProvider);
  final monthlyStatisticsRepository =
      ref.read(monthlyStatisticsRepositoryProvider);
  return StatisticsController(
      dailyStatisticsRepository: dailyStatisticsRepository,
      monthlyStatisticsRepository: monthlyStatisticsRepository);
});

///
/// Presentation dependencies
///

/// Selected date for statistic's balance charts
final statisticsBalanceSelectedDateProvider =
    StateNotifierProvider<SelectedDateState, SelectedDateDto>((ref) {
  return SelectedDateState(SelectedDateEnum.day);
});

/// Selected date for statistic's savings charts
final statisticsSavingsSelectedDateProvider =
    StateNotifierProvider<SelectedDateState, SelectedDateDto>((ref) {
  return SelectedDateState(SelectedDateEnum.day);
});
