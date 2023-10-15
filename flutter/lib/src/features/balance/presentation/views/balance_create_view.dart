import 'package:balance_home_app/config/app_colors.dart';
import 'package:balance_home_app/src/core/router.dart';
import 'package:balance_home_app/config/app_theme.dart';
import 'package:balance_home_app/src/core/presentation/views/app_title.dart';
import 'package:balance_home_app/src/core/providers.dart';
import 'package:balance_home_app/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balance_home_app/src/features/balance/presentation/views/balance_view.dart';
import 'package:balance_home_app/src/features/balance/presentation/widgets/balance_create_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceCreateView extends ConsumerWidget {
  /// Route name
  static const routeName = 'balanceCreate';

  /// Route path
  static const routePath = 'create';

  final BalanceTypeEnum balanceTypeEnum;

  const BalanceCreateView({required this.balanceTypeEnum, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeDataProvider);
    return Scaffold(
      backgroundColor: balanceTypeEnum.isExpense()
          ? theme == AppTheme.darkTheme
              ? AppColors.expenseBackgroundDarkColor
              : AppColors.expenseBackgroundLightColor
          : theme == AppTheme.darkTheme
              ? AppColors.revenueBackgroundDarkColor
              : AppColors.revenueBackgroundLightColor,
      appBar: AppBar(
        title: const AppTitle(fontSize: 30),
        backgroundColor: AppColors.appBarBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => router.goNamed(balanceTypeEnum.isExpense()
              ? BalanceView.routeExpenseName
              : BalanceView.routeRevenueName),
        ),
      ),
      body: BalanceCreateForm(balanceTypeEnum: balanceTypeEnum),
    );
  }
}
