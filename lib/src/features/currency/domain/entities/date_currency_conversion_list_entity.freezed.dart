// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_currency_conversion_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DateCurrencyConversionListEntity _$DateCurrencyConversionListEntityFromJson(
    Map<String, dynamic> json) {
  return _DateCurrencyConversionListEntity.fromJson(json);
}

/// @nodoc
mixin _$DateCurrencyConversionListEntity {
  List<DateCurrencyConversionEntity> get dateConversions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DateCurrencyConversionListEntityCopyWith<DateCurrencyConversionListEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateCurrencyConversionListEntityCopyWith<$Res> {
  factory $DateCurrencyConversionListEntityCopyWith(
          DateCurrencyConversionListEntity value,
          $Res Function(DateCurrencyConversionListEntity) then) =
      _$DateCurrencyConversionListEntityCopyWithImpl<$Res,
          DateCurrencyConversionListEntity>;
  @useResult
  $Res call({List<DateCurrencyConversionEntity> dateConversions});
}

/// @nodoc
class _$DateCurrencyConversionListEntityCopyWithImpl<$Res,
        $Val extends DateCurrencyConversionListEntity>
    implements $DateCurrencyConversionListEntityCopyWith<$Res> {
  _$DateCurrencyConversionListEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateConversions = null,
  }) {
    return _then(_value.copyWith(
      dateConversions: null == dateConversions
          ? _value.dateConversions
          : dateConversions // ignore: cast_nullable_to_non_nullable
              as List<DateCurrencyConversionEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateCurrencyConversionListEntityImplCopyWith<$Res>
    implements $DateCurrencyConversionListEntityCopyWith<$Res> {
  factory _$$DateCurrencyConversionListEntityImplCopyWith(
          _$DateCurrencyConversionListEntityImpl value,
          $Res Function(_$DateCurrencyConversionListEntityImpl) then) =
      __$$DateCurrencyConversionListEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DateCurrencyConversionEntity> dateConversions});
}

/// @nodoc
class __$$DateCurrencyConversionListEntityImplCopyWithImpl<$Res>
    extends _$DateCurrencyConversionListEntityCopyWithImpl<$Res,
        _$DateCurrencyConversionListEntityImpl>
    implements _$$DateCurrencyConversionListEntityImplCopyWith<$Res> {
  __$$DateCurrencyConversionListEntityImplCopyWithImpl(
      _$DateCurrencyConversionListEntityImpl _value,
      $Res Function(_$DateCurrencyConversionListEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateConversions = null,
  }) {
    return _then(_$DateCurrencyConversionListEntityImpl(
      dateConversions: null == dateConversions
          ? _value._dateConversions
          : dateConversions // ignore: cast_nullable_to_non_nullable
              as List<DateCurrencyConversionEntity>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DateCurrencyConversionListEntityImpl
    implements _DateCurrencyConversionListEntity {
  const _$DateCurrencyConversionListEntityImpl(
      {required final List<DateCurrencyConversionEntity> dateConversions})
      : _dateConversions = dateConversions;

  factory _$DateCurrencyConversionListEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DateCurrencyConversionListEntityImplFromJson(json);

  final List<DateCurrencyConversionEntity> _dateConversions;
  @override
  List<DateCurrencyConversionEntity> get dateConversions {
    if (_dateConversions is EqualUnmodifiableListView) return _dateConversions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dateConversions);
  }

  @override
  String toString() {
    return 'DateCurrencyConversionListEntity(dateConversions: $dateConversions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateCurrencyConversionListEntityImpl &&
            const DeepCollectionEquality()
                .equals(other._dateConversions, _dateConversions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_dateConversions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DateCurrencyConversionListEntityImplCopyWith<
          _$DateCurrencyConversionListEntityImpl>
      get copyWith => __$$DateCurrencyConversionListEntityImplCopyWithImpl<
          _$DateCurrencyConversionListEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DateCurrencyConversionListEntityImplToJson(
      this,
    );
  }
}

abstract class _DateCurrencyConversionListEntity
    implements DateCurrencyConversionListEntity {
  const factory _DateCurrencyConversionListEntity(
          {required final List<DateCurrencyConversionEntity> dateConversions}) =
      _$DateCurrencyConversionListEntityImpl;

  factory _DateCurrencyConversionListEntity.fromJson(
          Map<String, dynamic> json) =
      _$DateCurrencyConversionListEntityImpl.fromJson;

  @override
  List<DateCurrencyConversionEntity> get dateConversions;
  @override
  @JsonKey(ignore: true)
  _$$DateCurrencyConversionListEntityImplCopyWith<
          _$DateCurrencyConversionListEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
