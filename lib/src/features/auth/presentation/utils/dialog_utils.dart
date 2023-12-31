import 'package:balhom/config/app_layout.dart';
import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/presentation/widgets/app_text_button.dart';
import 'package:balhom/src/core/presentation/widgets/app_text_form_field.dart';
import 'package:balhom/src/core/router.dart';
import 'package:balhom/src/core/presentation/widgets/app_error_dialog.dart';
import 'package:balhom/src/core/presentation/widgets/info_dialog.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/auth/domain/values/email_value.dart';
import 'package:balhom/src/features/auth/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

///
/// Register Dialogs
///

Future<void> showErrorRegisterDialog(
    AppLocalizations appLocalizations, String error) async {
  await showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AppErrorDialog(
            title: appLocalizations.register,
            description: error,
            cancelText: appLocalizations.cancel,
          ));
}

///
/// Login Dialogs
///

Future<void> showErrorLoginDialog(
    AppLocalizations appLocalizations, String error) async {
  await showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AppErrorDialog(
            title: appLocalizations.login,
            description: error,
            cancelText: appLocalizations.cancel,
          ));
}

///
/// Email Verification Dialogs
///

Future<void> showEmailVerificationDialog(final WidgetRef ref,
    final EmailValue emailValue, final appLocalizations) async {
  final bool sendEmail =
      await showEmailVerificationAdviceDialog(appLocalizations);
  if (sendEmail) {
    await ref
        .read(emailVerificationUseCaseProvider.notifier)
        .handle(emailValue, appLocalizations);
    final emailVerificationState = ref.read(emailVerificationUseCaseProvider);
    if (emailVerificationState.hasError) {
      final failure = emailVerificationState.error as Failure;
      showErrorEmailVerifiactionDialog(appLocalizations, failure.detail);
    }
  }
}

Future<bool> showEmailVerificationAdviceDialog(
    AppLocalizations appLocalizations) async {
  return (await showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) => InfoDialog(
                dialogTitle: appLocalizations.emailVerifiaction,
                dialogDescription: appLocalizations.emailVerifiactionAdvice,
                confirmationText: appLocalizations.send,
                cancelText: appLocalizations.cancel,
                onConfirmation: () => Navigator.pop(context, true),
                onCancel: () => Navigator.pop(context, false),
              ))) ??
      false;
}

Future<void> showErrorEmailVerifiactionDialog(
    AppLocalizations appLocalizations, String error) async {
  await showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AppErrorDialog(
            title: appLocalizations.emailVerifiaction,
            description: error,
            cancelText: appLocalizations.cancel,
          ));
}

///
/// Reset Password Verification Dialogs
///

Future<void> showErrorResetPasswordDialog(
    AppLocalizations appLocalizations, String error) async {
  await showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AppErrorDialog(
            title: appLocalizations.resetPassword,
            description: error,
            cancelText: appLocalizations.cancel,
          ));
}

Future<void> showResetPasswordDialog(
    final WidgetRef ref, final appLocalizations) async {
  final formKey = GlobalKey<FormState>();
  EmailValue emailValue = EmailValue(appLocalizations, "");
  await showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => Dialog(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 300, maxWidth: 400),
              padding: const EdgeInsets.all(AppLayout.genericPadding),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(children: [
                    Text(appLocalizations.resetPassword,
                        style: GoogleFonts.openSans(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    verticalSpace(),
                    Text(appLocalizations.resetPasswordAdvice),
                    verticalSpace(),
                    // Email Text Field
                    AppTextFormField(
                      maxWidth: 400,
                      maxCharacters: 300,
                      title: appLocalizations.emailAddress,
                      controller: TextEditingController(),
                      onChanged: (value) {
                        emailValue = EmailValue(appLocalizations, value);
                        formKey.currentState!.validate();
                      },
                      validator: (value) => emailValue.validate,
                    ),
                    verticalSpace(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Send Button
                        Container(
                            constraints: const BoxConstraints(
                                maxHeight: 40, maxWidth: 150),
                            child: AppTextButton(
                                onPressed: () async {
                                  if (formKey.currentState == null ||
                                      !formKey.currentState!.validate()) {
                                    return;
                                  }
                                  final resetPasswordUseCase = ref.read(
                                      resetPasswordUseCaseProvider.notifier);
                                  await resetPasswordUseCase.handle(
                                      emailValue, appLocalizations);
                                  final resetPasswordState =
                                      ref.read(resetPasswordUseCaseProvider);
                                  if (resetPasswordState.hasError) {
                                    final failure =
                                        resetPasswordState.error as Failure;
                                    showErrorResetPasswordDialog(
                                        appLocalizations, failure.detail);
                                  } else {
                                    router.pop();
                                  }
                                },
                                text: appLocalizations.send)),
                        horizontalSpace(),
                        // Cancel Button
                        Container(
                            constraints: const BoxConstraints(
                                maxHeight: 40, maxWidth: 150),
                            child: AppTextButton(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                text: appLocalizations.cancel)),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ));
}
