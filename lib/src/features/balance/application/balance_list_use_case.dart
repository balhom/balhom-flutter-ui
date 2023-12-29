import 'package:balhom/src/core/domain/dtos/selected_date_dto.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_limit_type_enum.dart';
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
      final BalanceLimitTypeEnum balanceLimitTypeEnum) async {
    final List<BalanceEntity> entities = [];
    int page = 1;
    while (true) {
      final res = await balanceRepository.getBalances(
          dateFrom: selectedDateDto.dateFrom,
          dateTo: selectedDateDto.dateTo,
          balanceTypeEnum: balanceTypeEnum,
          balanceSortingEnum: balanceSortingEnum,
          page: page);
      res.fold((failure) {
        if (balanceLimitTypeEnum == BalanceLimitTypeEnum.none) {
          state = AsyncValue.data(entities);
        } else {
          state = AsyncValue.error(failure, StackTrace.empty);
        }
      }, (newEntities) {
        entities.addAll(newEntities);
      });
      if (res.isLeft()) {
        return;
      }
      if (balanceLimitTypeEnum == BalanceLimitTypeEnum.limit5) {
        state = AsyncValue.data(entities.take(5).toList());
        return;
      } else if (balanceLimitTypeEnum == BalanceLimitTypeEnum.limit15) {
        state = AsyncValue.data(entities.take(15).toList());
        return;
      }
      page++;
    }
  }
}
