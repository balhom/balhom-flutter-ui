import 'package:balance_home_app/src/features/balance/presentation/models/balance_ordering_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceOrderingTypeState extends StateNotifier<BalanceOrderingTypeEnum> {
  BalanceOrderingTypeState(super.balanceOrderingType);

  void setBalanceOrderingType(BalanceOrderingTypeEnum balanceOrderingType) {
    state = balanceOrderingType;
  }
}
