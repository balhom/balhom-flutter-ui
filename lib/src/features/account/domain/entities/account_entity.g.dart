// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountEntityImpl _$$AccountEntityImplFromJson(Map<String, dynamic> json) =>
    _$AccountEntityImpl(
      username: json['username'] as String,
      email: json['email'] as String,
      receiveEmailBalance: json['receive_email_balance'] as bool,
      currentBalance: (json['current_balance'] as num).toDouble(),
      expectedAnnualBalance:
          (json['expected_annual_balance'] as num).toDouble(),
      expectedMonthlyBalance:
          (json['expected_monthly_balance'] as num).toDouble(),
      locale: json['locale'] as String,
      prefCurrencyType: json['pref_currency_type'] as String,
      image: json['image'] as String?,
      lastLogin: json['last_login'] == null
          ? null
          : DateTime.parse(json['last_login'] as String),
    );

Map<String, dynamic> _$$AccountEntityImplToJson(_$AccountEntityImpl instance) {
  final val = <String, dynamic>{
    'username': instance.username,
    'email': instance.email,
    'receive_email_balance': instance.receiveEmailBalance,
    'current_balance': instance.currentBalance,
    'expected_annual_balance': instance.expectedAnnualBalance,
    'expected_monthly_balance': instance.expectedMonthlyBalance,
    'locale': instance.locale,
    'pref_currency_type': instance.prefCurrencyType,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('image', instance.image);
  writeNotNull('last_login', instance.lastLogin?.toIso8601String());
  return val;
}
