import 'package:balhom/src/core/router.dart';
import 'package:balhom/src/core/domain/dtos/selected_date_dto.dart';
import 'package:balhom/src/core/domain/enums/selected_date_enum.dart';
import 'package:balhom/src/core/presentation/states/selected_date_state.dart';
import 'package:balhom/src/core/presentation/widgets/app_text_button.dart';
import 'package:balhom/src/core/presentation/widgets/app_error_dialog.dart';
import 'package:balhom/src/core/presentation/widgets/responsive_layout.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/balance/presentation/widgets/balance_left_panel.dart';
import 'package:balhom/src/features/balance/presentation/widgets/balance_right_panel.dart';
import 'package:balhom/src/features/balance/presentation/widgets/date_balance_dialog.dart';
import 'package:balhom/src/features/balance/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BalancePanelView extends ConsumerWidget {
  final cache = ValueNotifier<Widget>(Container());

  final BalanceTypeEnum balanceTypeEnum;

  BalancePanelView({required this.balanceTypeEnum, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balanceListState = ref.watch(balanceListUseCaseProvider);
    final balanceYearState = ref.watch(balanceYearsUseCaseProvider);

    final appLocalizations = ref.watch(appLocalizationsProvider);

    final selectedDate = balanceTypeEnum == BalanceTypeEnum.expense
        ? ref.watch(expenseSelectedDateProvider)
        : ref.watch(revenueSelectedDateProvider);
    final selectedDateState = balanceTypeEnum == BalanceTypeEnum.expense
        ? ref.read(expenseSelectedDateProvider.notifier)
        : ref.read(revenueSelectedDateProvider.notifier);

    return balanceYearState.when<Widget>(data: (balanceYears) {
      return balanceListState.when<Widget>(data: (balanceList) {
        List<BalanceEntity> filteredBalances = [];
        for (final balance in balanceList) {
          if (selectedDate.year != balance.date.year) continue;
          if (selectedDate.selectedDateMode == SelectedDateEnum.month ||
              selectedDate.selectedDateMode == SelectedDateEnum.day) {
            if (selectedDate.month != balance.date.month) continue;
            if (selectedDate.selectedDateMode == SelectedDateEnum.day) {
              if (selectedDate.day != balance.date.day) continue;
            }
          }
          filteredBalances.add(balance);
        }
        cache.value = ResponsiveLayout(
            mobileChild: shortPanel(
                context,
                appLocalizations,
                selectedDateState,
                selectedDate,
                filteredBalances,
                balanceYears),
            tabletChild: shortPanel(
                context,
                appLocalizations,
                selectedDateState,
                selectedDate,
                filteredBalances,
                balanceYears),
            desktopChild: widePanel(
                context,
                appLocalizations,
                selectedDateState,
                selectedDate,
                filteredBalances,
                balanceYears));
        return cache.value;
      }, error: (error, _) {
        return showError(error: error, background: cache.value);
      }, loading: () {
        return showLoading(background: cache.value);
      });
    }, error: (error, _) {
      return showError(error: error, background: cache.value);
    }, loading: () {
      return showLoading(background: cache.value);
    });
  }

  Widget topContainer(
      BuildContext context,
      AppLocalizations appLocalizations,
      SelectedDateState selectedDateState,
      SelectedDateDto selectedDate,
      List<int> balanceYears) {
    // All posible date formatters
    final dayFormatter = DateFormat("dd MMM yyyy", appLocalizations.localeName);
    final monthFormatter = DateFormat("MMM yyyy", appLocalizations.localeName);
    final yearFormatter = DateFormat("yyyy");

    final dateText = (selectedDate.selectedDateMode == SelectedDateEnum.year)
        ? yearFormatter.format(selectedDate.dateFrom)
        : (selectedDate.selectedDateMode == SelectedDateEnum.month)
            ? monthFormatter.format(selectedDate.dateFrom).toUpperCase()
            : dayFormatter.format(selectedDate.dateFrom).toUpperCase();

    final screenWidth = MediaQuery.of(context).size.width;
    final topContainer = Container(
        color: balanceTypeEnum.isExpense()
            ? const Color.fromARGB(255, 212, 112, 78)
            : const Color.fromARGB(255, 76, 122, 52),
        height: 45,
        alignment: Alignment.center,
        child: Text(dateText,
            style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)));

    final dateBtn = Container(
      color: balanceTypeEnum.isExpense()
          ? const Color.fromARGB(255, 160, 71, 41)
          : const Color.fromARGB(255, 54, 90, 35),
      child: AppTextButton(
        text: appLocalizations.date,
        borderRadius: 5,
        backgroundColor: balanceTypeEnum.isExpense()
            ? const Color.fromARGB(255, 160, 71, 41)
            : const Color.fromARGB(255, 54, 90, 35),
        onPressed: () async {
          await showDateBalanceDialog(
              appLocalizations, selectedDateState, selectedDate, balanceYears);
        },
        height: 45,
        width: screenWidth < 550 ? screenWidth : 100,
      ),
    );

    return ResponsiveLayout(
        mobileChild: Column(children: [
          dateBtn,
          SizedBox(width: screenWidth, child: topContainer)
        ]),
        tabletChild: Row(children: [dateBtn, Expanded(child: topContainer)]),
        desktopChild: Row(children: [dateBtn, Expanded(child: topContainer)]));
  }

  Future<void> showDateBalanceDialog(
      AppLocalizations appLocalizations,
      SelectedDateState selectedDateState,
      SelectedDateDto selectedDate,
      List<int> balanceYears) async {
    if (balanceYears.isEmpty) {
      await showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) => AppErrorDialog(
                title: appLocalizations.date,
                description: appLocalizations.genericError,
                cancelText: appLocalizations.cancel,
              ));
    } else {
      await showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) => DateBalanceDialog(
                selectedDate: selectedDate,
                onPressed: (SelectedDateDto newDate) {
                  // Pop current dialog
                  Navigator.pop(context);
                  selectedDateState.setSelectedDate(newDate);
                },
                years: balanceYears,
              ));
    }
  }

  Widget shortPanel(
      BuildContext context,
      AppLocalizations appLocalizations,
      SelectedDateState selectedDateState,
      SelectedDateDto selectedDate,
      List<BalanceEntity> balances,
      List<int> balanceYears) {
    return Column(
      children: [
        topContainer(context, appLocalizations, selectedDateState, selectedDate,
            balanceYears),
        Expanded(
          child: BalanaceRightPanel(
              balances: balances, balanceTypeEnum: balanceTypeEnum),
        ),
      ],
    );
  }

  @visibleForTesting
  Widget widePanel(
      BuildContext context,
      AppLocalizations appLocalizations,
      SelectedDateState selectedDateState,
      SelectedDateDto selectedDate,
      List<BalanceEntity> balances,
      List<int> balanceYears) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        topContainer(context, appLocalizations, selectedDateState, selectedDate,
            balanceYears),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: BalanaceLeftPanel(
                    balances: balances, balanceTypeEnum: balanceTypeEnum),
              ),
              SizedBox(
                width: (screenWidth * 0.3 > 440) ? 440 : screenWidth * 0.3,
                child: BalanaceRightPanel(
                    balances: balances, balanceTypeEnum: balanceTypeEnum),
              )
            ],
          ),
        ),
      ],
    );
  }
}
