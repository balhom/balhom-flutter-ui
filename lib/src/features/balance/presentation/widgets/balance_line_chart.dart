import 'dart:math';
import 'package:balhom/src/core/utils/platform_utils.dart';
import 'package:balhom/src/core/router.dart';
import 'package:balhom/src/core/domain/enums/selected_date_enum.dart';
import 'package:balhom/src/core/presentation/widgets/chart_indicator.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/statistics/domain/entities/daily_statistics_entity.dart';
import 'package:balhom/src/features/statistics/domain/entities/monthly_statistics_entity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceLineChart extends ConsumerWidget {
  /// Border chart lines decoration
  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Colors.black, width: 2),
          left: BorderSide(color: Colors.black, width: 2),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 22,
        interval: PlatformUtils.isSmallWindow(navigatorKey.currentContext!) &&
                selectedDateMode == SelectedDateEnum.month
            ? 2
            : 1,
        getTitlesWidget: (double value, TitleMeta meta) {
          final style = GoogleFonts.openSans(
            fontSize: 12,
          );
          final title = selectedDateMode == SelectedDateEnum.year
              ? monthList[value.toInt() - 1]
              : "${value.toInt()}";
          return SideTitleWidget(
            axisSide: meta.axisSide,
            space: 5,
            child: Text(title, style: style),
          );
        },
      );

  SideTitles get leftTitles => SideTitles(
        getTitlesWidget: (double value, TitleMeta meta) {
          final style = GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          );
          return Text("${value.toInt()}",
              style: style, textAlign: TextAlign.center);
        },
        showTitles: true,
        interval: (getMaxQuantity() / 5).ceilToDouble(),
        reservedSize: 30,
      );

  /// Border chart side titles setup
  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        // Ignore right details
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        // Ignore top details
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles,
        ),
      );

  /// List containing every month's translation
  final List<String> monthList;

  /// List of [DailyStatisticsEntity]. If empty then all dailyStatistics are
  /// set to 0
  final List<DailyStatisticsEntity> dailyStatisticsList;

  final bool showRevenues;

  /// List of [MonthlyStatisticsEntity]. If empty then all monthlyStatistics are
  /// set to 0
  final List<MonthlyStatisticsEntity> monthlyStatisticsList;

  final bool showExpenses;

  final SelectedDateEnum selectedDateMode;

  /// Required for `SelectedDate.month` as [dateType]
  final int? selectedMonth;

  /// Required for `SelectedDate.month` as [dateType]
  final int? selectedYear;

  double get maxX => selectedDateMode == SelectedDateEnum.year
      ? 12.0
      : DateUtils.getDaysInMonth(selectedYear ?? DateTime.now().year,
              selectedMonth ?? DateTime.now().month)
          .toDouble();

  const BalanceLineChart(
      {required this.monthList,
      required this.dailyStatisticsList,
      required this.monthlyStatisticsList,
      this.showRevenues = true,
      this.showExpenses = true,
      required this.selectedDateMode,
      required this.selectedMonth,
      required this.selectedYear,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: true),
                titlesData: titlesData,
                borderData: borderData,
                lineBarsData: [
                  if (showRevenues)
                    _balancesChartBarData(BalanceTypeEnum.revenue),
                  if (showExpenses)
                    _balancesChartBarData(BalanceTypeEnum.expense),
                ],
                minX: 1,
                maxX: maxX,
                maxY: getMaxQuantity(),
                minY: 0,
              ),
              duration: const Duration(milliseconds: 250),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showRevenues)
                ChartIndicator(
                  color: const Color.fromARGB(184, 0, 175, 15),
                  text: appLocalizations.revenues,
                  isSquare: true,
                ),
              if (showRevenues && showExpenses) const SizedBox(width: 10),
              if (showExpenses)
                ChartIndicator(
                  color: const Color.fromARGB(188, 255, 17, 0),
                  text: appLocalizations.expenses,
                  isSquare: true,
                ),
            ],
          )
        ],
      ),
    );
  }

  LineChartBarData _balancesChartBarData(
      final BalanceTypeEnum balanceTypeEnum) {
    final List<FlSpot> spots = [];

    for (int i = 1; i <= maxX; i++) {
      if (selectedDateMode == SelectedDateEnum.month) {
        final dailyStatistic = dailyStatisticsList.firstWhere((dailyStatistic) {
          return dailyStatistic.day == i;
        }, orElse: () => DailyStatisticsEntity(day: i, expense: 0, revenue: 0));
        spots.add(FlSpot(
            dailyStatistic.day.toDouble(),
            balanceTypeEnum.isExpense()
                ? dailyStatistic.expense
                : dailyStatistic.revenue));
      } else {
        final monthlyStatistic = monthlyStatisticsList.firstWhere(
            (monthlyStatistic) {
          return monthlyStatistic.month == i;
        },
            orElse: () =>
                MonthlyStatisticsEntity(month: i, expense: 0, revenue: 0));
        spots.add(FlSpot(
            monthlyStatistic.month.toDouble(),
            balanceTypeEnum.isExpense()
                ? monthlyStatistic.expense
                : monthlyStatistic.revenue));
      }
    }

    return LineChartBarData(
        isCurved: true,
        preventCurveOverShooting: true,
        color: balanceTypeEnum.isExpense()
            ? const Color.fromARGB(188, 255, 17, 0)
            : const Color.fromARGB(184, 0, 175, 15),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          color: balanceTypeEnum.isExpense()
              ? const Color.fromARGB(55, 212, 117, 117)
              : const Color.fromARGB(55, 0, 175, 15),
        ),
        spots: spots);
  }

  @visibleForTesting
  double getMaxQuantity() {
    double maxQuantity = 4.0;

    final Iterable<double> revenueCollection =
        (selectedDateMode == SelectedDateEnum.year)
            ? (monthlyStatisticsList.isEmpty
                ? [0]
                : monthlyStatisticsList.map((e) => e.revenue))
            : (dailyStatisticsList.isEmpty
                ? [0]
                : dailyStatisticsList.map((e) => e.revenue));
    final Iterable<double> expenseCollection =
        (selectedDateMode == SelectedDateEnum.year)
            ? (monthlyStatisticsList.isEmpty
                ? [0]
                : monthlyStatisticsList.map((e) => e.expense))
            : (dailyStatisticsList.isEmpty
                ? [0]
                : dailyStatisticsList.map((e) => e.expense));

    if (showRevenues) {
      final double revenuesMax = revenueCollection.reduce(max);
      maxQuantity = revenuesMax > maxQuantity ? revenuesMax : maxQuantity;
    }
    if (showExpenses) {
      final double expensesMax = expenseCollection.reduce(max);
      maxQuantity = expensesMax > maxQuantity ? expensesMax : maxQuantity;
    }

    return maxQuantity.ceilToDouble();
  }
}
