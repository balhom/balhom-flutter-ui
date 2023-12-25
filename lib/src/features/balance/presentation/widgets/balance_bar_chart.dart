import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/utils/type_util.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BalanceBarChart extends ConsumerWidget {
  final List<BalanceEntity> balances;
  final BalanceTypeEnum balanceTypeEnum;

  const BalanceBarChart(
      {required this.balances, required this.balanceTypeEnum, super.key});

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
    Map<String, double> dataMap = {};
    for (BalanceEntity balance in balances) {
      String key = balance.balanceType.name;
      if (dataMap.containsKey(key)) {
        dataMap[key] = dataMap[key]! + balance.convertedQuantity!;
      } else {
        dataMap[key] = balance.convertedQuantity!;
      }
    }
    for (String balanceType in dataMap.keys) {
      chartData.add(ChartData(
          TypeUtil.balanceTypeToString(balanceType, appLocalizations),
          dataMap[balanceType]!));
    }
    return chartData;
  }

  double getMax() {
    Map<String, double> dataMap = {};
    double max = 4;
    for (BalanceEntity balance in balances) {
      String key = balance.balanceType.name;
      if (dataMap.containsKey(key)) {
        dataMap[key] = dataMap[key]! + balance.convertedQuantity!;
      } else {
        dataMap[key] = balance.convertedQuantity!;
      }
    }
    for (String balanceType in dataMap.keys) {
      if (dataMap[balanceType]! > max) max = dataMap[balanceType]!;
    }
    return max.ceilToDouble();
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}