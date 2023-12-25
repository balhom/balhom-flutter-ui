import 'package:balhom/src/core/presentation/widgets/app_text_button.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/balance/presentation/widgets/balance_limit_type_dialog.dart';
import 'package:balhom/src/features/balance/presentation/widgets/balance_list.dart';
import 'package:balhom/src/features/balance/presentation/widgets/balance_ordering_type_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanaceRightPanel extends ConsumerWidget {
  final List<BalanceEntity> balances;
  final BalanceTypeEnum balanceTypeEnum;

  const BalanaceRightPanel({required this.balances, required this.balanceTypeEnum, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: balanceTypeEnum.isExpense()
          ? const Color.fromARGB(254, 236, 182, 163)
          : const Color.fromARGB(254, 174, 221, 148),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextButton(
                  width: (screenWidth * 0.1 > 160)
                      ? 160
                      : (screenWidth * 0.1 < 100)
                          ? 100
                          : screenWidth * 0.1,
                  height: 50,
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : null,
                  textColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : null,
                  onPressed: () {
                    showOrderingDialog(context);
                  },
                  text: appLocalizations.orderBy),
              const SizedBox(width: 30),
              AppTextButton(
                  width: (screenWidth * 0.1 > 160)
                      ? 160
                      : (screenWidth * 0.1 < 100)
                          ? 100
                          : screenWidth * 0.1,
                  height: 50,
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : null,
                  textColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : null,
                  onPressed: () {
                    showLimitDialog(context);
                  },
                  text: appLocalizations.limit)
            ],
          ),
          const SizedBox(height: 10),
          Expanded(child: BalanceList(balances: balances, balanceTypeEnum: balanceTypeEnum)),
        ],
      ),
    );
  }

  @visibleForTesting
  showOrderingDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return BalanceOrderingTypeDialog(balanceTypeEnum: balanceTypeEnum);
      });

  @visibleForTesting
  showLimitDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return BalanceLimitTypeDialog(balanceTypeEnum: balanceTypeEnum);
      });
}
