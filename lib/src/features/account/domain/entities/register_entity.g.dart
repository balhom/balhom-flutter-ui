// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterEntityImpl _$$RegisterEntityImplFromJson(Map<String, dynamic> json) =>
    _$RegisterEntityImpl(
      username: json['username'] as String,
      email: json['email'] as String,
      locale: json['locale'] as String,
      prefCurrencyType: json['pref_currency_type'] as String,
      password: json['password'] as String,
      repeatPassword: json['repeat_password'] as String,
    );

Map<String, dynamic> _$$RegisterEntityImplToJson(
        _$RegisterEntityImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'locale': instance.locale,
      'pref_currency_type': instance.prefCurrencyType,
      'password': instance.password,
      'repeat_password': instance.repeatPassword,
    };
