import 'package:balhom/config/app_colors.dart';
import 'package:balhom/config/app_theme.dart';
import 'package:balhom/src/core/presentation/models/selected_date_mode.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/balance/providers.dart';
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

    final balanceYearsState = ref.watch(balanceYearsControllerProvider);
    final monthlyBalanceListState =
        ref.watch(monthlyBalanceListControllerProvider);
    final statisticsState = ref.watch(statisticsControllerProvider);

    return balanceYearsState.when<Widget>(data: (balanceYears) {
      return monthlyBalanceListState.when<Widget>(data: (monthlyBalanceList) {
        return statisticsState.when<Widget>(data: (statisticsData) {
          cache.value = SingleChildScrollView(
            child: Container(
              color: theme == AppTheme.lightTheme
                  ? AppColors.balanceBackgroundColor
                  : AppColors.balanceDarkBackgroundColor,
              child: Column(
                children: [
                  StatisticsSavingsYearChartContainer(
                    monthlyBalances: monthlyBalanceList,
                    balanceYears: balanceYears,
                  ),
                  StatisticsBalanceChartContainer(
                    dateMode: SelectedDateEnum.year,
                    dailyStatistics: statisticsData.dailyStatistics,
                    monthlyStatistics: statisticsData.monthlyStatistics,
                    balanceYears: balanceYears,
                  )
                ],
              ),
            ),
          );
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
