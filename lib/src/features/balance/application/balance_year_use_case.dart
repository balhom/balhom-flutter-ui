import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/balance/domain/repositories/balance_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceYearUseCase extends StateNotifier<AsyncValue<List<int>>> {
  final BalanceRepositoryInterface balanceRepository;

  BalanceYearUseCase({required this.balanceRepository})
      : super(const AsyncValue.loading()) {
    handle();
  }

  Future<void> handle() async {
    final revenueYears =
        await balanceRepository.getBalanceYears(BalanceTypeEnum.revenue);
    final expenseYears =
        await balanceRepository.getBalanceYears(BalanceTypeEnum.expense);
    final years = <int>{...revenueYears, ...expenseYears}.toList();
    if (!years.contains(DateTime.now().year)) {
      years.add(DateTime.now().year);
    }
    years.sort();
    state = AsyncData(years);
  }
}
