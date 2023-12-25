import 'package:balance_home_app/src/core/utils/platform_utils.dart';
import 'package:balance_home_app/src/core/presentation/models/selected_date.dart';
import 'package:balance_home_app/src/core/presentation/models/selected_date_mode.dart';
import 'package:balance_home_app/src/core/presentation/states/selected_date_state.dart';
import 'package:balance_home_app/src/core/providers.dart';
import 'package:balance_home_app/src/features/balance/presentation/widgets/balance_line_chart.dart';
import 'package:balance_home_app/src/core/utils/date_util.dart';
import 'package:balance_home_app/src/features/statistics/domain/entities/daily_statistics_entity.dart';
import 'package:balance_home_app/src/features/statistics/domain/entities/monthly_statistics_entity.dart';
import 'package:balance_home_app/src/features/statistics/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticsBalanceChartContainer extends ConsumerWidget {
  final SelectedDateEnum dateMode;
  final List<DailyStatisticsEntity> dailyStatistics;
  final List<MonthlyStatisticsEntity> monthlyStatistics;
  final List<int> balanceYears;

  const StatisticsBalanceChartContainer(
      {required this.dateMode,
      required this.dailyStatistics,
      required this.monthlyStatistics,
      required this.balanceYears,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);

    final selectedDate = ref.watch(statisticsBalanceSelectedDateProvider);
    final selectedDateState =
        ref.read(statisticsBalanceSelectedDateProvider.notifier);

    final selectedMonthAsStr =
        DateUtil.monthNumToString(selectedDate.month, appLocalizations);

    // Adding selected year to years list
    if (!balanceYears.contains(selectedDate.year)) {
      balanceYears.add(selectedDate.year);
    }
    // Adding current year to years list
    if (!balanceYears.contains(DateTime.now().year)) {
      balanceYears.add(DateTime.now().year);
    }
    balanceYears.sort();
    // Screen sizes:
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double chartLineHeight = (screenHeight * 0.45 <= 200)
        ? 200
        : (screenHeight * 0.45 <= 350)
            ? screenHeight * 0.45
            : 350;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              color: const Color.fromARGB(255, 114, 187, 83),
              height: 45,
              width: (PlatformUtils.isSmallWindow(context))
                  ? screenWidth * 0.70
                  : screenWidth * 0.35,
              child: Center(
                  child: Text(
                      dateMode == SelectedDateEnum.month
                          ? "${appLocalizations.balanceChartTitle} $selectedMonthAsStr"
                          : "${appLocalizations.balanceChartTitle} ${selectedDate.year}",
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold))),
            ),
            dateButton(selectedMonthAsStr, balanceYears, selectedDate,
                selectedDateState, appLocalizations)
          ],
        ),
        SizedBox(
            height: chartLineHeight,
            width: (PlatformUtils.isSmallWindow(context))
                ? screenWidth * 0.95
                : screenWidth * 0.45,
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
    );
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
      margin: const EdgeInsets.only(top: 20, bottom: 10),
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
