import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/balance/presentation/models/balance_ordering_type.dart';
import 'package:balhom/src/features/balance/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceOrderingTypeDialog extends ConsumerWidget {
  final BalanceTypeEnum balanceTypeEnum;

  const BalanceOrderingTypeDialog({required this.balanceTypeEnum, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balanceOrderingTypeNotifier = balanceTypeEnum.isExpense()
        ? ref.read(expenseOrderingTypeProvider.notifier)
        : ref.read(revenueOrderingTypeProvider.notifier);
    final BalanceOrderingTypeEnum orderingType = balanceTypeEnum.isExpense()
        ? ref.watch(expenseOrderingTypeProvider)
        : ref.watch(revenueOrderingTypeProvider);
    final appLocalizations = ref.read(appLocalizationsProvider);
    return AlertDialog(
        title: Text(appLocalizations.orderBy),
        content: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BalanceOrderingTypeEnum.date,
                BalanceOrderingTypeEnum.name,
                BalanceOrderingTypeEnum.quantity,
              ]
                  .map((e) => RadioListTile(
                        title: Text((e == BalanceOrderingTypeEnum.date)
                            ? appLocalizations.date
                            : (e == BalanceOrderingTypeEnum.name)
                                ? appLocalizations.name
                                : appLocalizations.quantity),
                        value: e,
                        groupValue: orderingType,
                        selected: orderingType == e,
                        onChanged: (value) {
                          if (value != orderingType) {
                            Navigator.pop(context);
                            balanceOrderingTypeNotifier
                                .setBalanceOrderingType(e);
                          }
                        },
                      ))
                  .toList(),
            ),
          ),
        ));
  }
}
