import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/presentation/models/selected_date.dart';
import 'package:balance_home_app/src/core/presentation/models/selected_date_mode.dart';
import 'package:balance_home_app/src/core/presentation/states/selected_date_state.dart';
import 'package:balance_home_app/src/core/providers.dart';
import 'package:balance_home_app/src/features/account/providers.dart';
import 'package:balance_home_app/src/features/statistics/application/statistics_controller.dart';
import 'package:balance_home_app/src/features/statistics/domain/dtos/selected_conversion_dto.dart';
import 'package:balance_home_app/src/features/statistics/domain/dtos/statistics_data_dto.dart';
import 'package:balance_home_app/src/features/statistics/domain/repositories/daily_statistics_repository_interface.dart';
import 'package:balance_home_app/src/features/statistics/domain/repositories/monthly_statistics_repository_interface.dart';
import 'package:balance_home_app/src/features/statistics/infrastructure/datasources/remote/daily_statistics_remote_data_source.dart';
import 'package:balance_home_app/src/features/statistics/infrastructure/datasources/remote/monthly_statistics_remote_data_source.dart';
import 'package:balance_home_app/src/features/statistics/infrastructure/repositories/daily_statistics_repository.dart';
import 'package:balance_home_app/src/features/statistics/infrastructure/repositories/monthly_statistics_repository.dart';
import 'package:balance_home_app/src/features/statistics/presentation/states/selected_conversion_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

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

final statisticsControllerProvider = StateNotifierProvider<StatisticsController,
    AsyncValue<Either<Failure, StatisticsDataDto>>>((ref) {
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
  return SelectedDateState(SelectedDateMode.day);
});

/// Selected date for statistic's savings charts
final statisticsSavingsSelectedDateProvider =
    StateNotifierProvider<SelectedDateState, SelectedDateDto>((ref) {
  return SelectedDateState(SelectedDateMode.day);
});

/// Selected exchange for statistic's currency chart
final statisticsCurrencySelectedExchangeProvider =
    StateNotifierProvider<SelectedConversionState, SelectedConversionDto>(
        (ref) {
  final account = ref.watch(accountControllerProvider).asData?.value;
  final String currencyFrom =
      account != null ? account.prefCurrencyType : "EUR";
  String currencyTo = currencyFrom == "EUR" ? "USD" : "EUR";
  return SelectedConversionState(
      currencyFrom: currencyFrom, currencyTo: currencyTo);
});
