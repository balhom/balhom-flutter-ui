import 'package:balhom/src/core/domain/dtos/selected_date_dto.dart';
import 'package:balhom/src/core/domain/enums/selected_date_enum.dart';
import 'package:balhom/src/core/presentation/states/selected_date_state.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/balance/presentation/widgets/balance_line_chart.dart';
import 'package:balhom/src/core/utils/date_util.dart';
import 'package:balhom/src/features/balance/providers.dart';
import 'package:balhom/src/features/statistics/domain/entities/daily_statistics_entity.dart';
import 'package:balhom/src/features/statistics/domain/entities/monthly_statistics_entity.dart';
import 'package:balhom/src/features/statistics/presentation/widgets/statistics_chart_title_container.dart';
import 'package:balhom/src/features/statistics/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatisticsBalanceChartContainer extends ConsumerWidget {
  final SelectedDateEnum dateMode;
  final List<DailyStatisticsEntity> dailyStatistics;
  final List<MonthlyStatisticsEntity> monthlyStatistics;

  const StatisticsBalanceChartContainer(
      {required this.dateMode,
      required this.dailyStatistics,
      required this.monthlyStatistics,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);

    final selectedDate = ref.watch(statisticsBalanceSelectedDateProvider);
    final selectedDateState =
        ref.read(statisticsBalanceSelectedDateProvider.notifier);

    final selectedMonthAsStr =
        DateUtil.monthNumToString(selectedDate.month, appLocalizations);

    final balanceYearsState = ref.watch(balanceYearsUseCaseProvider);

    // Screen sizes:
    final screenHeight = MediaQuery.of(context).size.height;
    double chartLineHeight = (screenHeight * 0.45 <= 200)
        ? 200
        : (screenHeight * 0.45 <= 350)
            ? screenHeight * 0.45
            : 350;

    return balanceYearsState.when<Widget>(data: (balanceYears) {
      // Adding selected year to years list
      if (!balanceYears.contains(selectedDate.year)) {
        balanceYears.add(selectedDate.year);
      }
      return Expanded(
        child: Column(
          children: [
            StatisticsChartTitleContainer(
                backgroundColor: const Color.fromARGB(255, 114, 187, 83),
                text: dateMode == SelectedDateEnum.month
                    ? "${appLocalizations.balanceChartTitle} $selectedMonthAsStr"
                    : "${appLocalizations.balanceChartTitle} ${selectedDate.year}",
                button: dateButton(selectedMonthAsStr, balanceYears,
                    selectedDate, selectedDateState, appLocalizations)),
            SizedBox(
                height: chartLineHeight,
                child: BalanceLineChart(
                  monthList: DateUtil.getMonthDict(appLocalizations,
                          year: selectedDate.year)
                      .values
                      .toList(),
                  dailyStatisticsList: dailyStatistics,
                  monthlyStatisticsList: monthlyStatistics,
                  selectedDateMode: dateMode,
                  selectedMonth: selectedDate.month,
                  selectedYear: selectedDate.year,
                )),
          ],
        ),
      );
    }, error: (error, _) {
      return Expanded(
          child: SizedBox(
              height: chartLineHeight,
              child: showError(
                  error: error, text: appLocalizations.genericError)));
    }, loading: () {
      return Expanded(
          child: SizedBox(height: chartLineHeight, child: showLoading()));
    });
  }

  @visibleForTesting
  Widget dateButton(
      String selectedMonth,
      List<int> years,
      SelectedDateDto selectedDate,
      SelectedDateState selectedDateState,
      AppLocalizations appLocalizations) {
    final List<int> dropdownValues = (dateMode == SelectedDateEnum.month)
        ? DateUtil.getMonthDict(appLocalizations, year: selectedDate.year)
            .keys
            .toList()
        : years;
    final isConnected = connectionStateListenable.value;
    return Container(
      color: const Color.fromARGB(255, 195, 187, 56),
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: 45,
      child: DropdownButton<int>(
          value: (dateMode == SelectedDateEnum.month)
              ? selectedDate.month
              : selectedDate.year,
          items: dropdownValues.map((value) {
            final strValue = (dateMode == SelectedDateEnum.month)
                ? DateUtil.monthNumToString(value, appLocalizations)
                : value.toString();
            return DropdownMenuItem<int>(
              value: value,
              child: Text(strValue),
            );
          }).toList(),
          onChanged: (isConnected)
              ? (value) {
                  if (dateMode == SelectedDateEnum.month) {
                    if (value == selectedDate.month) return;
                    selectedDateState.setMonth(value!);
                  } else if (dateMode == SelectedDateEnum.year) {
                    if (value == selectedDate.year) return;
                    selectedDateState.setYear(value!);
                  }
                }
              : null),
    );
  }
}
