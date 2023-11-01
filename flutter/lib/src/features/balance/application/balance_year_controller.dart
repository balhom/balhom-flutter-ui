import 'package:balance_home_app/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balance_home_app/src/features/balance/domain/repositories/balance_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceYearController extends StateNotifier<AsyncValue<List<int>>> {
  final BalanceRepositoryInterface balanceRepository;

  BalanceYearController({required this.balanceRepository})
      : super(const AsyncValue.loading()) {
    get();
  }

  Future<void> get() async {
    final revenueYears =
        await balanceRepository.getBalanceYears(BalanceTypeEnum.revenue);
    final expenseYears =
        await balanceRepository.getBalanceYears(BalanceTypeEnum.expense);
    state = AsyncData(<int>{...revenueYears, ...expenseYears}.toList());
  }
}
