import 'package:balhom/src/core/domain/enums/selected_date_enum.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/statistics/presentation/widgets/savings/statistics_savings_year_chart_container.dart';
import 'package:balhom/src/features/statistics/presentation/widgets/statistics_balance_chart_container.dart';
import 'package:balhom/src/features/statistics/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatisticsViewMobile extends ConsumerWidget {
  @visibleForTesting
  final cache = ValueNotifier<Widget>(Container());

  StatisticsViewMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeDataProvider);
    final appLocalizations = ref.watch(appLocalizationsProvider);

    final monthlyBalanceListState = ref.watch(monthlySavingsUseCaseProvider);
    final statisticsState = ref.watch(statisticsUseCaseProvider);

    return monthlyBalanceListState.when<Widget>(data: (monthlyBalanceList) {
      return statisticsState.when<Widget>(data: (statisticsData) {
        cache.value = LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              color: theme.colorScheme.background,
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const StatisticsSavingsYearChartContainer(),
                    StatisticsBalanceChartContainer(
                      dateMode: SelectedDateEnum.year,
                      dailyStatistics: statisticsData.dailyStatistics,
                      monthlyStatistics: statisticsData.monthlyStatistics,
                    )
                  ],
                ),
              ),
            ),
          );
        });
        return cache.value;
      }, error: (error, _) {
        return showError(
            error: error,
            background: cache.value,
            text: appLocalizations.genericError);
      }, loading: () {
        return showLoading(background: cache.value);
      });
    }, error: (error, _) {
      return showError(
          error: error,
          background: cache.value,
          text: appLocalizations.genericError);
    }, loading: () {
      return showLoading(background: cache.value);
    });
  }
}
