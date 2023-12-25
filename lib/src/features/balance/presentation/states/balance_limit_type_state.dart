import 'package:balhom/src/features/balance/presentation/models/balance_limit_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceLimitTypeState extends StateNotifier<BalanceLimitTypeEnum> {
  BalanceLimitTypeState(super.balanceLimitType);

  void setBalanceLimitType(BalanceLimitTypeEnum balanceLimitType) {
    state = balanceLimitType;
  }
}
