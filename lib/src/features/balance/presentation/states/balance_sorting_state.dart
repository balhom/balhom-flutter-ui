import 'package:balhom/src/features/balance/domain/enums/balance_sorting_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceSortingState extends StateNotifier<BalanceSortingEnum> {
  BalanceSortingState(super.balanceOrderingType);

  void setBalanceOrderingType(final BalanceSortingEnum balanceSortingEnum) {
    state = balanceSortingEnum;
  }
}
