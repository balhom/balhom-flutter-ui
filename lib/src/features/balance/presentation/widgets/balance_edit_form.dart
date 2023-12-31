import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/presentation/widgets/app_date_time_form_picker.dart';
import 'package:balhom/src/core/router.dart';
import 'package:balhom/src/core/presentation/widgets/double_form_field.dart';
import 'package:balhom/src/core/presentation/widgets/app_text_button.dart';
import 'package:balhom/src/core/presentation/widgets/app_text_form_field.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/account/providers.dart';
import 'package:balhom/src/features/balance/domain/dtos/balance_values_dto.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/balance/domain/values/balance_date_value.dart';
import 'package:balhom/src/features/balance/domain/values/balance_description_value.dart';
import 'package:balhom/src/features/balance/domain/values/balance_name_value.dart';
import 'package:balhom/src/features/balance/domain/values/balance_quantity_value.dart';
import 'package:balhom/src/features/balance/presentation/utils/dialog_utils.dart';
import 'package:balhom/src/features/balance/presentation/views/balance_view.dart';
import 'package:balhom/src/features/balance/presentation/widgets/balance_type_dropdown_picker.dart';
import 'package:balhom/src/features/balance/providers.dart';
import 'package:balhom/src/features/currency/presentation/widgets/dropdown_picker_field.dart';
import 'package:balhom/src/features/currency/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class BalanceEditForm extends ConsumerStatefulWidget {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final quantityController = TextEditingController();
  final dateController = TextEditingController();

  final dateTimeFormatter = DateFormat("dd/MM/yyyy HH:mm");

  final bool edit;

  final BalanceEntity balance;

  final cache = ValueNotifier<Widget>(Container());

  final BalanceTypeEnum balanceTypeEnum;

  BalanceEditForm({
    required this.edit,
    required this.balance,
    required this.balanceTypeEnum,
    super.key,
  }) {
    nameController.text = balance.name;
    descriptionController.text = balance.description;
    quantityController.text =
        balance.realQuantity.toString().replaceAll(".", ",");
    dateController.text = dateTimeFormatter.format(balance.date);
  }

  @override
  ConsumerState<BalanceEditForm> createState() => _BalanceEditFormState();
}

class _BalanceEditFormState extends ConsumerState<BalanceEditForm> {
  BalanceValuesDto? balanceValuesDto;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = ref.watch(appLocalizationsProvider);

    // Initialize balance values dto
    balanceValuesDto ??= defaultBalanceValuesDto(appLocalizations);

    final balanceEditUseCase = ref.read(balanceEditControllerProvider.notifier);

    final balanceTypesState = widget.balanceTypeEnum.isExpense()
        ? ref.watch(expenseTypeListUseCaseProvider)
        : ref.watch(revenueTypeListUseCaseProvider);

    final accountGetUseCase = ref.read(accountGetUseCaseProvider.notifier);

    final currencyTypesState = ref.watch(currencyTypeListsUseCaseProvider);
    return balanceTypesState.when(data: (balanceTypes) {
      return currencyTypesState.when(data: (currencyTypes) {
        widget.cache.value = SingleChildScrollView(
          child: Form(
            key: widget.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  verticalSpace(),
                  // Name Text Field
                  AppTextFormField(
                    readOnly: !widget.edit,
                    onChanged: (value) => balanceValuesDto = balanceValuesDto!
                        .copyWith(
                            nameValue:
                                BalanceNameValue(appLocalizations, value)),
                    title: appLocalizations.balanceName,
                    validator: (value) => balanceValuesDto!.nameValue.validate,
                    maxCharacters: 40,
                    maxWidth: 500,
                    controller: widget.nameController,
                  ),
                  verticalSpace(),
                  // Description Text Field
                  AppTextFormField(
                    readOnly: !widget.edit,
                    onChanged: (value) => balanceValuesDto = balanceValuesDto!
                        .copyWith(
                            descriptionValue: BalanceDescriptionValue(
                                appLocalizations, value)),
                    title: appLocalizations.balanceDescription,
                    validator: (value) =>
                        balanceValuesDto!.descriptionValue.validate,
                    maxCharacters: 2000,
                    maxWidth: 500,
                    maxHeight: 400,
                    maxLines: 7,
                    multiLine: true,
                    showCounterText: true,
                    controller: widget.descriptionController,
                  ),
                  verticalSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Quantity Double Field
                      DoubleFormField(
                        readOnly: !widget.edit,
                        onChanged: (value) => balanceValuesDto =
                            balanceValuesDto!.copyWith(
                                quantityValue: BalanceQuantityValue(
                                    appLocalizations, value)),
                        title: appLocalizations.balanceQuantity,
                        validator: (value) =>
                            balanceValuesDto!.quantityValue.validate,
                        maxWidth: 200,
                        controller: widget.quantityController,
                        align: TextAlign.end,
                      ),
                      // Currency Type Picker
                      (currencyTypes.isNotEmpty)
                          ? DropdownPickerField(
                              readOnly: !widget.edit,
                              initialValue: balanceValuesDto!.currencyType,
                              items: currencyTypes.map((e) => e.code).toList(),
                              width: 100,
                              onChanged: (value) {
                                balanceValuesDto = balanceValuesDto!
                                    .copyWith(currencyType: value!);
                                // TODO show warning dialog about current conversion value
                              })
                          : const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            ),
                    ],
                  ),
                  verticalSpace(),
                  // DateTime Text Field
                  AppDateTimeFormPicker(
                      readOnly: !widget.edit,
                      onTap: (dateTime) {
                        balanceValuesDto = balanceValuesDto!.copyWith(
                            dateValue: BalanceDateTimeValue(
                                appLocalizations, dateTime));
                        widget.dateController.text =
                            widget.dateTimeFormatter.format(dateTime);
                      },
                      controller: widget.dateController,
                      title: appLocalizations.balanceDate,
                      validator: (value) =>
                          balanceValuesDto!.dateValue.validate,
                      maxWidth: 200),
                  verticalSpace(),
                  // Balance Type Picker
                  (balanceTypes.isNotEmpty)
                      ? BalanceTypeDropdownPicker(
                          readOnly: !widget.edit,
                          name: appLocalizations.balanceType,
                          initialValue: balanceValuesDto!.balanceType,
                          items: balanceTypes,
                          onChanged: (value) {
                            balanceValuesDto =
                                balanceValuesDto!.copyWith(balanceType: value!);
                          },
                          appLocalizations: appLocalizations,
                        )
                      : Text(appLocalizations.genericError),
                  verticalSpace(),
                  // Update Button
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
                        await balanceEditUseCase.handle(
                            balanceValuesDto!, appLocalizations);
                        final balanceEditState =
                            ref.read(balanceEditControllerProvider);
                        if (balanceEditState.hasError) {
                          showErrorBalanceEditDialog(
                              appLocalizations,
                              (balanceEditState.asError!.error as Failure)
                                  .detail,
                              widget.balanceTypeEnum);
                        } else {
                          router.goNamed(widget.balanceTypeEnum.isExpense()
                              ? BalanceView.routeExpensePath
                              : BalanceView.routeRevenuePath);
                          // Refresh UI account data
                          accountGetUseCase.handle();
                        }
                      },
                    ),
                ],
              ),
            ),
          ),
        );
        return widget.cache.value;
      }, error: (error, _) {
        return showError(error: error, background: widget.cache.value);
      }, loading: () {
        return showLoading(background: widget.cache.value);
      });
    }, error: (error, _) {
      return showError(error: error, background: widget.cache.value);
    }, loading: () {
      return showLoading(background: widget.cache.value);
    });
  }

  BalanceValuesDto defaultBalanceValuesDto(final appLocalizations) {
    return BalanceValuesDto(
        id: widget.balance.id,
        nameValue: BalanceNameValue(appLocalizations, widget.balance.name),
        descriptionValue: BalanceDescriptionValue(
            appLocalizations, widget.balance.description),
        quantityValue:
            BalanceQuantityValue(appLocalizations, widget.balance.realQuantity),
        dateValue: BalanceDateTimeValue(appLocalizations, widget.balance.date),
        currencyType: widget.balance.currencyType,
        balanceType: widget.balance.balanceType);
  }
}
