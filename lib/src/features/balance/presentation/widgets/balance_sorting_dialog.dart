import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_sorting_enum.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/balance/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceOrderingTypeDialog extends ConsumerWidget {
  final BalanceTypeEnum balanceTypeEnum;

  const BalanceOrderingTypeDialog({required this.balanceTypeEnum, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balanceOrderingTypeNotifier = balanceTypeEnum.isExpense()
        ? ref.read(expenseSortingProvider.notifier)
        : ref.read(revenueSortingProvider.notifier);
    final BalanceSortingEnum sortingEnum = balanceTypeEnum.isExpense()
        ? ref.watch(expenseSortingProvider)
        : ref.watch(revenueSortingProvider);
    final appLocalizations = ref.read(appLocalizationsProvider);
    return AlertDialog(
        title: Text(appLocalizations.orderBy),
        content: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BalanceSortingEnum.descDate,
                BalanceSortingEnum.name,
                BalanceSortingEnum.descConvertedQuantity,
              ]
                  .map((e) => RadioListTile(
                        title: Text((e == BalanceSortingEnum.descDate)
                            ? appLocalizations.date
                            : (e == BalanceSortingEnum.name)
                                ? appLocalizations.name
                                : appLocalizations.quantity),
                        value: e,
                        groupValue: sortingEnum,
                        selected: sortingEnum == e,
                        onChanged: (value) {
                          if (value != sortingEnum) {
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
