import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/balance/presentation/views/balance_panel_view.dart';
import 'package:balhom/src/features/balance/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceView extends ConsumerWidget {
  /// Named route for revenues [BalanceView]
  static const String routeRevenueName = 'revenues';

  /// Path route for revenues [BalanceView]
  static const String routeRevenuePath = 'revenues';

  /// Named route for expenses [BalanceView]
  static const String routeExpenseName = 'expenses';

  /// Path route for expenses [BalanceView]
  static const String routeExpensePath = 'expenses';

  final BalanceTypeEnum balanceTypeEnum;

  const BalanceView({required this.balanceTypeEnum, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: loadData(ref),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return showLoading();
          }
          return BalancePanelView(balanceTypeEnum: balanceTypeEnum);
        });
  }

  Future<void> loadData(WidgetRef ref) async {
    if (balanceTypeEnum.isExpense()) {
      final selectedDate = ref.read(expenseSelectedDateProvider);
      final sorting = ref.read(expenseSortingProvider);
      await ref
          .read(balanceListUseCaseProvider.notifier)
          .handle(selectedDate, BalanceTypeEnum.expense, sorting, 1);
    } else {
      final selectedDate = ref.read(revenueSelectedDateProvider);
      final sorting = ref.read(revenueSortingProvider);
      await ref
          .read(balanceListUseCaseProvider.notifier)
          .handle(selectedDate, BalanceTypeEnum.revenue, sorting, 1);
    }
  }
}
