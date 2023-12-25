import 'package:balhom/src/core/presentation/widgets/app_password_text_form_field.dart';
import 'package:balhom/src/core/presentation/widgets/app_text_button.dart';
import 'package:balhom/src/core/presentation/widgets/app_text_form_field.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/account/domain/dtos/register_values_dto.dart';
import 'package:balhom/src/features/account/providers.dart';
import 'package:balhom/src/features/auth/domain/values/email_value.dart';
import 'package:balhom/src/features/auth/domain/values/register_username_value.dart';
import 'package:balhom/src/features/auth/domain/values/register_password_value.dart';
import 'package:balhom/src/features/auth/domain/values/register_repeat_password_value.dart';
import 'package:balhom/src/features/auth/presentation/utils/dialog_utils.dart';
import 'package:balhom/src/features/auth/providers.dart';
import 'package:balhom/src/features/currency/domain/entities/currency_type_entity.dart';
import 'package:balhom/src/features/currency/presentation/widgets/dropdown_picker_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterForm extends ConsumerStatefulWidget {
  final cache = ValueNotifier<Widget>(Container());

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController repeatPasswordController;

  final List<CurrencyTypeEntity> currencyTypes;

  final formKey = GlobalKey<FormState>();

  RegisterForm(
      {required this.usernameController,
      required this.emailController,
      required this.passwordController,
      required this.repeatPasswordController,
      required this.currencyTypes,
      super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  RegisterValuesDto? registerValuesDto;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = ref.watch(appLocalizationsProvider);

    registerValuesDto = RegisterValuesDto(
        usernameValue: RegisterUsernameValue(
            appLocalizations, widget.usernameController.text),
        emailValue: EmailValue(appLocalizations, widget.emailController.text),
        locale: appLocalizations.localeName,
        prefCurrencyType: widget.currencyTypes[0].code,
        passwordValue: RegisterPasswordValue(
            appLocalizations, widget.passwordController.text),
        repeatPasswordValue: RegisterRepeatPasswordValue(
            appLocalizations,
            widget.passwordController.text,
            widget.repeatPasswordController.text));

    final accountState = ref.watch(accountControllerProvider);
    final accountController = ref.read(accountControllerProvider.notifier);
    final emailVerificationState =
        ref.watch(emailVerificationControllerProvider);
    final emailVerificationController =
        ref.read(emailVerificationControllerProvider.notifier);

    final isLoading = accountState.maybeWhen(
          data: (_) => accountState.isRefreshing,
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
              // Usename Text Field
              AppTextFormField(
                maxCharacters: 15,
                maxWidth: 400,
                title: appLocalizations.username,
                controller: widget.usernameController,
                onChanged: (value) => registerValuesDto = registerValuesDto!
                    .copyWith(
                        usernameValue:
                            RegisterUsernameValue(appLocalizations, value)),
                validator: (value) => registerValuesDto!.usernameValue.validate,
              ),
              verticalSpace(),
              // Usename Text Field
              AppTextFormField(
                title: appLocalizations.emailAddress,
                maxWidth: 400,
                maxCharacters: 300,
                controller: widget.emailController,
                onChanged: (value) => registerValuesDto = registerValuesDto!
                    .copyWith(emailValue: EmailValue(appLocalizations, value)),
                validator: (value) => registerValuesDto!.emailValue.validate,
              ),
              verticalSpace(),
              // Password Text Field
              AppPasswordTextFormField(
                title: appLocalizations.password,
                maxWidth: 400,
                maxCharacters: 400,
                controller: widget.passwordController,
                onChanged: (value) => registerValuesDto = registerValuesDto!
                    .copyWith(
                        passwordValue:
                            RegisterPasswordValue(appLocalizations, value)),
                validator: (value) => registerValuesDto!.passwordValue.validate,
              ),
              verticalSpace(),
              // Repeat Password Text Field
              AppPasswordTextFormField(
                title: appLocalizations.repeatPassword,
                maxWidth: 400,
                maxCharacters: 400,
                controller: widget.repeatPasswordController,
                onChanged: (value) => registerValuesDto = registerValuesDto!
                    .copyWith(
                        repeatPasswordValue: RegisterRepeatPasswordValue(
                            appLocalizations,
                            widget.passwordController.text,
                            value)),
                validator: (value) =>
                    registerValuesDto!.repeatPasswordValue.validate,
              ),
              verticalSpace(),
              // Currency Type Picker
              (widget.currencyTypes.isNotEmpty)
                  ? DropdownPickerField(
                      name: appLocalizations.currencyType,
                      initialValue: widget.currencyTypes[0].code,
                      items: widget.currencyTypes.map((e) => e.code).toList(),
                      onChanged: (value) {
                        registerValuesDto = registerValuesDto!
                            .copyWith(prefCurrencyType: value!);
                      })
                  : Text(appLocalizations.genericError),
              verticalSpace(),
              // Register Button
              SizedBox(
                  height: 50,
                  width: 240,
                  child: AppTextButton(
                      enabled: !isLoading,
                      onPressed: () async {
                        if (widget.formKey.currentState == null ||
                            !widget.formKey.currentState!.validate()) {
                          return;
                        }

                        (await accountController.create(
                                registerValuesDto!, appLocalizations))
                            .fold((failure) {
                          showErrorRegisterDialog(
                              appLocalizations, failure.detail);
                        }, (_) async {
                          await showEmailVerificationDialog(
                              emailVerificationController,
                              registerValuesDto!.emailValue,
                              appLocalizations);
                        });
                      },
                      text: appLocalizations.register)),
            ],
          ),
        ),
      ),
    );
    return isLoading
        ? showLoading(background: widget.cache.value)
        : widget.cache.value;
  }
}
