import 'package:balhom/src/core/utils/platform_utils.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/statistics/domain/entities/annual_saving_entity.dart';
import 'package:balhom/src/features/statistics/presentation/widgets/savings/statistics_savings_eight_years_line_chart.dart';
import 'package:balhom/src/features/statistics/presentation/widgets/statistics_chart_title_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatisticsSavingsEightYearsChartContainer extends ConsumerWidget {
  final List<AnnualSavingEntity> annualBalances;

  const StatisticsSavingsEightYearsChartContainer(
      {required this.annualBalances, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);
    // Screen sizes:
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double chartLineHeight = (screenHeight * 0.45 <= 200)
        ? 200
        : (screenHeight * 0.45 <= 350)
            ? screenHeight * 0.45
            : 350;
    return Expanded(
      child: Column(
        children: [
          StatisticsChartTitleContainer(
            backgroundColor: const Color.fromARGB(255, 194, 56, 235),
            text: appLocalizations.savingsEightChartTitle,
          ),
          SizedBox(
              height: chartLineHeight,
              width: (PlatformUtils.isSmallWindow(context))
                  ? screenWidth * 0.95
                  : screenWidth * 0.45,
              child: StatisticsSavingsEightYearsLineChart(
                annualBalances: annualBalances,
              )),
        ],
      ),
    );
  }
}
