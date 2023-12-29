import 'package:balhom/src/core/domain/dtos/selected_date_dto.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_sorting_enum.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/balance/domain/repositories/balance_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceListUseCase
    extends StateNotifier<AsyncValue<List<BalanceEntity>>> {
  final BalanceRepositoryInterface balanceRepository;

  BalanceListUseCase({required this.balanceRepository})
      : super(const AsyncValue.data([]));

  Future<void> handle(
      final SelectedDateDto selectedDateDto,
      final BalanceTypeEnum balanceTypeEnum,
      final BalanceSortingEnum balanceSortingEnum,
      final int page,
      {final bool append = false}) async {
    final cachedState = state;
    //state = const AsyncValue.loading();
    final res = await balanceRepository.getBalances(
        dateFrom: selectedDateDto.dateFrom,
        dateTo: selectedDateDto.dateTo,
        balanceTypeEnum: balanceTypeEnum,
        balanceSortingEnum: balanceSortingEnum,
        page: page);
    state = res.fold((failure) {
      return AsyncValue.error(failure, StackTrace.empty);
    }, (entities) {
      if (append && cachedState.hasValue) {
        entities.addAll(cachedState.asData!.value);
      }
      return AsyncValue.data(entities);
    });
  }
}
