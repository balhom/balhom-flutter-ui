import 'package:balance_home_app/config/app_colors.dart';
import 'package:balance_home_app/src/core/router.dart';
import 'package:balance_home_app/src/core/presentation/views/app_error_view.dart';
import 'package:balance_home_app/src/core/presentation/widgets/info_dialog.dart';
import 'package:balance_home_app/src/core/presentation/widgets/app_loading_widget.dart';
import 'package:balance_home_app/src/core/providers.dart';
import 'package:balance_home_app/src/features/account/providers.dart';
import 'package:balance_home_app/src/features/auth/presentation/views/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountDeleteView extends ConsumerWidget {
  /// Named route for [AccountDeleteView]
  static const String routeName = 'accountDelete';

  /// Path route for [AccountDeleteView]
  static const String routePath = 'account-delete';

  const AccountDeleteView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountController = ref.read(accountControllerProvider.notifier);
    final appLocalizations = ref.watch(appLocalizationsProvider);
    Future.microtask(() {
      showDeleteAdviceDialog(appLocalizations).then((value) async {
        if (value) {
          (await accountController.delete()).fold((_) {
            AppErrorView.go();
          }, (_) {
            router.goNamed(AuthView.routeName);
          });
        } else {
          router.pop();
        }
      });
    });
    return const Scaffold(
        body: AppLoadingWidget(
      color: AppColors.circularProgressColor,
    ));
  }

  Future<bool> showDeleteAdviceDialog(AppLocalizations appLocalizations) async {
    return (await showDialog(
            context: navigatorKey.currentContext!,
            builder: (context) => InfoDialog(
                  dialogTitle: appLocalizations.accountDeleteDialogTitle,
                  dialogDescription: appLocalizations.accountDialogDescription,
                  confirmationText: appLocalizations.confirmation,
                  cancelText: appLocalizations.cancel,
                  onConfirmation: () => Navigator.pop(context, true),
                  onCancel: () => Navigator.pop(context, false),
                ))) ??
        false;
  }
}
