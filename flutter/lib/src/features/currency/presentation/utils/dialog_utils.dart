import 'package:balance_home_app/src/core/router.dart';
import 'package:balance_home_app/src/core/presentation/widgets/info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<bool> showCurrencyChangeAdviceDialog(AppLocalizations appLocalizations,
    double newBalance, String currencyType) async {
  return (await showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) => InfoDialog(
                dialogTitle: appLocalizations.accountEditDialogTitle,
                dialogDescription: appLocalizations
                    .accountCurrencyChangeDescription
                    .replaceFirst("%%", "$newBalance $currencyType"),
                confirmationText: appLocalizations.confirmation,
                cancelText: appLocalizations.cancel,
                onConfirmation: () => Navigator.pop(context, true),
                onCancel: () => Navigator.pop(context, false),
              ))) ??
      false;
}
