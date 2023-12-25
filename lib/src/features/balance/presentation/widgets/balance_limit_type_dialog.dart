import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/balance/presentation/models/balance_limit_type.dart';
import 'package:balhom/src/features/balance/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceLimitTypeDialog extends ConsumerWidget {
  final BalanceTypeEnum balanceTypeEnum;

  const BalanceLimitTypeDialog({required this.balanceTypeEnum, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balanceLimitTypeNotifier = balanceTypeEnum.isExpense()
        ? ref.read(expenseLimitTypeProvider.notifier)
        : ref.read(revenueLimitTypeProvider.notifier);

    final BalanceLimitTypeEnum limitType = balanceTypeEnum.isExpense()
        ? ref.watch(expenseLimitTypeProvider)
        : ref.watch(revenueLimitTypeProvider);
    final appLocalizations = ref.read(appLocalizationsProvider);
    return AlertDialog(
        title: balanceTypeEnum.isExpense()
            ? Text(appLocalizations.maxExpenseDialoTitle)
            : Text(appLocalizations.maxRevenueDialoTitle),
        content: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BalanceLimitTypeEnum.limit5,
                BalanceLimitTypeEnum.limit15,
                BalanceLimitTypeEnum.none,
              ]
                  .map((e) => RadioListTile(
                        title: Text(e == BalanceLimitTypeEnum.limit5
                            ? "5"
                            : e == BalanceLimitTypeEnum.limit15
                                ? "15"
                                : appLocalizations.noLimit),
                        value: e,
                        groupValue: limitType,
                        selected: limitType == e,
                        onChanged: (value) {
                          if (value != limitType) {
                            Navigator.pop(context);
                            balanceLimitTypeNotifier.setBalanceLimitType(e);
                          }
                        },
                      ))
                  .toList(),
            ),
          ),
        ));
  }
}
