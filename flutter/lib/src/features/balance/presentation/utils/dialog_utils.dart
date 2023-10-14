import 'package:balance_home_app/src/core/router.dart';
import 'package:balance_home_app/src/core/presentation/widgets/app_error_dialog.dart';
import 'package:balance_home_app/src/features/balance/domain/repositories/balance_type_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> showErrorBalanceCreationDialog(AppLocalizations appLocalizations,
    String error, BalanceTypeMode balanceTypeMode) async {
  await showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AppErrorDialog(
            dialogTitle: balanceTypeMode == BalanceTypeMode.expense
                ? appLocalizations.expenseCreateDialogTitle
                : appLocalizations.revenueCreateDialogTitle,
            dialogDescription: error,
            cancelText: appLocalizations.cancel,
          ));
}

Future<void> showErrorBalanceEditDialog(AppLocalizations appLocalizations,
    String error, BalanceTypeMode balanceTypeMode) async {
  await showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AppErrorDialog(
            dialogTitle: balanceTypeMode == BalanceTypeMode.expense
                ? appLocalizations.expenseEditDialogTitle
                : appLocalizations.revenueEditDialogTitle,
            dialogDescription: error,
            cancelText: appLocalizations.cancel,
          ));
}
