import 'package:balance_home_app/config/app_colors.dart';
import 'package:balance_home_app/src/core/utils/platform_utils.dart';
import 'package:balance_home_app/config/app_theme.dart';
import 'package:balance_home_app/src/core/presentation/models/selected_date_mode.dart';
import 'package:balance_home_app/src/core/providers.dart';
import 'package:balance_home_app/src/core/utils/date_util.dart';
import 'package:balance_home_app/src/core/utils/widget_utils.dart';
import 'package:balance_home_app/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balance_home_app/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balance_home_app/src/features/balance/presentation/widgets/balance_bar_chart.dart';
import 'package:balance_home_app/src/features/balance/presentation/widgets/balance_line_chart.dart';
import 'package:balance_home_app/src/features/balance/providers.dart';
import 'package:balance_home_app/src/features/statistics/providers.dart';
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

    final statisticsState = ref.watch(statisticsControllerProvider);

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double chartLineHeight = (screenHeight * 0.45 <= 300)
        ? 300
        : (screenHeight * 0.45 <= 400)
            ? screenHeight * 0.45
            : 400;

    return statisticsState.when(data: (statisticsDto) {
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
                    balances: balances, balanceTypeEnum: balanceTypeEnum),
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
                    monthList:
                        DateUtil.getMonthDict(appLocalizations).values.toList(),
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
  }
}
