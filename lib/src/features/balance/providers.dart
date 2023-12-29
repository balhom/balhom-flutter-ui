import 'package:balhom/src/core/domain/dtos/selected_date_dto.dart';
import 'package:balhom/src/core/domain/enums/selected_date_enum.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/balance/application/balance_create_use_case.dart';
import 'package:balhom/src/features/balance/application/balance_delete_use_case.dart';
import 'package:balhom/src/features/balance/application/balance_edit_use_case.dart';
import 'package:balhom/src/features/balance/application/balance_list_use_case.dart';
import 'package:balhom/src/features/balance/application/balance_type_list_use_case.dart';
import 'package:balhom/src/features/balance/application/balance_year_use_case.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_type_entity.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_sorting_enum.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/balance/domain/repositories/balance_repository_interface.dart';
import 'package:balhom/src/features/balance/domain/repositories/balance_type_respository_interface.dart';
import 'package:balhom/src/features/balance/infrastructure/datasources/local/balance_type_local_data_source.dart';
import 'package:balhom/src/features/balance/infrastructure/datasources/remote/balance_remote_data_source.dart';
import 'package:balhom/src/features/balance/infrastructure/datasources/remote/balance_type_remote_data_source.dart';
import 'package:balhom/src/features/balance/infrastructure/repositories/balance_repository.dart';
import 'package:balhom/src/features/balance/infrastructure/repositories/balance_type_respository.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_limit_type_enum.dart';
import 'package:balhom/src/features/balance/presentation/states/balance_limit_type_state.dart';
import 'package:balhom/src/features/balance/presentation/states/balance_sorting_state.dart';
import 'package:balhom/src/core/presentation/states/selected_date_state.dart';
import 'package:balhom/src/features/statistics/domain/repositories/annual_savings_repository_interface.dart';
import 'package:balhom/src/features/statistics/domain/repositories/monthly_savings_repository_interface.dart';
import 'package:balhom/src/features/statistics/infrastructure/datasources/local/annual_savings_local_data_source.dart';
import 'package:balhom/src/features/statistics/infrastructure/datasources/local/monthly_savings_local_data_source.dart';
import 'package:balhom/src/features/statistics/infrastructure/datasources/remote/annual_savings_remote_data_source.dart';
import 'package:balhom/src/features/statistics/infrastructure/datasources/remote/monthly_savings_remote_data_source.dart';
import 'package:balhom/src/features/statistics/infrastructure/repositories/annual_savings_repository.dart';
import 'package:balhom/src/features/statistics/infrastructure/repositories/monthly_savings_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    Provider<AnnualSavingsRepositoryInterface>((ref) => AnnualSavingsRepository(
        annualBalanceRemoteDataSource: AnnualSavingsRemoteDataSource(
            apiClient: ref.read(balhomApiClientProvider)),
        annualBalanceLocalDataSource: AnnualSavingsLocalDataSource(
            localDbClient: ref.read(localDbClientProvider))));

/// Monthly balance repository
final monthlyBalanceRepositoryProvider =
    Provider<MonthlySavingsRepositoryInterface>((ref) =>
        MonthlySavingsRepository(
            monthlyBalanceRemoteDataSource: MonthlySavingsRemoteDataSource(
                apiClient: ref.read(balhomApiClientProvider)),
            monthlyBalanceLocalDataSource: MonthlySavingLocalDataSource(
                localDbClient: ref.read(localDbClientProvider))));

///
/// Application dependencies
///

final balanceListUseCaseProvider =
    StateNotifierProvider<BalanceListUseCase, AsyncValue<List<BalanceEntity>>>(
        (ref) {
  final balanceRepository = ref.watch(balanceRepositoryProvider);
  return BalanceListUseCase(balanceRepository: balanceRepository);
});

final balanceCreateUseCaseProvider =
    StateNotifierProvider<BalanceCreateUseCase, AsyncValue<void>>((ref) {
  final balanceRepository = ref.watch(balanceRepositoryProvider);
  return BalanceCreateUseCase(balanceRepository: balanceRepository);
});

final balanceEditControllerProvider =
    StateNotifierProvider<BalanceEditUseCase, AsyncValue<void>>((ref) {
  final balanceRepository = ref.watch(balanceRepositoryProvider);
  return BalanceEditUseCase(balanceRepository: balanceRepository);
});

final balanceDeleteUseCaseProvider =
    StateNotifierProvider<BalanceDeleteUseCase, AsyncValue<void>>((ref) {
  final balanceRepository = ref.watch(balanceRepositoryProvider);
  return BalanceDeleteUseCase(balanceRepository: balanceRepository);
});

final expenseTypeListUseCaseProvider = StateNotifierProvider<
    BalanceTypeListUseCase, AsyncValue<List<BalanceTypeEntity>>>((ref) {
  final balanceTypeRepository = ref.watch(balanceTypeRepositoryProvider);
  return BalanceTypeListUseCase(
      balanceTypeRepository: balanceTypeRepository,
      balanceTypeEnum: BalanceTypeEnum.expense);
});

final revenueTypeListUseCaseProvider = StateNotifierProvider<
    BalanceTypeListUseCase, AsyncValue<List<BalanceTypeEntity>>>((ref) {
  final balanceTypeRepository = ref.watch(balanceTypeRepositoryProvider);
  return BalanceTypeListUseCase(
      balanceTypeRepository: balanceTypeRepository,
      balanceTypeEnum: BalanceTypeEnum.revenue);
});

final balanceYearsUseCaseProvider =
    StateNotifierProvider<BalanceYearUseCase, AsyncValue<List<int>>>((ref) {
  final balanceRepository = ref.watch(balanceRepositoryProvider);
  return BalanceYearUseCase(balanceRepository: balanceRepository);
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

/// Sorting for revenues
final revenueSortingProvider =
    StateNotifierProvider<BalanceSortingState, BalanceSortingEnum>((ref) {
  return BalanceSortingState(BalanceSortingEnum.descDate);
});

/// Sorting for expenses
final expenseSortingProvider =
    StateNotifierProvider<BalanceSortingState, BalanceSortingEnum>((ref) {
  return BalanceSortingState(BalanceSortingEnum.descDate);
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
