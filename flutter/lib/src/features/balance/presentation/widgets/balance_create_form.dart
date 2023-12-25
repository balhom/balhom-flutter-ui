import 'package:balance_home_app/src/core/presentation/widgets/app_date_time_form_picker.dart';
import 'package:balance_home_app/src/core/router.dart';
import 'package:balance_home_app/src/core/presentation/widgets/double_form_field.dart';
import 'package:balance_home_app/src/core/presentation/widgets/app_text_button.dart';
import 'package:balance_home_app/src/core/presentation/widgets/app_text_form_field.dart';
import 'package:balance_home_app/src/core/providers.dart';
import 'package:balance_home_app/src/core/utils/widget_utils.dart';
import 'package:balance_home_app/src/features/account/providers.dart';
import 'package:balance_home_app/src/features/balance/domain/dtos/balance_values_dto.dart';
import 'package:balance_home_app/src/features/balance/domain/entities/balance_type_entity.dart';
import 'package:balance_home_app/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balance_home_app/src/features/balance/domain/values/balance_date_value.dart';
import 'package:balance_home_app/src/features/balance/domain/values/balance_description_value.dart';
import 'package:balance_home_app/src/features/balance/domain/values/balance_name_value.dart';
import 'package:balance_home_app/src/features/balance/domain/values/balance_quantity_value.dart';
import 'package:balance_home_app/src/features/balance/presentation/utils/dialog_utils.dart';
import 'package:balance_home_app/src/features/balance/presentation/views/balance_view.dart';
import 'package:balance_home_app/src/features/balance/presentation/widgets/balance_type_dropdown_picker.dart';
import 'package:balance_home_app/src/features/balance/providers.dart';
import 'package:balance_home_app/src/features/currency/presentation/widgets/dropdown_picker_field.dart';
import 'package:balance_home_app/src/features/currency/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class BalanceCreateForm extends ConsumerStatefulWidget {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final quantityController = TextEditingController();
  final dateController = TextEditingController();

  final dateTimeFormatter = DateFormat("dd/MM/yyyy HH:mm");

  final cache = ValueNotifier<Widget>(Container());

  final BalanceTypeEnum balanceTypeEnum;

  BalanceCreateForm({
    required this.balanceTypeEnum,
    super.key,
  }) {
    dateController.text = dateTimeFormatter.format(DateTime.now());
  }

  @override
  ConsumerState<BalanceCreateForm> createState() => _BalanceCreateFormState();
}

class _BalanceCreateFormState extends ConsumerState<BalanceCreateForm> {
  BalanceValuesDto? balanceValuesDto;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = ref.watch(appLocalizationsProvider);

    final balanceListController = widget.balanceTypeEnum.isExpense()
        ? ref.read(expenseListControllerProvider.notifier)
        : ref.read(revenueListControllerProvider.notifier);

    final balanceCreateController =
        ref.read(balanceCreateControllerProvider.notifier);
    final balanceCreate = ref.watch(balanceCreateControllerProvider);

    final balanceTypesState = widget.balanceTypeEnum.isExpense()
        ? ref.watch(expenseTypeListControllerProvider)
        : ref.watch(revenueTypeListControllerProvider);

    final accountController = ref.read(accountControllerProvider.notifier);
    final accountState = ref.watch(accountControllerProvider);

    final currencyTypesState = ref.watch(currencyTypeListsControllerProvider);

    return accountState.when(data: (accountEntity) {
      // This is used to refresh page in case handle controller
      return balanceCreate.when(data: (_) {
        return balanceTypesState.when(data: (balanceTypes) {
          // Initialize balance values dto
          balanceValuesDto ??= defaultBalanceValuesDto(
              accountEntity!.prefCurrencyType,
              balanceTypes[0],
              appLocalizations);

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
                        onChanged: (value) => balanceValuesDto =
                            balanceValuesDto!.copyWith(
                                nameValue:
                                    BalanceNameValue(appLocalizations, value)),
                        title: appLocalizations.balanceName,
                        validator: (value) =>
                            balanceValuesDto!.nameValue.validate,
                        maxCharacters: 40,
                        maxWidth: 500,
                        controller: widget.nameController,
                      ),
                      verticalSpace(),
                      // Description Text Field
                      AppTextFormField(
                        onChanged: (value) => balanceValuesDto =
                            balanceValuesDto!.copyWith(
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
                                  initialValue: balanceValuesDto!.currencyType,
                                  items:
                                      currencyTypes.map((e) => e.code).toList(),
                                  width: 100,
                                  onChanged: (value) {
                                    balanceValuesDto = balanceValuesDto!
                                        .copyWith(currencyType: value!);
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
                              name: appLocalizations.balanceType,
                              initialValue: balanceValuesDto!.balanceType,
                              items: balanceTypes,
                              onChanged: (value) {
                                balanceValuesDto = balanceValuesDto!
                                    .copyWith(balanceType: value!);
                              },
                              appLocalizations: appLocalizations,
                            )
                          : Text(appLocalizations.genericError),
                      verticalSpace(),
                      // Create Button
                      AppTextButton(
                        width: 140,
                        height: 50,
                        onPressed: () async {
                          if (widget.formKey.currentState == null ||
                              !widget.formKey.currentState!.validate()) {
                            return;
                          }
                          (await balanceCreateController.create(
                                  balanceValuesDto!, appLocalizations))
                              .fold((failure) {
                            showErrorBalanceCreationDialog(appLocalizations,
                                failure.detail, widget.balanceTypeEnum);
                          }, (entity) {
                            router.goNamed(widget.balanceTypeEnum.isExpense()
                                ? BalanceView.routeExpenseName
                                : BalanceView.routeRevenueName);
                            balanceListController.addBalance(entity);
                            // Refresh UI account data
                            accountController.get();
                          });
                        },
                        text: appLocalizations.create,
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

  BalanceValuesDto defaultBalanceValuesDto(final String currencyType,
      final BalanceTypeEntity balanceTypeEntity, final appLocalizations) {
    return BalanceValuesDto(
        id: null,
        nameValue:
            BalanceNameValue(appLocalizations, widget.nameController.text),
        descriptionValue: BalanceDescriptionValue(
            appLocalizations, widget.descriptionController.text),
        quantityValue: BalanceQuantityValue(
            appLocalizations,
            double.tryParse(
                widget.quantityController.text.replaceAll(",", "."))),
        dateValue: BalanceDateTimeValue(
            appLocalizations,
            widget.dateController.text.isNotEmpty
                ? widget.dateTimeFormatter.parse(widget.dateController.text)
                : DateTime.now()),
        currencyType: currencyType,
        balanceType: balanceTypeEntity);
  }
}
