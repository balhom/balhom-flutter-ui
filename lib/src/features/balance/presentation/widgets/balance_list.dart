import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/balance/presentation/models/balance_limit_type.dart';
import 'package:balhom/src/features/balance/presentation/models/balance_ordering_type.dart';
import 'package:balhom/src/features/balance/presentation/views/balance_create_view.dart';
import 'package:balhom/src/features/balance/presentation/views/balance_view.dart';
import 'package:balhom/src/features/balance/presentation/widgets/balance_card.dart';
import 'package:balhom/src/features/balance/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BalanceList extends ConsumerWidget {
  final BalanceTypeEnum balanceTypeEnum;
  final List<BalanceEntity> balances;

  const BalanceList(
      {required this.balances, required this.balanceTypeEnum, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = connectionStateListenable.value;

    final orderingType = balanceTypeEnum.isExpense()
        ? ref.watch(expenseOrderingTypeProvider)
        : ref.watch(revenueOrderingTypeProvider);

    final limitType = balanceTypeEnum.isExpense()
        ? ref.watch(expenseLimitTypeProvider)
        : ref.watch(revenueLimitTypeProvider);

    final List<BalanceEntity> balanceList =
        orderBalances(orderingType, limitType);

    return Stack(children: <Widget>[
      ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: balanceList.length,
        itemBuilder: (BuildContext context, int index) {
          return BalanceCard(
              balance: balanceList[index], balanceTypeEnum: balanceTypeEnum);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.bottomCenter,
        child: isConnected
            ? FloatingActionButton(
                onPressed: () async {
                  if (balanceTypeEnum.isExpense()) {
                    context.push(
                        "/${BalanceView.routeExpensePath}/${BalanceCreateView.routePath}");
                  } else {
                    context.push(
                        "/${BalanceView.routeRevenuePath}/${BalanceCreateView.routePath}");
                  }
                },
                backgroundColor:
                    balanceTypeEnum.isExpense() ? Colors.orange : Colors.green,
                child: const Icon(Icons.add),
              )
            : null,
      ),
    ]);
  }

  @visibleForTesting
  List<BalanceEntity> orderBalances(
      BalanceOrderingTypeEnum orderingType, BalanceLimitTypeEnum limitType) {
    List<BalanceEntity> aux = [];
    for (BalanceEntity balance in balances) {
      int i = 0;
      while (i < aux.length) {
        // Case Date ordering
        if (orderingType == BalanceOrderingTypeEnum.date &&
            balance.date.isAfter(aux.elementAt(i).date)) break;
        // Case Quantity ordering
        if (orderingType == BalanceOrderingTypeEnum.quantity &&
            balance.convertedQuantity! > aux.elementAt(i).convertedQuantity!) {
          break;
        }
        // Case Name ordering
        if (orderingType == BalanceOrderingTypeEnum.name &&
            balance.name.compareTo(aux.elementAt(i).name) < 0) break;
        i++;
      }
      aux.insert(i, balance);
    }
    if (limitType != BalanceLimitTypeEnum.none) {
      if (limitType == BalanceLimitTypeEnum.limit5) {
        aux = aux.take(5).toList();
      } else if (limitType == BalanceLimitTypeEnum.limit15) {
        aux = aux.take(15).toList();
      }
    }
    return aux;
  }
}
