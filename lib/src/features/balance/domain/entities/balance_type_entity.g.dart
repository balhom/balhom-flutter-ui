// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_type_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BalanceTypeEntityImpl _$$BalanceTypeEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$BalanceTypeEntityImpl(
      type: $enumDecode(_$BalanceTypeEnumEnumMap, json['type']),
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$BalanceTypeEntityImplToJson(
        _$BalanceTypeEntityImpl instance) =>
    <String, dynamic>{
      'type': _$BalanceTypeEnumEnumMap[instance.type]!,
      'name': instance.name,
      'image': instance.image,
    };

const _$BalanceTypeEnumEnumMap = {
  BalanceTypeEnum.revenue: 'REVENUE',
  BalanceTypeEnum.expense: 'EXPENSE',
};
