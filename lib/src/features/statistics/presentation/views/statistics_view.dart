import 'package:balhom/src/core/presentation/widgets/responsive_layout.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/currency/providers.dart';
import 'package:balhom/src/features/statistics/presentation/views/statistics_view_desktop.dart';
import 'package:balhom/src/features/statistics/presentation/views/statistics_view_mobile.dart';
import 'package:balhom/src/features/statistics/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatisticsView extends ConsumerWidget {
  /// Named route for [StatisticsView]
  static const String routeName = 'statistics';

  /// Path route for [StatisticsView]
  static const String routePath = 'statistics';

  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: loadData(ref),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return showLoading();
          }
          return ResponsiveLayout(
            desktopChild: StatisticsViewDesktop(),
            mobileChild: StatisticsViewMobile(),
            tabletChild: StatisticsViewMobile(),
          );
        });
  }

  Future<void> loadData(final WidgetRef ref) async {
    final selectedDate = ref.read(statisticsBalanceSelectedDateProvider);
    await ref.read(monthlySavingsUseCaseProvider.notifier).handle(selectedDate);
    await ref.read(annualSavingsUseCaseProvider.notifier).handle(selectedDate);
    await ref.read(statisticsUseCaseProvider.notifier).handle(selectedDate);
    await ref.read(daysCurrencyConversionsUseCaseProvider.notifier).handle(20);
  }
}
