import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/router.dart';
import 'package:balhom/src/core/presentation/widgets/app_password_text_form_field.dart';
import 'package:balhom/src/core/presentation/widgets/app_text_button.dart';
import 'package:balhom/src/core/presentation/widgets/app_text_form_field.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/account/providers.dart';
import 'package:balhom/src/features/auth/domain/dtos/login_values_dto.dart';
import 'package:balhom/src/features/auth/domain/values/login_password_value.dart';
import 'package:balhom/src/features/auth/domain/values/email_value.dart';
import 'package:balhom/src/features/auth/presentation/utils/dialog_utils.dart';
import 'package:balhom/src/features/auth/providers.dart';
import 'package:balhom/src/features/statistics/presentation/views/statistics_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends ConsumerStatefulWidget {
  final cache = ValueNotifier<Widget>(Container());

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginForm(
      {required this.emailController,
      required this.passwordController,
      super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  LoginValuesDto? loginValuesDto;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = ref.watch(appLocalizationsProvider);

    loginValuesDto ??= LoginValuesDto(
        emailValue: EmailValue(appLocalizations, widget.emailController.text),
        passwordValue: LoginPasswordValue(
            appLocalizations, widget.passwordController.text));

    final loginState = ref.watch(loginUseCaseProvider);
    final loginUseCase = ref.read(loginUseCaseProvider.notifier);

    final accountGetUseCase = ref.read(accountGetUseCaseProvider.notifier);

    final emailVerificationState = ref.watch(emailVerificationUseCaseProvider);

    final isLoading = loginState.maybeWhen(
          data: (_) => loginState.isRefreshing,
          loading: () => true,
          orElse: () => false,
        ) ||
        emailVerificationState.maybeWhen(
          data: (_) => emailVerificationState.isRefreshing,
          loading: () => true,
          orElse: () => false,
        );

    widget.cache.value = SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // Email Text Field
              AppTextFormField(
                maxWidth: 400,
                maxCharacters: 300,
                title: appLocalizations.emailAddress,
                controller: widget.emailController,
                onChanged: (value) => loginValuesDto = loginValuesDto!
                    .copyWith(emailValue: EmailValue(appLocalizations, value)),
                validator: (value) => loginValuesDto!.emailValue.validate,
              ),
              verticalSpace(),
              // Password Text Field
              AppPasswordTextFormField(
                maxWidth: 400,
                maxCharacters: 400,
                title: appLocalizations.password,
                controller: widget.passwordController,
                onChanged: (value) => loginValuesDto = loginValuesDto!.copyWith(
                    passwordValue: LoginPasswordValue(appLocalizations, value)),
                validator: (value) => loginValuesDto!.passwordValue.validate,
              ),
              verticalSpace(),
              // Login Button
              SizedBox(
                  height: 50,
                  width: 200,
                  child: AppTextButton(
                      enabled: !isLoading,
                      onPressed: () async {
                        if (widget.formKey.currentState == null ||
                            !widget.formKey.currentState!.validate()) {
                          return;
                        }
                        await loginUseCase.handle(
                            loginValuesDto!, appLocalizations);

                        final loginState = ref.read(loginUseCaseProvider);
                        if (loginState.hasError) {
                          final failure = loginState.error as Failure;
                          if (failure.detail ==
                              appLocalizations.emailNotVerified) {
                            await showEmailVerificationDialog(ref,
                                loginValuesDto!.emailValue, appLocalizations);
                          } else {
                            showErrorLoginDialog(
                                appLocalizations, failure.detail);
                          }
                        } else {
                          await accountGetUseCase.handle();
                          router.goNamed(StatisticsView.routeName);
                        }
                      },
                      text: appLocalizations.signIn)),
              verticalSpace(),
              // Forgot Password Button
              TextButton(
                onPressed: () async {
                  showResetPasswordDialog(ref, appLocalizations);
                },
                child: Text(
                  appLocalizations.forgotPassword,
                  style: GoogleFonts.openSans(
                      color: const Color.fromARGB(255, 65, 65, 65)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return isLoading
        ? showLoading(
            background: widget.cache.value,
            alignment: AlignmentDirectional.topStart)
        : widget.cache.value;
  }
}
