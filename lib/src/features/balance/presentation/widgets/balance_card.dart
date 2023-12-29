import 'package:balhom/config/app_layout.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/account/providers.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/balance/presentation/utils/dialog_utils.dart';
import 'package:balhom/src/features/balance/presentation/views/balance_edit_view.dart';
import 'package:balhom/src/features/balance/presentation/views/balance_view.dart';
import 'package:balhom/src/features/balance/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class BalanceCard extends ConsumerWidget {
  final BalanceEntity balance;
  final BalanceTypeEnum balanceTypeEnum;
  final dateFormat = DateFormat("dd-MM-yyyy");

  BalanceCard(
      {required this.balance, required this.balanceTypeEnum, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = connectionStateListenable.value;

    final appLocalizations = ref.watch(appLocalizationsProvider);

    final accountGetUseCase = ref.read(accountGetUseCaseProvider.notifier);
    final balanceListUseCase = ref.read(balanceListUseCaseProvider.notifier);
    final balanceDeleteUseCase =
        ref.read(balanceDeleteUseCaseProvider.notifier);
    final balanceSelectedDateState = balanceTypeEnum.isExpense()
        ? ref.read(expenseSelectedDateProvider)
        : ref.read(revenueSelectedDateProvider);
    final balanceSortingState = balanceTypeEnum.isExpense()
        ? ref.read(expenseSortingProvider)
        : ref.read(revenueSortingProvider);

    return GestureDetector(
      onTap: () {
        context.pushNamed(
            (balanceTypeEnum == BalanceTypeEnum.expense
                    ? BalanceView.routeExpenseName
                    : BalanceView.routeRevenueName) +
                BalanceEditView.routeName,
            queryParameters: {"id": "${balance.id}"});
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.cardRadius),
        ),
        color: Theme.of(context).brightness == Brightness.light
            ? const Color.fromARGB(255, 232, 234, 246)
            : const Color.fromARGB(255, 123, 127, 148),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.network(balance.balanceType.image),
              title: Text(balance.name, overflow: TextOverflow.ellipsis),
              subtitle: Text("${balance.realQuantity} ${balance.currencyType}",
                  overflow: TextOverflow.ellipsis),
              trailing: Text(dateFormat.format(balance.date)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      // If the button is pressed, return grey, otherwise red
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.red;
                    }),
                  ),
                  onPressed: (isConnected)
                      ? () async {
                          if (await showDeleteAdviceDialog(
                              balanceTypeEnum, appLocalizations)) {
                            await balanceDeleteUseCase.handle(
                                balance.id!, appLocalizations);
                            await balanceListUseCase.handle(
                                balanceSelectedDateState,
                                balanceTypeEnum,
                                balanceSortingState,
                                1);
                            await accountGetUseCase.handle();
                          }
                        }
                      : null,
                  child: const Icon(
                    Icons.delete,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
