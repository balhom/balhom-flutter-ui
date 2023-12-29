import 'package:balhom/src/features/balance/domain/enums/balance_limit_type_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceLimitTypeState extends StateNotifier<BalanceLimitTypeEnum> {
  BalanceLimitTypeState(super.balanceLimitType);

  void setBalanceLimitType(BalanceLimitTypeEnum balanceLimitType) {
    state = balanceLimitType;
  }
}
