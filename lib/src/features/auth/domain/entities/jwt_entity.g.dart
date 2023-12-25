// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JwtEntityImpl _$$JwtEntityImplFromJson(Map<String, dynamic> json) =>
    _$JwtEntityImpl(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$$JwtEntityImplToJson(_$JwtEntityImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('access_token', instance.accessToken);
  writeNotNull('refresh_token', instance.refreshToken);
  return val;
}
