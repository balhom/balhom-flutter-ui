import 'package:balhom/config/app_colors.dart';
import 'package:balhom/config/app_theme.dart';
import 'package:balhom/src/core/domain/enums/selected_date_enum.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/currency/domain/entities/currency_type_entity.dart';
import 'package:balhom/src/features/currency/domain/entities/date_currency_conversion_list_entity.dart';
import 'package:balhom/src/features/currency/presentation/widgets/currency_chart_container.dart';
import 'package:balhom/src/features/currency/providers.dart';
import 'package:balhom/src/features/statistics/presentation/widgets/statistics_balance_chart_container.dart';
import 'package:balhom/src/features/statistics/presentation/widgets/savings/statistics_savings_eight_years_chart_container.dart';
import 'package:balhom/src/features/statistics/presentation/widgets/savings/statistics_savings_year_chart_container.dart';
import 'package:balhom/src/features/statistics/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatisticsViewDesktop extends ConsumerWidget {
  @visibleForTesting
  final cache = ValueNotifier<Widget>(Container());

  StatisticsViewDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = connectionStateListenable.value;

    final theme = ref.watch(themeDataProvider);
    final appLocalizations = ref.watch(appLocalizationsProvider);

    final statisticsDataState = ref.watch(statisticsUseCaseProvider);

    final monthlySavingsState = ref.watch(monthlySavingsUseCaseProvider);
    final annualSavingsState = ref.watch(annualSavingsUseCaseProvider);

    final daysCurrencyConversionsState =
        ref.watch(daysCurrencyConversionsUseCaseProvider);
    final currencyTypesState = ref.watch(currencyTypeListsUseCaseProvider);

    return monthlySavingsState.when<Widget>(data: (monthlyBalanceList) {
      return annualSavingsState.when<Widget>(data: (annualBalanceList) {
        return statisticsDataState.when<Widget>(data: (statisticsData) {
          return daysCurrencyConversionsState.when<Widget>(
              data: (daysCurrencyConversions) {
            return currencyTypesState.when<Widget>(data: (currencyTypes) {
              cache.value = SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: theme.colorScheme.background,
                      foregroundDecoration: BoxDecoration(border: Border.all()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StatisticsBalanceChartContainer(
                            dateMode: SelectedDateEnum.month,
                            dailyStatistics: statisticsData.dailyStatistics,
                            monthlyStatistics: statisticsData.monthlyStatistics,
                          ),
                          StatisticsBalanceChartContainer(
                            dateMode: SelectedDateEnum.year,
                            dailyStatistics: statisticsData.dailyStatistics,
                            monthlyStatistics: statisticsData.monthlyStatistics,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: theme == AppTheme.lightTheme
                          ? AppColors.balanceBackgroundColor
                          : AppColors.balanceDarkBackgroundColor,
                      foregroundDecoration: BoxDecoration(border: Border.all()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const StatisticsSavingsYearChartContainer(),
                          StatisticsSavingsEightYearsChartContainer(
                            annualBalances: annualBalanceList,
                          )
                        ],
                      ),
                    ),
                    (isConnected)
                        ? statisticsCurrencyChartContainer(
                            daysCurrencyConversions, currencyTypes, theme)
                        : showError(
                            background: statisticsCurrencyChartContainer(
                                daysCurrencyConversions, currencyTypes, theme),
                            icon: Icons.network_wifi_1_bar,
                            text: appLocalizations.noConnection)
                  ],
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

  Widget statisticsCurrencyChartContainer(
      DateCurrencyConversionListEntity dateCurrencyConversionList,
      List<CurrencyTypeEntity> currencyTypes,
      ThemeData theme) {
    return Container(
        color: theme == AppTheme.lightTheme
            ? const Color.fromARGB(254, 201, 241, 253)
            : const Color.fromARGB(253, 112, 157, 170),
        foregroundDecoration: BoxDecoration(border: Border.all()),
        child: StatisticsCurrencyChartContainer(
          dateCurrencyConversion: dateCurrencyConversionList,
          currencyTypes: currencyTypes,
        ));
  }
}
