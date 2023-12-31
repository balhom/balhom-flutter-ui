import 'package:balhom/config/app_theme.dart';
import 'package:balhom/src/core/domain/dtos/selected_date_dto.dart';
import 'package:balhom/src/core/domain/enums/selected_date_enum.dart';
import 'package:balhom/src/core/presentation/widgets/app_text_button.dart';
import 'package:balhom/src/core/presentation/widgets/app_text_check_box.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/utils/date_util.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DateBalanceDialog extends ConsumerStatefulWidget {
  final SelectedDateDto selectedDate;
  final List<int> years;
  final void Function(SelectedDateDto newDate) onPressed;

  const DateBalanceDialog(
      {required this.selectedDate,
      required this.years,
      required this.onPressed,
      super.key});

  @override
  ConsumerState createState() => _DateBalanceDialogState();
}

class _DateBalanceDialogState extends ConsumerState<DateBalanceDialog> {
  bool? isDay;
  bool? isMonth;
  int? day;
  int? month;
  int? year;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = ref.watch(appLocalizationsProvider);
    final theme = ref.read(themeDataProvider);
    isDay ??= widget.selectedDate.selectedDateMode == SelectedDateEnum.day;
    isMonth ??=
        widget.selectedDate.selectedDateMode == SelectedDateEnum.month ||
            widget.selectedDate.selectedDateMode == SelectedDateEnum.day;
    day ??= widget.selectedDate.day;
    month ??= widget.selectedDate.month;
    year ??= widget.selectedDate.year;
    return AlertDialog(
        title: Text(appLocalizations.date),
        content: SingleChildScrollView(
          child: SizedBox(
            height: 270,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              dayRow(appLocalizations, theme),
              verticalSpace(),
              monthRow(appLocalizations, theme),
              verticalSpace(),
              yearRow(appLocalizations),
              verticalSpace(),
              verticalSpace(),
              AppTextButton(
                  text: appLocalizations.confirmation,
                  onPressed: () {
                    SelectedDateEnum selectedDateMode = isDay!
                        ? SelectedDateEnum.day
                        : isMonth!
                            ? SelectedDateEnum.month
                            : SelectedDateEnum.year;
                    SelectedDateDto newDate = SelectedDateDto(
                        day: day!,
                        month: month!,
                        year: year!,
                        selectedDateMode: selectedDateMode);
                    widget.onPressed(newDate);
                  })
            ]),
          ),
        ));
  }

  Widget dayRow(AppLocalizations appLocalizations, ThemeData theme) {
    List<String> days = DateUtil.getDaysList(month!, year!);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTextCheckBox(
          title: appLocalizations.day,
          fillColor: !isDay!
              ? null
              : theme == AppTheme.darkTheme
                  ? Colors.white
                  : Colors.black,
          onChanged: (value) {
            setState(() {
              isDay = !isDay!;
              if (!isMonth! && isDay!) isMonth = true;
            });
          },
          isChecked: isDay!,
        ),
        DropdownButton<String>(
          value: day!.toString(),
          items: days.map((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: isDay!
              ? (value) {
                  setState(() {
                    day = int.parse(value!);
                  });
                }
              : null,
        )
      ],
    );
  }

  Widget monthRow(AppLocalizations appLocalizations, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTextCheckBox(
          title: appLocalizations.month,
          fillColor: !isMonth!
              ? null
              : theme == AppTheme.darkTheme
                  ? Colors.white
                  : Colors.black,
          onChanged: (value) {
            setState(() {
              isMonth = !isMonth!;
              if (!isMonth! || !isDay!) isDay = false;
            });
          },
          isChecked: isMonth!,
        ),
        DropdownButton<int>(
          value: month,
          items: List<int>.generate(12, (i) => i + 1).map((monthIndex) {
            return DropdownMenuItem<int>(
              value: monthIndex,
              child:
                  Text(DateUtil.monthNumToString(monthIndex, appLocalizations)),
            );
          }).toList(),
          onChanged: isMonth!
              ? (value) {
                  setState(() {
                    month = value;
                    isDay = false;
                    day = 1;
                  });
                }
              : null,
        )
      ],
    );
  }

  Widget yearRow(AppLocalizations appLocalizations) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(appLocalizations.year),
        horizontalSpace(),
        DropdownButton<String>(
          value: year!.toString(),
          items: widget.years.map((value) {
            return DropdownMenuItem<String>(
              value: value.toString(),
              child: Text(value.toString()),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              year = int.parse(value!);
              isDay = false;
              day = 1;
              if (year == DateTime.now().year &&
                  month! > DateTime.now().month) {
                isMonth = false;
                month = DateTime.now().month;
              }
            });
          },
        )
      ],
    );
  }
}
