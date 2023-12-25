import 'package:balhom/config/app_colors.dart';
import 'package:balhom/src/core/domain/failures/http/http_connection_failure.dart';
import 'package:balhom/src/core/router.dart';
import 'package:balhom/config/app_theme.dart';
import 'package:balhom/src/core/domain/failures/local_db/no_local_entry_failure.dart';
import 'package:balhom/src/core/presentation/views/app_title.dart';
import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/core/utils/widget_utils.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balhom/src/features/balance/presentation/views/balance_view.dart';
import 'package:balhom/src/features/balance/presentation/widgets/balance_edit_form.dart';
import 'package:balhom/src/features/balance/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceEditView extends ConsumerStatefulWidget {
  /// Route name
  static const routeName = 'balanceEdit';

  /// Route path
  static const routePath = 'edit';

  final int id;
  final BalanceTypeEnum balanceTypeEnum;

  const BalanceEditView(
      {required this.id, required this.balanceTypeEnum, super.key});

  @override
  ConsumerState<BalanceEditView> createState() => _BalanceEditViewState();
}

class _BalanceEditViewState extends ConsumerState<BalanceEditView> {
  bool edit = false;

  @override
  Widget build(BuildContext context) {
    final isConnected = connectionStateListenable.value;

    final appLocalizations = ref.read(appLocalizationsProvider);
    final theme = ref.watch(themeDataProvider);

    final balanceListState = widget.balanceTypeEnum.isExpense()
        ? ref.watch(expenseListControllerProvider)
        : ref.watch(revenueListControllerProvider);

    return balanceListState.when(data: (data) {
      return data.fold((failure) {
        if (failure is HttpConnectionFailure ||
            failure is NoLocalEntryFailure) {
          return showError(
              icon: Icons.network_wifi_1_bar,
              text: appLocalizations.noConnection);
        }
        return showError(text: failure.detail);
      }, (entities) {
        return Scaffold(
          backgroundColor: widget.balanceTypeEnum.isExpense()
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
              onPressed: () => router.goNamed(widget.balanceTypeEnum.isExpense()
                  ? BalanceView.routeExpenseName
                  : BalanceView.routeRevenueName),
            ),
            actions: [
              if (isConnected)
                IconButton(
                  icon: Icon(
                    (!edit) ? Icons.edit : Icons.cancel_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      edit = !edit;
                    });
                  },
                )
            ],
          ),
          body: BalanceEditForm(
              edit: edit,
              balance:
                  entities.firstWhere((element) => element.id == widget.id),
              balanceTypeEnum: widget.balanceTypeEnum),
        );
      });
    }, error: (error, _) {
      return Scaffold(
          body: showError(error: error, text: appLocalizations.genericError));
    }, loading: () {
      return Scaffold(body: showLoading());
    });
  }
}
