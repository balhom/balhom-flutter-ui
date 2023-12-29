// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_conversion_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrencyConversionEntity _$CurrencyConversionEntityFromJson(
    Map<String, dynamic> json) {
  return _CurrencyConversionEntity.fromJson(json);
}

/// @nodoc
mixin _$CurrencyConversionEntity {
  String get code => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyConversionEntityCopyWith<CurrencyConversionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyConversionEntityCopyWith<$Res> {
  factory $CurrencyConversionEntityCopyWith(CurrencyConversionEntity value,
          $Res Function(CurrencyConversionEntity) then) =
      _$CurrencyConversionEntityCopyWithImpl<$Res, CurrencyConversionEntity>;
  @useResult
  $Res call({String code, double value});
}

/// @nodoc
class _$CurrencyConversionEntityCopyWithImpl<$Res,
        $Val extends CurrencyConversionEntity>
    implements $CurrencyConversionEntityCopyWith<$Res> {
  _$CurrencyConversionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyConversionEntityImplCopyWith<$Res>
    implements $CurrencyConversionEntityCopyWith<$Res> {
  factory _$$CurrencyConversionEntityImplCopyWith(
          _$CurrencyConversionEntityImpl value,
          $Res Function(_$CurrencyConversionEntityImpl) then) =
      __$$CurrencyConversionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, double value});
}

/// @nodoc
class __$$CurrencyConversionEntityImplCopyWithImpl<$Res>
    extends _$CurrencyConversionEntityCopyWithImpl<$Res,
        _$CurrencyConversionEntityImpl>
    implements _$$CurrencyConversionEntityImplCopyWith<$Res> {
  __$$CurrencyConversionEntityImplCopyWithImpl(
      _$CurrencyConversionEntityImpl _value,
      $Res Function(_$CurrencyConversionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? value = null,
  }) {
    return _then(_$CurrencyConversionEntityImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CurrencyConversionEntityImpl implements _CurrencyConversionEntity {
  const _$CurrencyConversionEntityImpl(
      {required this.code, required this.value});

  factory _$CurrencyConversionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyConversionEntityImplFromJson(json);

  @override
  final String code;
  @override
  final double value;

  @override
  String toString() {
    return 'CurrencyConversionEntity(code: $code, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyConversionEntityImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyConversionEntityImplCopyWith<_$CurrencyConversionEntityImpl>
      get copyWith => __$$CurrencyConversionEntityImplCopyWithImpl<
          _$CurrencyConversionEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyConversionEntityImplToJson(
      this,
    );
  }
}

abstract class _CurrencyConversionEntity implements CurrencyConversionEntity {
  const factory _CurrencyConversionEntity(
      {required final String code,
      required final double value}) = _$CurrencyConversionEntityImpl;

  factory _CurrencyConversionEntity.fromJson(Map<String, dynamic> json) =
      _$CurrencyConversionEntityImpl.fromJson;

  @override
  String get code;
  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$CurrencyConversionEntityImplCopyWith<_$CurrencyConversionEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
