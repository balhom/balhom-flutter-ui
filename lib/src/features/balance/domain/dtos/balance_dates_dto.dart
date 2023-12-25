import 'package:balhom/src/features/statistics/domain/entities/annual_balance_entity.dart';
import 'package:balhom/src/features/statistics/domain/entities/monthly_balance_entity.dart';

class BalanceDateListDto {
  List<MonthlyBalanceEntity> monthlyBalances;
  List<AnnualBalanceEntity> annualBalances;

  BalanceDateListDto({
    required this.monthlyBalances,
    required this.annualBalances,
  });
}
