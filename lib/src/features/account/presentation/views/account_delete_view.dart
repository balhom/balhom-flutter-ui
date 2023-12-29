import 'package:balhom/config/app_colors.dart';
import 'package:balhom/src/core/presentation/views/app_scaffold.dart';
import 'package:balhom/src/core/router.dart';
import 'package:balhom/src/core/presentation/views/app_error_view.dart';
import 'package:balhom/src/core/presentation/widgets/info_dialog.dart';
import 'package:balhom/src/core/presentation/widgets/app_loading_widget.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/account/providers.dart';
import 'package:balhom/src/features/auth/presentation/views/auth_view.dart';
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
    final accountDeleteUseCase =
        ref.read(accountDeleteUseCaseProvider.notifier);
    final appLocalizations = ref.read(appLocalizationsProvider);

    Future.microtask(() {
      showDeleteAdviceDialog(appLocalizations).then((value) async {
        if (value) {
          await accountDeleteUseCase.handle();
          final accountDeleteState = ref.read(accountDeleteUseCaseProvider);
          if (accountDeleteState.asData != null) {
            router.goNamed(AuthView.routeName);
          } else {
            AppErrorView.go();
          }
        } else {
          router.pop();
        }
      });
    });
    return const AppScaffold(
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
