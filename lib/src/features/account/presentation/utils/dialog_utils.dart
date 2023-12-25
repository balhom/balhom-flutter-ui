import 'package:balhom/src/core/router.dart';
import 'package:balhom/src/core/presentation/widgets/app_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> showErrorAccountEditDialog(
    AppLocalizations appLocalizations, String error) async {
  await showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AppErrorDialog(
            title: appLocalizations.accountEditDialogTitle,
            description: error,
            cancelText: appLocalizations.cancel,
          ));
}
