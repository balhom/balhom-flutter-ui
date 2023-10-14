import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/presentation/models/selected_date.dart';
import 'package:balance_home_app/src/core/presentation/models/selected_date_mode.dart';
import 'package:balance_home_app/src/core/presentation/states/selected_date_state.dart';
import 'package:balance_home_app/src/core/providers.dart';
import 'package:balance_home_app/src/features/account/providers.dart';
import 'package:balance_home_app/src/features/balance/providers.dart';
import 'package:balance_home_app/src/features/currency/providers.dart';
import 'package:balance_home_app/src/features/statistics/application/statistics_controller.dart';
import 'package:balance_home_app/src/features/statistics/domain/dtos/statistics_data_dto.dart';
import 'package:balance_home_app/src/features/statistics/domain/repositories/annual_balance_repository_interface.dart';
import 'package:balance_home_app/src/features/statistics/domain/repositories/monthly_balance_repository_interface.dart';
import 'package:balance_home_app/src/features/statistics/infrastructure/datasources/local/annual_balance_local_data_source.dart';
import 'package:balance_home_app/src/features/statistics/infrastructure/datasources/local/monthly_balance_local_data_source.dart';
import 'package:balance_home_app/src/features/statistics/infrastructure/datasources/remote/annual_balance_remote_data_source.dart';
import 'package:balance_home_app/src/features/statistics/infrastructure/datasources/remote/monthly_balance_remote_data_source.dart';
import 'package:balance_home_app/src/features/statistics/infrastructure/repositories/annual_balance_repository.dart';
import 'package:balance_home_app/src/features/statistics/infrastructure/repositories/monthly_balance_repository.dart';
import 'package:balance_home_app/src/features/statistics/presentation/states/selected_conversion_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

///
/// Infrastructure dependencies
///

/// Annual balance repository
final annualBalanceRepositoryProvider =
    Provider<AnnualBalanceRepositoryInterface>((ref) => AnnualBalanceRepository(
        annualBalanceRemoteDataSource: AnnualBalanceRemoteDataSource(
            apiClient: ref.read(balhomApiClientProvider)),
        annualBalanceLocalDataSource: AnnualBalanceLocalDataSource(
            localDbClient: ref.read(localDbClientProvider))));

/// Monthly balance repository
final monthlyBalanceRepositoryProvider =
    Provider<MonthlyBalanceRepositoryInterface>((ref) =>
        MonthlyBalanceRepository(
            monthlyBalanceRemoteDataSource: MonthlyBalanceRemoteDataSource(
                apiClient: ref.read(balhomApiClientProvider)),
            monthlyBalanceLocalDataSource: MonthlyBalanceLocalDataSource(
                localDbClient: ref.read(localDbClientProvider))));

///
/// Application dependencies
///

final statisticsControllerProvider = StateNotifierProvider<StatisticsController,
    AsyncValue<Either<Failure, StatisticsDataDto>>>((ref) {
  final balanceRepo = ref.watch(balanceRepositoryProvider);
  final annualBalanceRepo = ref.watch(annualBalanceRepositoryProvider);
  final monthlyBalanceRepo = ref.watch(monthlyBalanceRepositoryProvider);
  final currencyTypeRepo = ref.watch(currencyRepositoryProvider);
  final currencyConversionRepo = ref.watch(currencyRepositoryProvider);
  final selectedBalanceDate = ref.watch(statisticsBalanceSelectedDateProvider);
  final selectedSavingsDate = ref.watch(statisticsSavingsSelectedDateProvider);
  return StatisticsController(
      balanceRepository: balanceRepo,
      annualBalanceRepository: annualBalanceRepo,
      monthlyBalanceRepository: monthlyBalanceRepo,
      currencyTypeRepository: currencyTypeRepo,
      currencyConversionRepository: currencyConversionRepo,
      selectedBalanceDate: selectedBalanceDate,
      selectedSavingsDate: selectedSavingsDate);
});

///
/// Presentation dependencies
///

/// Selected date for statistic's balance charts
final statisticsBalanceSelectedDateProvider =
    StateNotifierProvider<SelectedDateState, SelectedDate>((ref) {
  return SelectedDateState(SelectedDateMode.day);
});

/// Selected date for statistic's savings charts
final statisticsSavingsSelectedDateProvider =
    StateNotifierProvider<SelectedDateState, SelectedDate>((ref) {
  return SelectedDateState(SelectedDateMode.day);
});

/// Selected exchange for statistic's currency chart
final statisticsCurrencySelectedExchangeProvider =
    StateNotifierProvider<SelectedConversionState, SelectedExchange>((ref) {
  final account = ref.watch(accountControllerProvider).asData?.value;
  final String currencyFrom =
      account != null ? account.prefCurrencyType : "EUR";
  String currencyTo = currencyFrom == "EUR" ? "USD" : "EUR";
  return SelectedConversionState(currencyFrom: currencyFrom, currencyTo: currencyTo);
});
