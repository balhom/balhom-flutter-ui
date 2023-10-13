import 'package:balance_home_app/src/core/presentation/widgets/app_text_button.dart';
import 'package:balance_home_app/src/core/presentation/widgets/app_password_text_form_field.dart';
import 'package:balance_home_app/src/core/presentation/widgets/app_text_form_field.dart';
import 'package:balance_home_app/src/core/providers.dart';
import 'package:balance_home_app/src/core/utils/widget_utils.dart';
import 'package:balance_home_app/src/features/auth/application/reset_password_controller.dart';
import 'package:balance_home_app/src/features/auth/domain/values/email_value.dart';
import 'package:balance_home_app/src/features/auth/domain/values/register_password_value.dart';
import 'package:balance_home_app/src/features/auth/domain/values/register_repeat_password_value.dart';
import 'package:balance_home_app/src/features/auth/domain/values/verification_code.dart';
import 'package:balance_home_app/src/features/auth/presentation/views/auth_view.dart';
import 'package:balance_home_app/src/core/utils/dialog_utils.dart';
import 'package:balance_home_app/src/features/auth/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordForm extends ConsumerStatefulWidget {
  @visibleForTesting
  final cache = ValueNotifier<Widget>(Container());

  @visibleForTesting
  final formKey = GlobalKey<FormState>();
  @visibleForTesting
  final emailController = TextEditingController();
  @visibleForTesting
  final passwordController = TextEditingController();
  @visibleForTesting
  final repeatPasswordController = TextEditingController();
  @visibleForTesting
  final codeController = TextEditingController();

  ResetPasswordForm({
    super.key,
  });

  @override
  ConsumerState<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends ConsumerState<ResetPasswordForm> {
  @visibleForTesting
  EmailValue? email;
  @visibleForTesting
  RegisterPasswordValue? password;
  @visibleForTesting
  RegisterRepeatPasswordValue? repeatPassword;
  @visibleForTesting
  VerificationCode? code;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = ref.watch(appLocalizationsProvider);
    email = EmailValue(appLocalizations, widget.emailController.text);
    final res = ref.watch(resetPasswordControllerProvider);
    final resetPasswordController =
        ref.read(resetPasswordControllerProvider.notifier);
    return res.when(data: (progress) {
      if (progress == ResetPasswordProgress.started) {
        password =
            RegisterPasswordValue(appLocalizations, widget.passwordController.text);
        repeatPassword = RegisterRepeatPasswordValue(
            appLocalizations,
            widget.passwordController.text,
            widget.repeatPasswordController.text);
        code = VerificationCode(appLocalizations, widget.codeController.text);
      }
      return Form(
        key: widget.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              verticalSpace(),
              AppTextFormField(
                onChanged: (value) =>
                    email = EmailValue(appLocalizations, value),
                title: appLocalizations.emailAddress,
                validator: (value) => email?.validate,
                readOnly: progress != ResetPasswordProgress.none,
                maxCharacters: 300,
                maxWidth: 400,
                controller: widget.emailController,
              ),
              verticalSpace(),
              AppPasswordTextFormField(
                onChanged: (value) =>
                    password = RegisterPasswordValue(appLocalizations, value),
                title: appLocalizations.password,
                validator: (value) => password?.validate,
                readOnly: progress != ResetPasswordProgress.started,
                maxCharacters: 500,
                maxWidth: 400,
                controller: widget.passwordController,
              ),
              AppPasswordTextFormField(
                onChanged: (value) => repeatPassword = RegisterRepeatPasswordValue(
                    appLocalizations, widget.passwordController.text, value),
                title: appLocalizations.repeatPassword,
                validator: (value) => repeatPassword?.validate,
                readOnly: progress != ResetPasswordProgress.started,
                maxCharacters: 500,
                maxWidth: 400,
                controller: widget.repeatPasswordController,
              ),
              verticalSpace(),
              AppTextFormField(
                onChanged: (value) =>
                    code = VerificationCode(appLocalizations, value),
                title: appLocalizations.code,
                validator: (value) => code?.validate,
                readOnly: progress != ResetPasswordProgress.started,
                maxCharacters: 6,
                maxWidth: 200,
                controller: widget.codeController,
                textAlign: TextAlign.center,
              ),
              verticalSpace(),
              AppTextButton(
                width: 200,
                height: 50,
                onPressed: () async {
                  if (progress == ResetPasswordProgress.none &&
                      !widget.formKey.currentState!.validate()) {
                    return;
                  }
                  if (email == null) return;
                  (await resetPasswordController.requestCode(
                          email!, appLocalizations,
                          retry: progress == ResetPasswordProgress.started))
                      .fold((failure) {
                    showErrorResetPasswordCodeDialog(
                        appLocalizations, failure.detail);
                  }, (_) {});
                },
                text: progress == ResetPasswordProgress.none
                    ? appLocalizations.sendCode
                    : appLocalizations.reSendCode,
              ),
              verticalSpace(),
              AppTextButton(
                width: 200,
                height: 50,
                enabled: progress == ResetPasswordProgress.started,
                onPressed: () async {
                  if (widget.formKey.currentState == null ||
                      !widget.formKey.currentState!.validate()) {
                    return;
                  }
                  if (email == null) return;
                  if (password == null) return;
                  if (repeatPassword == null) return;
                  if (code == null) return;
                  (await resetPasswordController.verifyCode(
                          email!, code!, password!, appLocalizations))
                      .fold((failure) {
                    showErrorResetPasswordCodeDialog(
                        appLocalizations, failure.detail);
                  }, (_) {
                    context.go("/${AuthView.routePath}");
                  });
                },
                text: appLocalizations.verifyCode,
              ),
            ],
          ),
        ),
      );
    }, error: (error, _) {
      return showError(
          error: error,
          background: widget.cache.value,
          text: appLocalizations.genericError);
    }, loading: () {
      return showLoading(background: widget.cache.value);
    });
  }
}
