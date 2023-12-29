import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/account/providers.dart';
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

  final cache = ValueNotifier<Widget>(Container());

  final BalanceTypeEnum balanceTypeEnum;

  BalanceView({required this.balanceTypeEnum, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: loadData(ref),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return showLoading(background: cache.value);
          }
          cache.value = BalancePanelView(balanceTypeEnum: balanceTypeEnum);
          return cache.value;
        });
  }

  Future<void> loadData(WidgetRef ref) async {
    // Listen account changes
    ref.watch(accountGetUseCaseProvider);

    final balanceSelectedDateState = balanceTypeEnum.isExpense()
        ? ref.watch(expenseSelectedDateProvider)
        : ref.watch(revenueSelectedDateProvider);
    final balanceSortingState = balanceTypeEnum.isExpense()
        ? ref.watch(expenseSortingProvider)
        : ref.watch(revenueSortingProvider);
    final balanceLimitTypeState = balanceTypeEnum.isExpense()
        ? ref.watch(expenseLimitTypeProvider)
        : ref.watch(revenueLimitTypeProvider);
    await ref.watch(balanceListUseCaseProvider.notifier).handle(
        balanceSelectedDateState,
        balanceTypeEnum,
        balanceSortingState,
        balanceLimitTypeState);
    await ref
        .read(balanceStatisticsUseCaseProvider.notifier)
        .handle(balanceSelectedDateState);
    await ref
        .read(balanceSummaryUseCaseProvider.notifier)
        .handle(balanceTypeEnum, balanceSelectedDateState);
  }
}
