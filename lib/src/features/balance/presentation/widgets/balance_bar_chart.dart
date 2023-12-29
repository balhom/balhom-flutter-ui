import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/utils/type_util.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_summary_entity.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BalanceBarChart extends ConsumerWidget {
  final List<BalanceSummaryEntity> balanceSummaryList;
  final BalanceTypeEnum balanceTypeEnum;

  const BalanceBarChart(
      {required this.balanceSummaryList,
      required this.balanceTypeEnum,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);
    List<ChartData> data = getBalanceData(appLocalizations);
    double max = getMax();
    return Padding(
        padding: const EdgeInsets.all(15),
        child: SfCartesianChart(
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? null
                : balanceTypeEnum == BalanceTypeEnum.expense
                    ? const Color.fromARGB(108, 136, 47, 39)
                    : const Color.fromARGB(108, 0, 109, 44),
            primaryXAxis: const CategoryAxis(),
            primaryYAxis:
                NumericAxis(minimum: 0, maximum: max, interval: max / 5),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries<ChartData, String>>[
              BarSeries<ChartData, String>(
                  dataSource: data,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  width: (data.length < 2) ? 0.2 : 0.7,
                  color: balanceTypeEnum == BalanceTypeEnum.expense
                      ? const Color.fromARGB(255, 232, 80, 65)
                      : const Color.fromARGB(255, 0, 179, 71))
            ]));
  }

  List<ChartData> getBalanceData(AppLocalizations appLocalizations) {
    List<ChartData> chartData = [];
    for (final balanceSummary in balanceSummaryList) {
      chartData.add(ChartData(
          TypeUtil.balanceTypeToString(balanceSummary.type, appLocalizations),
          balanceSummary.quantity));
    }
    return chartData;
  }

  double getMax() {
    double max = 4;
    for (final balanceSummary in balanceSummaryList) {
      if (balanceSummary.quantity > max) max = balanceSummary.quantity;
    }
    return max.ceilToDouble();
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
