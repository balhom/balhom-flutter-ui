// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BalanceEntityImpl _$$BalanceEntityImplFromJson(Map<String, dynamic> json) =>
    _$BalanceEntityImpl(
      id: json['id'] as int?,
      name: json['name'] as String,
      description: json['description'] as String,
      realQuantity: (json['real_quantity'] as num).toDouble(),
      convertedQuantity: (json['converted_quantity'] as num?)?.toDouble(),
      date: DateTime.parse(json['date'] as String),
      currencyType: json['currency_type'] as String,
      balanceType: BalanceTypeEntity.fromJson(
          json['balance_type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BalanceEntityImplToJson(_$BalanceEntityImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  val['description'] = instance.description;
  val['real_quantity'] = instance.realQuantity;
  writeNotNull('converted_quantity', instance.convertedQuantity);
  val['date'] = instance.date.toIso8601String();
  val['currency_type'] = instance.currencyType;
  val['balance_type'] = instance.balanceType;
  return val;
}
