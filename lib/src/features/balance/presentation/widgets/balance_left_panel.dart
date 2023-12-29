import 'package:balhom/config/app_colors.dart';
import 'package:balhom/src/core/utils/platform_utils.dart';
import 'package:balhom/config/app_theme.dart';
import 'package:balhom/src/core/domain/enums/selected_date_enum.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/utils/date_util.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/balance/presentation/widgets/balance_bar_chart.dart';
import 'package:balhom/src/features/balance/presentation/widgets/balance_line_chart.dart';
import 'package:balhom/src/features/balance/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanaceLeftPanel extends ConsumerWidget {
  final List<BalanceEntity> balances;

  final BalanceTypeEnum balanceTypeEnum;

  final cache = ValueNotifier<Widget>(Container());

  BalanaceLeftPanel(
      {required this.balances, required this.balanceTypeEnum, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);
    final theme = ref.watch(themeDataProvider);

    final selectedDate = balanceTypeEnum.isExpense()
        ? ref.watch(expenseSelectedDateProvider)
        : ref.watch(revenueSelectedDateProvider);

    final balanceStatisticsState = ref.watch(balanceStatisticsUseCaseProvider);
    final balanceSummaryState = ref.watch(balanceSummaryUseCaseProvider);

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double chartLineHeight = (screenHeight * 0.45 <= 300)
        ? 300
        : (screenHeight * 0.45 <= 400)
            ? screenHeight * 0.45
            : 400;

    return balanceStatisticsState.when(data: (statisticsDto) {
      return balanceSummaryState.when(data: (balanceSummaryList) {
        cache.value = Container(
          constraints: const BoxConstraints.expand(),
          color: balanceTypeEnum.isExpense()
              ? theme == AppTheme.darkTheme
                  ? AppColors.expenseBackgroundDarkColor
                  : AppColors.expenseBackgroundLightColor
              : theme == AppTheme.darkTheme
                  ? AppColors.revenueBackgroundDarkColor
                  : AppColors.revenueBackgroundLightColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: chartLineHeight * 1.1,
                  width: PlatformUtils.isSmallWindow(context)
                      ? screenWidth * 0.95
                      : screenWidth * 0.45,
                  child: BalanceBarChart(
                      balanceSummaryList: balanceSummaryList,
                      balanceTypeEnum: balanceTypeEnum),
                ),
                if (selectedDate.selectedDateMode != SelectedDateEnum.day)
                  SizedBox(
                    height: chartLineHeight,
                    width: PlatformUtils.isSmallWindow(context)
                        ? screenWidth * 0.95
                        : screenWidth * 0.45,
                    child: BalanceLineChart(
                      selectedDateMode: selectedDate.selectedDateMode,
                      selectedMonth: selectedDate.month,
                      selectedYear: selectedDate.year,
                      monthList: DateUtil.getMonthDict(appLocalizations)
                          .values
                          .toList(),
                      showExpenses: balanceTypeEnum.isExpense(),
                      showRevenues: !balanceTypeEnum.isExpense(),
                      dailyStatisticsList: statisticsDto.dailyStatistics,
                      monthlyStatisticsList: statisticsDto.monthlyStatistics,
                    ),
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
  }
}
