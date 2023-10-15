import 'package:freezed_annotation/freezed_annotation.dart';

enum BalanceTypeEnum {
  @JsonValue("REVENUE")
  revenue,
  @JsonValue("EXPENSE")
  expense;

  bool isExpense() {
    return this == BalanceTypeEnum.expense;
  }
}
