// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_conversion_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrencyConversionListEntity _$CurrencyConversionListEntityFromJson(
    Map<String, dynamic> json) {
  return _CurrencyConversionListEntity.fromJson(json);
}

/// @nodoc
mixin _$CurrencyConversionListEntity {
  String get code => throw _privateConstructorUsedError;
  List<CurrencyConversionEntity> get conversions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyConversionListEntityCopyWith<CurrencyConversionListEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyConversionListEntityCopyWith<$Res> {
  factory $CurrencyConversionListEntityCopyWith(
          CurrencyConversionListEntity value,
          $Res Function(CurrencyConversionListEntity) then) =
      _$CurrencyConversionListEntityCopyWithImpl<$Res,
          CurrencyConversionListEntity>;
  @useResult
  $Res call({String code, List<CurrencyConversionEntity> conversions});
}

/// @nodoc
class _$CurrencyConversionListEntityCopyWithImpl<$Res,
        $Val extends CurrencyConversionListEntity>
    implements $CurrencyConversionListEntityCopyWith<$Res> {
  _$CurrencyConversionListEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? conversions = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      conversions: null == conversions
          ? _value.conversions
          : conversions // ignore: cast_nullable_to_non_nullable
              as List<CurrencyConversionEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyConversionListEntityImplCopyWith<$Res>
    implements $CurrencyConversionListEntityCopyWith<$Res> {
  factory _$$CurrencyConversionListEntityImplCopyWith(
          _$CurrencyConversionListEntityImpl value,
          $Res Function(_$CurrencyConversionListEntityImpl) then) =
      __$$CurrencyConversionListEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, List<CurrencyConversionEntity> conversions});
}

/// @nodoc
class __$$CurrencyConversionListEntityImplCopyWithImpl<$Res>
    extends _$CurrencyConversionListEntityCopyWithImpl<$Res,
        _$CurrencyConversionListEntityImpl>
    implements _$$CurrencyConversionListEntityImplCopyWith<$Res> {
  __$$CurrencyConversionListEntityImplCopyWithImpl(
      _$CurrencyConversionListEntityImpl _value,
      $Res Function(_$CurrencyConversionListEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? conversions = null,
  }) {
    return _then(_$CurrencyConversionListEntityImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      conversions: null == conversions
          ? _value._conversions
          : conversions // ignore: cast_nullable_to_non_nullable
              as List<CurrencyConversionEntity>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CurrencyConversionListEntityImpl
    implements _CurrencyConversionListEntity {
  const _$CurrencyConversionListEntityImpl(
      {required this.code,
      required final List<CurrencyConversionEntity> conversions})
      : _conversions = conversions;

  factory _$CurrencyConversionListEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CurrencyConversionListEntityImplFromJson(json);

  @override
  final String code;
  final List<CurrencyConversionEntity> _conversions;
  @override
  List<CurrencyConversionEntity> get conversions {
    if (_conversions is EqualUnmodifiableListView) return _conversions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversions);
  }

  @override
  String toString() {
    return 'CurrencyConversionListEntity(code: $code, conversions: $conversions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyConversionListEntityImpl &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality()
                .equals(other._conversions, _conversions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, const DeepCollectionEquality().hash(_conversions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyConversionListEntityImplCopyWith<
          _$CurrencyConversionListEntityImpl>
      get copyWith => __$$CurrencyConversionListEntityImplCopyWithImpl<
          _$CurrencyConversionListEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyConversionListEntityImplToJson(
      this,
    );
  }
}

abstract class _CurrencyConversionListEntity
    implements CurrencyConversionListEntity {
  const factory _CurrencyConversionListEntity(
          {required final String code,
          required final List<CurrencyConversionEntity> conversions}) =
      _$CurrencyConversionListEntityImpl;

  factory _CurrencyConversionListEntity.fromJson(Map<String, dynamic> json) =
      _$CurrencyConversionListEntityImpl.fromJson;

  @override
  String get code;
  @override
  List<CurrencyConversionEntity> get conversions;
  @override
  @JsonKey(ignore: true)
  _$$CurrencyConversionListEntityImplCopyWith<
          _$CurrencyConversionListEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
