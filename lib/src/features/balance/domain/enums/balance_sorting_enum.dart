enum BalanceSortingEnum {
  ascDate("date"),
  descDate("-date"),
  ascConvertedQuantity("converted_quantity"),
  descConvertedQuantity("-converted_quantity"),
  name("name");

  final String value;

  const BalanceSortingEnum(this.value);
}
