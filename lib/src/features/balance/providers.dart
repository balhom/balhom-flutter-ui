import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/presentation/models/selected_date.dart';
import 'package:balhom/src/core/presentation/models/selected_date_mode.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/balance/application/balance_create_controller.dart';
import 'package:balhom/src/features/balance/application/balance_edit_controller.dart';
import 'package:balhom/src/features/balance/application/balance_list_controller.dart';
import 'package:balhom/src/features/balance/application/balance_type_list_controller.dart';
import 'package:balhom/src/features/balance/application/balance_year_controller.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_type_entity.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/balance/domain/repositories/balance_repository_interface.dart';
import 'package:balhom/src/features/balance/domain/repositories/balance_type_respository_interface.dart';
import 'package:balhom/src/features/balance/infrastructure/datasources/local/balance_type_local_data_source.dart';
import 'package:balhom/src/features/balance/infrastructure/datasources/remote/balance_remote_data_source.dart';
import 'package:balhom/src/features/balance/infrastructure/datasources/remote/balance_type_remote_data_source.dart';
import 'package:balhom/src/features/balance/infrastructure/repositories/balance_repository.dart';
import 'package:balhom/src/features/balance/infrastructure/repositories/balance_type_respository.dart';
import 'package:balhom/src/features/balance/presentation/models/balance_limit_type.dart';
import 'package:balhom/src/features/balance/presentation/models/balance_ordering_type.dart';
import 'package:balhom/src/features/balance/presentation/states/balance_limit_type_state.dart';
import 'package:balhom/src/features/balance/presentation/states/balance_ordering_type_state.dart';
import 'package:balhom/src/core/presentation/states/selected_date_state.dart';
import 'package:balhom/src/features/statistics/domain/repositories/annual_balance_repository_interface.dart';
import 'package:balhom/src/features/statistics/domain/repositories/monthly_balance_repository_interface.dart';
import 'package:balhom/src/features/statistics/infrastructure/datasources/local/annual_balance_local_data_source.dart';
import 'package:balhom/src/features/statistics/infrastructure/datasources/local/monthly_balance_local_data_source.dart';
import 'package:balhom/src/features/statistics/infrastructure/datasources/remote/annual_balance_remote_data_source.dart';
import 'package:balhom/src/features/statistics/infrastructure/datasources/remote/monthly_balance_remote_data_source.dart';
import 'package:balhom/src/features/statistics/infrastructure/repositories/annual_balance_repository.dart';
import 'package:balhom/src/features/statistics/infrastructure/repositories/monthly_balance_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

///
/// Infrastructure dependencies
///

/// Balance type repository
final balanceTypeRepositoryProvider = Provider<BalanceTypeRepositoryInterface>(
    (ref) => BalanceTypeRepository(
        balanceTypeRemoteDataSource: BalanceTypeRemoteDataSource(
            apiClient: ref.read(balhomApiClientProvider)),
        balanceTypeLocalDataSource: BalanceTypeLocalDataSource(
            localDbClient: ref.read(localDbClientProvider))));

/// Balance repository
final balanceRepositoryProvider =
    Provider<BalanceRepositoryInterface>((ref) => BalanceRepository(
          balanceRemoteDataSource: BalanceRemoteDataSource(
              apiClient: ref.read(balhomApiClientProvider)),
        ));

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

final revenueListControllerProvider = StateNotifierProvider<
    BalanceListController,
    AsyncValue<Either<Failure, List<BalanceEntity>>>>((ref) {
  final balanceRepository = ref.watch(balanceRepositoryProvider);
  final selectedDate = ref.watch(revenueSelectedDateProvider);
  return BalanceListController(
      balanceRepository: balanceRepository,
      selectedDateDto: selectedDate,
      balanceTypeEnum: BalanceTypeEnum.revenue);
});

final expenseListControllerProvider = StateNotifierProvider<
    BalanceListController,
    AsyncValue<Either<Failure, List<BalanceEntity>>>>((ref) {
  final balanceRepository = ref.watch(balanceRepositoryProvider);
  final selectedDate = ref.watch(revenueSelectedDateProvider);
  return BalanceListController(
      balanceRepository: balanceRepository,
      selectedDateDto: selectedDate,
      balanceTypeEnum: BalanceTypeEnum.expense);
});

final balanceCreateControllerProvider =
    StateNotifierProvider<BalanceCreateController, AsyncValue<BalanceEntity?>>(
        (ref) {
  final balanceRepository = ref.watch(balanceRepositoryProvider);
  return BalanceCreateController(balanceRepository: balanceRepository);
});

final balanceEditControllerProvider =
    StateNotifierProvider<BalanceEditController, AsyncValue<BalanceEntity?>>(
        (ref) {
  final balanceRepository = ref.watch(balanceRepositoryProvider);
  return BalanceEditController(balanceRepository: balanceRepository);
});

final expenseTypeListControllerProvider = StateNotifierProvider<
    BalanceTypeListController, AsyncValue<List<BalanceTypeEntity>>>((ref) {
  final balanceTypeRepository = ref.watch(balanceTypeRepositoryProvider);
  return BalanceTypeListController(
      balanceTypeRepository: balanceTypeRepository,
      balanceTypeEnum: BalanceTypeEnum.expense);
});

final revenueTypeListControllerProvider = StateNotifierProvider<
    BalanceTypeListController, AsyncValue<List<BalanceTypeEntity>>>((ref) {
  final balanceTypeRepository = ref.watch(balanceTypeRepositoryProvider);
  return BalanceTypeListController(
      balanceTypeRepository: balanceTypeRepository,
      balanceTypeEnum: BalanceTypeEnum.revenue);
});

final balanceYearsControllerProvider =
    StateNotifierProvider<BalanceYearController, AsyncValue<List<int>>>((ref) {
  final balanceRepository = ref.watch(balanceRepositoryProvider);
  return BalanceYearController(balanceRepository: balanceRepository);
});

///
/// Presentation dependencies
///

/// Limit type for revenues
final revenueLimitTypeProvider =
    StateNotifierProvider<BalanceLimitTypeState, BalanceLimitTypeEnum>((ref) {
  return BalanceLimitTypeState(BalanceLimitTypeEnum.limit15);
});

/// Limit type for expenses
final expenseLimitTypeProvider =
    StateNotifierProvider<BalanceLimitTypeState, BalanceLimitTypeEnum>((ref) {
  return BalanceLimitTypeState(BalanceLimitTypeEnum.limit15);
});

/// Ordering type for revenues
final revenueOrderingTypeProvider =
    StateNotifierProvider<BalanceOrderingTypeState, BalanceOrderingTypeEnum>(
        (ref) {
  return BalanceOrderingTypeState(BalanceOrderingTypeEnum.date);
});

/// Ordering type for expenses
final expenseOrderingTypeProvider =
    StateNotifierProvider<BalanceOrderingTypeState, BalanceOrderingTypeEnum>(
        (ref) {
  return BalanceOrderingTypeState(BalanceOrderingTypeEnum.date);
});

/// Selected date for revenues
final revenueSelectedDateProvider =
    StateNotifierProvider<SelectedDateState, SelectedDateDto>((ref) {
  return SelectedDateState(SelectedDateEnum.month);
});

/// Selected date for expenses
final expenseSelectedDateProvider =
    StateNotifierProvider<SelectedDateState, SelectedDateDto>((ref) {
  return SelectedDateState(SelectedDateEnum.month);
});