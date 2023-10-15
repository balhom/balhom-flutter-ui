import 'package:balance_home_app/src/core/presentation/widgets/info_dialog.dart';
import 'package:balance_home_app/src/core/router.dart';
import 'package:balance_home_app/src/core/presentation/widgets/app_error_dialog.dart';
import 'package:balance_home_app/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> showErrorBalanceCreationDialog(AppLocalizations appLocalizations,
    final String error, final BalanceTypeEnum balanceTypeEnum) async {
  await showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AppErrorDialog(
            dialogTitle: balanceTypeEnum.isExpense()
                ? appLocalizations.expenseCreateDialogTitle
                : appLocalizations.revenueCreateDialogTitle,
            dialogDescription: error,
            cancelText: appLocalizations.cancel,
          ));
}

Future<void> showErrorBalanceEditDialog(AppLocalizations appLocalizations,
    final String error, final BalanceTypeEnum balanceTypeEnum) async {
  await showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AppErrorDialog(
            dialogTitle: balanceTypeEnum.isExpense()
                ? appLocalizations.expenseEditDialogTitle
                : appLocalizations.revenueEditDialogTitle,
            dialogDescription: error,
            cancelText: appLocalizations.cancel,
          ));
}

Future<bool> showDeleteAdviceDialog(final BalanceTypeEnum balanceTypeEnum,
    final AppLocalizations appLocalizations) async {
  return (await showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) => InfoDialog(
                dialogTitle: balanceTypeEnum.isExpense()
                    ? appLocalizations.expenseDeleteDialogTitle
                    : appLocalizations.revenueDeleteDialogTitle,
                dialogDescription: balanceTypeEnum.isExpense()
                    ? appLocalizations.expenseDialogDescription
                    : appLocalizations.revenueDialogDescription,
                confirmationText: appLocalizations.confirmation,
                cancelText: appLocalizations.cancel,
                onConfirmation: () => Navigator.pop(context, true),
                onCancel: () => Navigator.pop(context, false),
              ))) ??
      false;
}
