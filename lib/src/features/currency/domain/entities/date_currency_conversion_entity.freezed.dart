// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_currency_conversion_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DateCurrencyConversionEntity _$DateCurrencyConversionEntityFromJson(
    Map<String, dynamic> json) {
  return _DateCurrencyConversionEntity.fromJson(json);
}

/// @nodoc
mixin _$DateCurrencyConversionEntity {
  List<CurrencyConversionListEntity> get conversions =>
      throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DateCurrencyConversionEntityCopyWith<DateCurrencyConversionEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateCurrencyConversionEntityCopyWith<$Res> {
  factory $DateCurrencyConversionEntityCopyWith(
          DateCurrencyConversionEntity value,
          $Res Function(DateCurrencyConversionEntity) then) =
      _$DateCurrencyConversionEntityCopyWithImpl<$Res,
          DateCurrencyConversionEntity>;
  @useResult
  $Res call({List<CurrencyConversionListEntity> conversions, DateTime date});
}

/// @nodoc
class _$DateCurrencyConversionEntityCopyWithImpl<$Res,
        $Val extends DateCurrencyConversionEntity>
    implements $DateCurrencyConversionEntityCopyWith<$Res> {
  _$DateCurrencyConversionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversions = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      conversions: null == conversions
          ? _value.conversions
          : conversions // ignore: cast_nullable_to_non_nullable
              as List<CurrencyConversionListEntity>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateCurrencyConversionEntityImplCopyWith<$Res>
    implements $DateCurrencyConversionEntityCopyWith<$Res> {
  factory _$$DateCurrencyConversionEntityImplCopyWith(
          _$DateCurrencyConversionEntityImpl value,
          $Res Function(_$DateCurrencyConversionEntityImpl) then) =
      __$$DateCurrencyConversionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CurrencyConversionListEntity> conversions, DateTime date});
}

/// @nodoc
class __$$DateCurrencyConversionEntityImplCopyWithImpl<$Res>
    extends _$DateCurrencyConversionEntityCopyWithImpl<$Res,
        _$DateCurrencyConversionEntityImpl>
    implements _$$DateCurrencyConversionEntityImplCopyWith<$Res> {
  __$$DateCurrencyConversionEntityImplCopyWithImpl(
      _$DateCurrencyConversionEntityImpl _value,
      $Res Function(_$DateCurrencyConversionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversions = null,
    Object? date = null,
  }) {
    return _then(_$DateCurrencyConversionEntityImpl(
      conversions: null == conversions
          ? _value._conversions
          : conversions // ignore: cast_nullable_to_non_nullable
              as List<CurrencyConversionListEntity>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DateCurrencyConversionEntityImpl
    implements _DateCurrencyConversionEntity {
  const _$DateCurrencyConversionEntityImpl(
      {required final List<CurrencyConversionListEntity> conversions,
      required this.date})
      : _conversions = conversions;

  factory _$DateCurrencyConversionEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DateCurrencyConversionEntityImplFromJson(json);

  final List<CurrencyConversionListEntity> _conversions;
  @override
  List<CurrencyConversionListEntity> get conversions {
    if (_conversions is EqualUnmodifiableListView) return _conversions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversions);
  }

  @override
  final DateTime date;

  @override
  String toString() {
    return 'DateCurrencyConversionEntity(conversions: $conversions, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateCurrencyConversionEntityImpl &&
            const DeepCollectionEquality()
                .equals(other._conversions, _conversions) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_conversions), date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DateCurrencyConversionEntityImplCopyWith<
          _$DateCurrencyConversionEntityImpl>
      get copyWith => __$$DateCurrencyConversionEntityImplCopyWithImpl<
          _$DateCurrencyConversionEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DateCurrencyConversionEntityImplToJson(
      this,
    );
  }
}

abstract class _DateCurrencyConversionEntity
    implements DateCurrencyConversionEntity {
  const factory _DateCurrencyConversionEntity(
      {required final List<CurrencyConversionListEntity> conversions,
      required final DateTime date}) = _$DateCurrencyConversionEntityImpl;

  factory _DateCurrencyConversionEntity.fromJson(Map<String, dynamic> json) =
      _$DateCurrencyConversionEntityImpl.fromJson;

  @override
  List<CurrencyConversionListEntity> get conversions;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$DateCurrencyConversionEntityImplCopyWith<
          _$DateCurrencyConversionEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
