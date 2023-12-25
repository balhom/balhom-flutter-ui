import 'package:balhom/config/app_colors.dart';
import 'package:balhom/src/core/presentation/widgets/double_form_field.dart';
import 'package:balhom/src/core/presentation/widgets/app_text_button.dart';
import 'package:balhom/src/core/presentation/widgets/app_text_form_field.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/account/domain/dtos/account_edit_values_dto.dart';
import 'package:balhom/src/features/account/domain/entities/account_entity.dart';
import 'package:balhom/src/features/account/presentation/utils/dialog_utils.dart';
import 'package:balhom/src/features/account/providers.dart';
import 'package:balhom/src/features/auth/domain/values/email_value.dart';
import 'package:balhom/src/features/auth/domain/values/register_username_value.dart';
import 'package:balhom/src/features/balance/domain/values/balance_quantity_value.dart';
import 'package:balhom/src/features/currency/application/currency_conversion_controller.dart';
import 'package:balhom/src/features/currency/presentation/utils/dialog_utils.dart';
import 'package:balhom/src/features/currency/presentation/widgets/dropdown_picker_field.dart';
import 'package:balhom/src/features/currency/providers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// ignore: depend_on_referenced_packages
import 'package:mime/mime.dart' as mm;

class AccountEditForm extends ConsumerStatefulWidget {
  @visibleForTesting
  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final expectedMonthlyBalanceController = TextEditingController();
  final expectedAnnualBalanceController = TextEditingController();

  final bool edit;
  final AccountEntity account;
  final cache = ValueNotifier<Widget>(Container());

  AccountEditForm({
    required this.edit,
    required this.account,
    super.key,
  }) {
    usernameController.text = account.username;
    emailController.text = account.email;
    expectedMonthlyBalanceController.text =
        account.expectedMonthlyBalance.toString().replaceAll(".", ",");
    expectedAnnualBalanceController.text =
        account.expectedAnnualBalance.toString().replaceAll(".", ",");
  }

  @override
  ConsumerState<AccountEditForm> createState() => _UserEditFormState();
}

class _UserEditFormState extends ConsumerState<AccountEditForm> {
  AccountEditValuesDto? accountEditValuesDto;
  Uint8List? imageBytes;
  String? imageType;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = ref.watch(appLocalizationsProvider);

    final currencyTypesState = ref.watch(currencyTypeListsControllerProvider);
    final currencyConversionController =
        ref.watch(currencyConversionControllerProvider);

    final accountController = ref.read(accountControllerProvider.notifier);
    final accountState = ref.watch(accountControllerProvider);

    accountEditValuesDto ??= AccountEditValuesDto(
        oldUser: widget.account,
        usernameValue: RegisterUsernameValue(
            appLocalizations, widget.usernameController.text),
        emailValue: EmailValue(appLocalizations, widget.emailController.text),
        expectedMonthlyBalanceValue: BalanceQuantityValue(
            appLocalizations,
            double.tryParse(widget.expectedMonthlyBalanceController.text
                .replaceAll(",", "."))),
        expectedAnnualBalanceValue: BalanceQuantityValue(
            appLocalizations,
            double.tryParse(widget.expectedAnnualBalanceController.text
                .replaceAll(",", "."))),
        prefCurrencyType: widget.account.prefCurrencyType);

    // This is used to refresh page in case handle controller
    return accountState.when(data: (_) {
      return currencyTypesState.when(data: (currencyTypes) {
        widget.cache.value = Form(
          key: widget.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                verticalSpace(),
                // Image Widget
                CircleAvatar(
                    foregroundColor: AppColors.appBarBackgroundColor,
                    backgroundColor: AppColors.appBarBackgroundColor,
                    backgroundImage: imageBytes == null
                        ? Image.network(widget.account.image!).image
                        : Image.memory(imageBytes!).image,
                    radius: 50,
                    child: !widget.edit
                        ? null
                        : Container(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              iconSize: 30,
                              icon: const Icon(Icons.edit),
                              onPressed: () async {
                                await loadImage();
                                setState(() {});
                              },
                            ))),
                verticalSpace(),
                // Username Text Field
                AppTextFormField(
                  readOnly: !widget.edit,
                  onChanged: (value) => accountEditValuesDto =
                      accountEditValuesDto!.copyWith(
                          usernameValue:
                              RegisterUsernameValue(appLocalizations, value)),
                  title: appLocalizations.username,
                  validator: (value) =>
                      accountEditValuesDto!.usernameValue.validate,
                  maxCharacters: 15,
                  maxWidth: 400,
                  controller: widget.usernameController,
                ),
                verticalSpace(),
                // Email Text Field
                AppTextFormField(
                  readOnly: true,
                  title: appLocalizations.emailAddress,
                  maxCharacters: 300,
                  maxWidth: 400,
                  controller: widget.emailController,
                ),
                verticalSpace(),
                // Expected Monthly Balance Text Field
                DoubleFormField(
                  readOnly: !widget.edit,
                  onChanged: (value) => accountEditValuesDto =
                      accountEditValuesDto!.copyWith(
                          expectedMonthlyBalanceValue:
                              BalanceQuantityValue(appLocalizations, value)),
                  title: appLocalizations.expectedMonthlyBalance,
                  validator: (value) => accountEditValuesDto!
                      .expectedMonthlyBalanceValue.validate,
                  maxWidth: 300,
                  controller: widget.expectedMonthlyBalanceController,
                ),
                verticalSpace(),
                // Expected Annual Balance Text Field
                DoubleFormField(
                  readOnly: !widget.edit,
                  onChanged: (value) => accountEditValuesDto =
                      accountEditValuesDto!.copyWith(
                          expectedAnnualBalanceValue:
                              BalanceQuantityValue(appLocalizations, value)),
                  title: appLocalizations.expectedAnnualBalance,
                  validator: (value) =>
                      accountEditValuesDto!.expectedAnnualBalanceValue.validate,
                  maxWidth: 300,
                  controller: widget.expectedAnnualBalanceController,
                ),
                verticalSpace(),
                // Currency Type Picker
                (currencyTypes.isNotEmpty)
                    ? DropdownPickerField(
                        readOnly: !widget.edit,
                        name: appLocalizations.currencyType,
                        initialValue: accountEditValuesDto!.prefCurrencyType,
                        items: currencyTypes.map((e) => e.code).toList(),
                        onChanged: (newCurrencyType) => changePrefCurrencyType(
                            newCurrencyType!,
                            currencyConversionController,
                            appLocalizations))
                    : Text(appLocalizations.genericError),
                verticalSpace(),
                if (widget.edit)
                  AppTextButton(
                    text: appLocalizations.confirmation,
                    width: 160,
                    height: 50,
                    onPressed: () async {
                      if (widget.formKey.currentState == null ||
                          !widget.formKey.currentState!.validate()) {
                        return;
                      }
                      if (imageBytes != null && imageType != null) {
                        bool isImageOk = true;
                        (await accountController.updateImage(
                                imageBytes!, imageType!, appLocalizations))
                            .fold((failure) {
                          isImageOk = false;
                          showErrorAccountEditDialog(
                              appLocalizations, failure.detail);
                        }, (_) => null);
                        if (!isImageOk) return;
                      }
                      (await accountController.update(
                              accountEditValuesDto!, appLocalizations))
                          .fold((failure) {
                        showErrorAccountEditDialog(
                            appLocalizations, failure.detail);
                      }, (entity) {
                        accountController.get();
                      });
                    },
                  ),
              ],
            ),
          ),
        );
        return widget.cache.value;
      }, error: (error, _) {
        return showError(
            error: error,
            background: widget.cache.value,
            text: appLocalizations.genericError);
      }, loading: () {
        return showLoading(background: widget.cache.value);
      });
    }, error: (error, _) {
      return showError(
          error: error,
          background: widget.cache.value,
          text: appLocalizations.genericError);
    }, loading: () {
      return showLoading(background: widget.cache.value);
    });
  }

  @visibleForTesting
  Future<void> loadImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      imageBytes = result.files.single.bytes;
      imageType = mm.lookupMimeType(result.files.single.name) ?? "";
    }
  }

  @visibleForTesting
  Future<void> changePrefCurrencyType(
      final String newCurrencyType,
      final CurrencyConversionController currencyConversionController,
      final AppLocalizations appLocalizations) async {
    if (newCurrencyType == widget.account.prefCurrencyType) {
      return;
    }
    (await currencyConversionController.getCurrencyConversion(
            widget.account.currentBalance,
            widget.account.prefCurrencyType,
            newCurrencyType,
            appLocalizations))
        .fold((failure) {
      setState(() {
        accountEditValuesDto = accountEditValuesDto!
            .copyWith(prefCurrencyType: widget.account.prefCurrencyType);
      });
      showErrorAccountEditDialog(appLocalizations, failure.detail);
    }, (newBalance) async {
      if (await showCurrencyChangeAdviceDialog(
          appLocalizations, newBalance, newCurrencyType)) {
        accountEditValuesDto =
            accountEditValuesDto!.copyWith(prefCurrencyType: newCurrencyType);
      } else {
        setState(() {
          accountEditValuesDto = accountEditValuesDto!
              .copyWith(prefCurrencyType: widget.account.prefCurrencyType);
        });
      }
    });
  }
}
