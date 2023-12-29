import 'dart:math';
import 'package:balhom/src/core/domain/dtos/min_max_dto.dart';
import 'package:balhom/src/core/presentation/widgets/chart_indicator.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/utils/date_util.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/statistics/domain/entities/monthly_saving_entity.dart';
import 'package:balhom/src/features/statistics/providers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticsSavingsYearLineChart extends ConsumerWidget {
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
        interval: 1,
        getTitlesWidget: (double value, TitleMeta meta) {
          final style = GoogleFonts.openSans(
            fontSize: 12,
          );
          String month = monthList[value.toInt() - 1];
          return SideTitleWidget(
            axisSide: meta.axisSide,
            space: 5,
            child: Text(month, style: style),
          );
        },
      );

  late final List<String> monthList;

  final minMaxModelState = ValueNotifier<MinMaxDto?>(null);

  StatisticsSavingsYearLineChart({MinMaxDto? minMaxModel, super.key}) {
    minMaxModelState.value = minMaxModel;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);

    // Month names list
    monthList = DateUtil.getMonthDict(appLocalizations).values.toList();

    final monthlySavingsState = ref.read(monthlySavingsUseCaseProvider);

    return monthlySavingsState.when<Widget>(
        data: (monthlySavings) => Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(
                    child: LineChart(
                      LineChartData(
                        gridData: const FlGridData(show: true),
                        titlesData: FlTitlesData(
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
                            sideTitles: SideTitles(
                              getTitlesWidget: (double value, TitleMeta meta) {
                                final style = GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                );
                                return Text("$value",
                                    style: style, textAlign: TextAlign.center);
                              },
                              showTitles: true,
                              interval: (([
                                        getMinMaxQuantity(monthlySavings)
                                            .max
                                            .ceilToDouble(),
                                        getMinMaxQuantity(monthlySavings)
                                            .min
                                            .floorToDouble()
                                            .abs()
                                      ].reduce(max)) /
                                      5)
                                  .abs()
                                  .ceilToDouble(),
                              reservedSize: 40,
                            ),
                          ),
                        ),
                        borderData: borderData,
                        lineBarsData: [
                          quantityChartBarData(monthlySavings),
                          expectedChartBarData(monthlySavings),
                        ],
                        minX: 1,
                        maxX: 12,
                        maxY: getMinMaxQuantity(monthlySavings)
                            .max
                            .ceilToDouble(),
                        minY: getMinMaxQuantity(monthlySavings)
                            .min
                            .floorToDouble(),
                      ),
                      duration: const Duration(milliseconds: 250),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ChartIndicator(
                        color: const Color.fromARGB(225, 224, 167, 231),
                        text: appLocalizations.expected,
                        isSquare: true,
                      ),
                      const SizedBox(width: 10),
                      ChartIndicator(
                        color: const Color.fromARGB(184, 7, 95, 15),
                        text: appLocalizations.quantity,
                        isSquare: true,
                      ),
                    ],
                  )
                ],
              ),
            ),
        error: (error, __) =>
            showError(error: error, text: appLocalizations.genericError),
        loading: () => showLoading());
  }

  @visibleForTesting
  LineChartBarData quantityChartBarData(
      final List<MonthlySavingEntity> monthlySavings) {
    // Dictionary with months and gross quantities per month
    final Map<int, double> spotsMap = {};
    for (final monthlySaving in monthlySavings) {
      if (spotsMap.containsKey(monthlySaving.month)) {
        spotsMap[monthlySaving.month] =
            spotsMap[monthlySaving.month]! + monthlySaving.grossQuantity;
      } else {
        spotsMap[monthlySaving.month] = monthlySaving.grossQuantity;
      }
      spotsMap[monthlySaving.month] =
          (spotsMap[monthlySaving.month]! * 100).roundToDouble() / 100;
    }
    // Check unexistant months
    for (int month = 1; month <= 12; month++) {
      if (!spotsMap.containsKey(month)) {
        spotsMap[month] = 0.0;
      }
    }
    // Data conversion
    List<FlSpot> spots = [];
    for (int month in spotsMap.keys.toList()..sort()) {
      spots.add(FlSpot(month.toDouble(), spotsMap[month]!.toDouble()));
    }
    return LineChartBarData(
        isCurved: true,
        preventCurveOverShooting: true,
        color: const Color.fromARGB(184, 7, 95, 15),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          color: const Color.fromARGB(34, 9, 82, 15),
        ),
        spots: spots);
  }

  @visibleForTesting
  LineChartBarData expectedChartBarData(
      final List<MonthlySavingEntity> monthlySavings) {
    // Dictionary with months and expected quantities per month
    Map<int, double> spotsMap = {};
    for (final monthlySaving in monthlySavings) {
      if (spotsMap.containsKey(monthlySaving.month)) {
        spotsMap[monthlySaving.month] =
            spotsMap[monthlySaving.month]! + monthlySaving.expectedQuantity;
      } else {
        spotsMap[monthlySaving.month] = monthlySaving.expectedQuantity;
      }
      spotsMap[monthlySaving.month] =
          (spotsMap[monthlySaving.month]! * 100).roundToDouble() / 100;
    }
    // Check unexistant months
    for (int month = 1; month <= 12; month++) {
      if (!spotsMap.containsKey(month)) {
        spotsMap[month] = 0.0;
      }
    }
    // Data conversion
    List<FlSpot> spots = [];
    for (int month in spotsMap.keys.toList()..sort()) {
      spots.add(FlSpot(month.toDouble(), spotsMap[month]!.toDouble()));
    }
    return LineChartBarData(
        isCurved: true,
        preventCurveOverShooting: true,
        color: const Color.fromARGB(225, 224, 167, 231),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          color: const Color.fromARGB(47, 224, 167, 231),
        ),
        spots: spots);
  }

  @visibleForTesting
  MinMaxDto getMinMaxQuantity(final List<MonthlySavingEntity> monthlySavings) {
    if (minMaxModelState.value != null) return minMaxModelState.value!;
    double maxQuantity = 4.0;
    double minQuantity = 0.0;
    Map<String, double> quantityMap = {};
    Map<String, double> expectedMap = {};
    for (final monthlySaving in monthlySavings) {
      String key = "${monthlySaving.month}";
      if (quantityMap.containsKey(key)) {
        quantityMap[key] = quantityMap[key]! + monthlySaving.grossQuantity;
      } else {
        quantityMap[key] = monthlySaving.grossQuantity;
      }
      if (expectedMap.containsKey(key)) {
        expectedMap[key] = expectedMap[key]! + monthlySaving.expectedQuantity;
      } else {
        expectedMap[key] = monthlySaving.expectedQuantity;
      }
    }
    if (monthlySavings.isNotEmpty) {
      maxQuantity = quantityMap.values.reduce(max);
      double maxExpected = expectedMap.values.reduce(max);
      if (maxQuantity < maxExpected) maxQuantity = maxExpected;
      minQuantity = quantityMap.values.reduce(min);
      double minExpected = expectedMap.values.reduce(min);
      if (minQuantity > minExpected) minQuantity = minExpected;
    }
    if (maxQuantity < 4) maxQuantity = 4;
    if (minQuantity > 0) minQuantity = 0;
    minMaxModelState.value = MinMaxDto(min: minQuantity, max: maxQuantity);
    return minMaxModelState.value!;
  }
}
