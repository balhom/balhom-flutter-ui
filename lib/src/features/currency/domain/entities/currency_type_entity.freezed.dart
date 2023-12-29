// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_type_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrencyTypeEntity _$CurrencyTypeEntityFromJson(Map<String, dynamic> json) {
  return _CurrencyTypeEntity.fromJson(json);
}

/// @nodoc
mixin _$CurrencyTypeEntity {
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyTypeEntityCopyWith<CurrencyTypeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyTypeEntityCopyWith<$Res> {
  factory $CurrencyTypeEntityCopyWith(
          CurrencyTypeEntity value, $Res Function(CurrencyTypeEntity) then) =
      _$CurrencyTypeEntityCopyWithImpl<$Res, CurrencyTypeEntity>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class _$CurrencyTypeEntityCopyWithImpl<$Res, $Val extends CurrencyTypeEntity>
    implements $CurrencyTypeEntityCopyWith<$Res> {
  _$CurrencyTypeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyTypeEntityImplCopyWith<$Res>
    implements $CurrencyTypeEntityCopyWith<$Res> {
  factory _$$CurrencyTypeEntityImplCopyWith(_$CurrencyTypeEntityImpl value,
          $Res Function(_$CurrencyTypeEntityImpl) then) =
      __$$CurrencyTypeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$CurrencyTypeEntityImplCopyWithImpl<$Res>
    extends _$CurrencyTypeEntityCopyWithImpl<$Res, _$CurrencyTypeEntityImpl>
    implements _$$CurrencyTypeEntityImplCopyWith<$Res> {
  __$$CurrencyTypeEntityImplCopyWithImpl(_$CurrencyTypeEntityImpl _value,
      $Res Function(_$CurrencyTypeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$CurrencyTypeEntityImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CurrencyTypeEntityImpl implements _CurrencyTypeEntity {
  const _$CurrencyTypeEntityImpl({required this.code});

  factory _$CurrencyTypeEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyTypeEntityImplFromJson(json);

  @override
  final String code;

  @override
  String toString() {
    return 'CurrencyTypeEntity(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyTypeEntityImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyTypeEntityImplCopyWith<_$CurrencyTypeEntityImpl> get copyWith =>
      __$$CurrencyTypeEntityImplCopyWithImpl<_$CurrencyTypeEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyTypeEntityImplToJson(
      this,
    );
  }
}

abstract class _CurrencyTypeEntity implements CurrencyTypeEntity {
  const factory _CurrencyTypeEntity({required final String code}) =
      _$CurrencyTypeEntityImpl;

  factory _CurrencyTypeEntity.fromJson(Map<String, dynamic> json) =
      _$CurrencyTypeEntityImpl.fromJson;

  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$CurrencyTypeEntityImplCopyWith<_$CurrencyTypeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
