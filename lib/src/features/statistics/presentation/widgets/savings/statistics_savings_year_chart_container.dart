import 'package:balhom/src/core/domain/dtos/selected_date_dto.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/utils/platform_utils.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/balance/providers.dart';
import 'package:balhom/src/features/statistics/presentation/widgets/savings/statistics_savings_year_line_chart.dart';
import 'package:balhom/src/features/statistics/presentation/widgets/statistics_chart_title_container.dart';
import 'package:balhom/src/features/statistics/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatisticsSavingsYearChartContainer extends ConsumerWidget {
  const StatisticsSavingsYearChartContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = connectionStateListenable.value;
    final appLocalizations = ref.watch(appLocalizationsProvider);

    final SelectedDateDto selectedDate =
        ref.watch(statisticsSavingsSelectedDateProvider);
    final selectedDateState =
        ref.read(statisticsSavingsSelectedDateProvider.notifier);
    final int selectedYear = selectedDate.year;

    final balanceYearsState = ref.watch(balanceYearsUseCaseProvider);

    // Screen sizes:
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final double chartLineHeight = (screenHeight * 0.45 <= 200)
        ? 200
        : (screenHeight * 0.45 <= 350)
            ? screenHeight * 0.45
            : 350;

    return balanceYearsState.when<Widget>(data: (balanceYears) {
      // Adding selected year to years list
      if (!balanceYears.contains(selectedYear)) {
        balanceYears.add(selectedYear);
      }
      return Expanded(
        child: Column(
          children: [
            StatisticsChartTitleContainer(
                backgroundColor: const Color.fromARGB(255, 194, 56, 235),
                text: "${appLocalizations.savingsChartTitle} $selectedYear",
                button: Container(
                  color: const Color.fromARGB(255, 179, 141, 247),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: DropdownButton<int>(
                      value: selectedYear,
                      items: balanceYears.map((year) {
                        return DropdownMenuItem<int>(
                          value: year,
                          child: Text(year.toString()),
                        );
                      }).toList(),
                      onChanged: (isConnected)
                          ? (year) {
                              selectedDateState.setYear(year!);
                            }
                          : null),
                )),
            SizedBox(
                height: chartLineHeight,
                width: (PlatformUtils.isSmallWindow(context))
                    ? screenWidth * 0.95
                    : screenWidth * 0.45,
                child: StatisticsSavingsYearLineChart()),
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
}
