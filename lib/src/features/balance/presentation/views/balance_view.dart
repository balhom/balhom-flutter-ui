import 'package:balhom/src/core/domain/failures/http/http_connection_failure.dart';
import 'package:balhom/src/core/router.dart';
import 'package:balhom/src/core/domain/failures/local_db/no_local_entry_failure.dart';
import 'package:balhom/src/core/presentation/models/selected_date.dart';
import 'package:balhom/src/core/presentation/models/selected_date_mode.dart';
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

class BalanceView extends ConsumerWidget {
  /// Named route for revenues [BalanceView]
  static const String routeRevenueName = 'revenues';

  /// Path route for revenues [BalanceView]
  static const String routeRevenuePath = 'revenues';

  /// Named route for expenses [BalanceView]
  static const String routeExpenseName = 'expenses';

  /// Path route for expenses [BalanceView]
  static const String routeExpensePath = 'expenses';

  @visibleForTesting
  final cache = ValueNotifier<Widget>(Container());

  final BalanceTypeEnum balanceTypeEnum;

  BalanceView({required this.balanceTypeEnum, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balanceListState = balanceTypeEnum.isExpense()
        ? ref.watch(expenseListControllerProvider)
        : ref.watch(revenueListControllerProvider);
    final balanceYearState = ref.watch(balanceYearsControllerProvider);

    final appLocalizations = ref.watch(appLocalizationsProvider);

    final selectedDate = balanceTypeEnum == BalanceTypeEnum.expense
        ? ref.watch(expenseSelectedDateProvider)
        : ref.watch(revenueSelectedDateProvider);
    final selectedDateState = balanceTypeEnum == BalanceTypeEnum.expense
        ? ref.read(expenseSelectedDateProvider.notifier)
        : ref.read(revenueSelectedDateProvider.notifier);

    return balanceYearState.when<Widget>(data: (balanceYears) {
      return balanceListState.when<Widget>(data: (balanceListOptional) {
        return balanceListOptional.fold((failure) {
          if (failure is HttpConnectionFailure ||
              failure is NoLocalEntryFailure) {
            return showError(
                icon: Icons.network_wifi_1_bar,
                text: appLocalizations.noConnection,
                background: cache.value);
          }
          return showError(text: failure.detail, background: cache.value);
        }, (entities) {
          List<BalanceEntity> filteredBalances = [];
          for (BalanceEntity e in entities) {
            if (selectedDate.year != e.date.year) continue;
            if (selectedDate.selectedDateMode == SelectedDateEnum.month ||
                selectedDate.selectedDateMode == SelectedDateEnum.day) {
              if (selectedDate.month != e.date.month) continue;
              if (selectedDate.selectedDateMode == SelectedDateEnum.day) {
                if (selectedDate.day != e.date.day) continue;
              }
            }
            filteredBalances.add(e);
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
        });
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
