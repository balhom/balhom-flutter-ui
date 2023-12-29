import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/balance/presentation/views/balance_create_view.dart';
import 'package:balhom/src/features/balance/presentation/views/balance_view.dart';
import 'package:balhom/src/features/balance/presentation/widgets/balance_card.dart';
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

    return Stack(children: <Widget>[
      ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: balances.length,
        itemBuilder: (BuildContext context, int index) {
          return BalanceCard(
              balance: balances[index], balanceTypeEnum: balanceTypeEnum);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.transparent,
        ),
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
}
