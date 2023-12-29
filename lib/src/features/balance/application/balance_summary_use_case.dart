import 'package:balhom/src/core/domain/dtos/selected_date_dto.dart';
import 'package:balhom/src/core/domain/enums/selected_date_enum.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_summary_entity.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/balance/domain/repositories/balance_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceSummaryUseCase
    extends StateNotifier<AsyncValue<List<BalanceSummaryEntity>>> {
  final BalanceRepositoryInterface balanceRepository;

  BalanceSummaryUseCase({required this.balanceRepository})
      : super(const AsyncValue.loading());

  Future<void> handle(final BalanceTypeEnum balanceTypeEnum, final SelectedDateDto date) async {
    state = const AsyncValue.loading();
    final res = (date.selectedDateMode != SelectedDateEnum.year)
        ? await balanceRepository.getMonthSummary(balanceTypeEnum, date.month, date.year)
        : await balanceRepository.getYearSummary(balanceTypeEnum, date.year);
    return res.fold(
        (failure) => state = AsyncValue.error(failure, StackTrace.empty),
        (value) => state = AsyncValue.data(value));
  }
}
