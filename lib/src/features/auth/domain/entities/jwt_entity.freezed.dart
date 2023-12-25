// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jwt_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JwtEntity _$JwtEntityFromJson(Map<String, dynamic> json) {
  return _JwtEntity.fromJson(json);
}

/// @nodoc
mixin _$JwtEntity {
// ignore: invalid_annotation_target
  @JsonKey(includeIfNull: false)
  String? get accessToken =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(includeIfNull: false)
  String? get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JwtEntityCopyWith<JwtEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JwtEntityCopyWith<$Res> {
  factory $JwtEntityCopyWith(JwtEntity value, $Res Function(JwtEntity) then) =
      _$JwtEntityCopyWithImpl<$Res, JwtEntity>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? accessToken,
      @JsonKey(includeIfNull: false) String? refreshToken});
}

/// @nodoc
class _$JwtEntityCopyWithImpl<$Res, $Val extends JwtEntity>
    implements $JwtEntityCopyWith<$Res> {
  _$JwtEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JwtEntityImplCopyWith<$Res>
    implements $JwtEntityCopyWith<$Res> {
  factory _$$JwtEntityImplCopyWith(
          _$JwtEntityImpl value, $Res Function(_$JwtEntityImpl) then) =
      __$$JwtEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? accessToken,
      @JsonKey(includeIfNull: false) String? refreshToken});
}

/// @nodoc
class __$$JwtEntityImplCopyWithImpl<$Res>
    extends _$JwtEntityCopyWithImpl<$Res, _$JwtEntityImpl>
    implements _$$JwtEntityImplCopyWith<$Res> {
  __$$JwtEntityImplCopyWithImpl(
      _$JwtEntityImpl _value, $Res Function(_$JwtEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_$JwtEntityImpl(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$JwtEntityImpl implements _JwtEntity {
  const _$JwtEntityImpl(
      {@JsonKey(includeIfNull: false) required this.accessToken,
      @JsonKey(includeIfNull: false) required this.refreshToken});

  factory _$JwtEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$JwtEntityImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(includeIfNull: false)
  final String? accessToken;
// ignore: invalid_annotation_target
  @override
  @JsonKey(includeIfNull: false)
  final String? refreshToken;

  @override
  String toString() {
    return 'JwtEntity(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JwtEntityImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JwtEntityImplCopyWith<_$JwtEntityImpl> get copyWith =>
      __$$JwtEntityImplCopyWithImpl<_$JwtEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JwtEntityImplToJson(
      this,
    );
  }
}

abstract class _JwtEntity implements JwtEntity {
  const factory _JwtEntity(
          {@JsonKey(includeIfNull: false) required final String? accessToken,
          @JsonKey(includeIfNull: false) required final String? refreshToken}) =
      _$JwtEntityImpl;

  factory _JwtEntity.fromJson(Map<String, dynamic> json) =
      _$JwtEntityImpl.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(includeIfNull: false)
  String? get accessToken;
  @override // ignore: invalid_annotation_target
  @JsonKey(includeIfNull: false)
  String? get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$JwtEntityImplCopyWith<_$JwtEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
