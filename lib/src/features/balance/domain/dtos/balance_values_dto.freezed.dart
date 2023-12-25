// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_values_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BalanceValuesDto {
  int? get id => throw _privateConstructorUsedError;
  BalanceNameValue get nameValue => throw _privateConstructorUsedError;
  BalanceDescriptionValue get descriptionValue =>
      throw _privateConstructorUsedError;
  BalanceQuantityValue get quantityValue => throw _privateConstructorUsedError;
  BalanceDateTimeValue get dateValue => throw _privateConstructorUsedError;
  String get currencyType => throw _privateConstructorUsedError;
  BalanceTypeEntity get balanceType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BalanceValuesDtoCopyWith<BalanceValuesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceValuesDtoCopyWith<$Res> {
  factory $BalanceValuesDtoCopyWith(
          BalanceValuesDto value, $Res Function(BalanceValuesDto) then) =
      _$BalanceValuesDtoCopyWithImpl<$Res, BalanceValuesDto>;
  @useResult
  $Res call(
      {int? id,
      BalanceNameValue nameValue,
      BalanceDescriptionValue descriptionValue,
      BalanceQuantityValue quantityValue,
      BalanceDateTimeValue dateValue,
      String currencyType,
      BalanceTypeEntity balanceType});

  $BalanceTypeEntityCopyWith<$Res> get balanceType;
}

/// @nodoc
class _$BalanceValuesDtoCopyWithImpl<$Res, $Val extends BalanceValuesDto>
    implements $BalanceValuesDtoCopyWith<$Res> {
  _$BalanceValuesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameValue = null,
    Object? descriptionValue = null,
    Object? quantityValue = null,
    Object? dateValue = null,
    Object? currencyType = null,
    Object? balanceType = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nameValue: null == nameValue
          ? _value.nameValue
          : nameValue // ignore: cast_nullable_to_non_nullable
              as BalanceNameValue,
      descriptionValue: null == descriptionValue
          ? _value.descriptionValue
          : descriptionValue // ignore: cast_nullable_to_non_nullable
              as BalanceDescriptionValue,
      quantityValue: null == quantityValue
          ? _value.quantityValue
          : quantityValue // ignore: cast_nullable_to_non_nullable
              as BalanceQuantityValue,
      dateValue: null == dateValue
          ? _value.dateValue
          : dateValue // ignore: cast_nullable_to_non_nullable
              as BalanceDateTimeValue,
      currencyType: null == currencyType
          ? _value.currencyType
          : currencyType // ignore: cast_nullable_to_non_nullable
              as String,
      balanceType: null == balanceType
          ? _value.balanceType
          : balanceType // ignore: cast_nullable_to_non_nullable
              as BalanceTypeEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BalanceTypeEntityCopyWith<$Res> get balanceType {
    return $BalanceTypeEntityCopyWith<$Res>(_value.balanceType, (value) {
      return _then(_value.copyWith(balanceType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BalanceValuesDtoImplCopyWith<$Res>
    implements $BalanceValuesDtoCopyWith<$Res> {
  factory _$$BalanceValuesDtoImplCopyWith(_$BalanceValuesDtoImpl value,
          $Res Function(_$BalanceValuesDtoImpl) then) =
      __$$BalanceValuesDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      BalanceNameValue nameValue,
      BalanceDescriptionValue descriptionValue,
      BalanceQuantityValue quantityValue,
      BalanceDateTimeValue dateValue,
      String currencyType,
      BalanceTypeEntity balanceType});

  @override
  $BalanceTypeEntityCopyWith<$Res> get balanceType;
}

/// @nodoc
class __$$BalanceValuesDtoImplCopyWithImpl<$Res>
    extends _$BalanceValuesDtoCopyWithImpl<$Res, _$BalanceValuesDtoImpl>
    implements _$$BalanceValuesDtoImplCopyWith<$Res> {
  __$$BalanceValuesDtoImplCopyWithImpl(_$BalanceValuesDtoImpl _value,
      $Res Function(_$BalanceValuesDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nameValue = null,
    Object? descriptionValue = null,
    Object? quantityValue = null,
    Object? dateValue = null,
    Object? currencyType = null,
    Object? balanceType = null,
  }) {
    return _then(_$BalanceValuesDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nameValue: null == nameValue
          ? _value.nameValue
          : nameValue // ignore: cast_nullable_to_non_nullable
              as BalanceNameValue,
      descriptionValue: null == descriptionValue
          ? _value.descriptionValue
          : descriptionValue // ignore: cast_nullable_to_non_nullable
              as BalanceDescriptionValue,
      quantityValue: null == quantityValue
          ? _value.quantityValue
          : quantityValue // ignore: cast_nullable_to_non_nullable
              as BalanceQuantityValue,
      dateValue: null == dateValue
          ? _value.dateValue
          : dateValue // ignore: cast_nullable_to_non_nullable
              as BalanceDateTimeValue,
      currencyType: null == currencyType
          ? _value.currencyType
          : currencyType // ignore: cast_nullable_to_non_nullable
              as String,
      balanceType: null == balanceType
          ? _value.balanceType
          : balanceType // ignore: cast_nullable_to_non_nullable
              as BalanceTypeEntity,
    ));
  }
}

/// @nodoc

class _$BalanceValuesDtoImpl extends _BalanceValuesDto {
  const _$BalanceValuesDtoImpl(
      {required this.id,
      required this.nameValue,
      required this.descriptionValue,
      required this.quantityValue,
      required this.dateValue,
      required this.currencyType,
      required this.balanceType})
      : super._();

  @override
  final int? id;
  @override
  final BalanceNameValue nameValue;
  @override
  final BalanceDescriptionValue descriptionValue;
  @override
  final BalanceQuantityValue quantityValue;
  @override
  final BalanceDateTimeValue dateValue;
  @override
  final String currencyType;
  @override
  final BalanceTypeEntity balanceType;

  @override
  String toString() {
    return 'BalanceValuesDto(id: $id, nameValue: $nameValue, descriptionValue: $descriptionValue, quantityValue: $quantityValue, dateValue: $dateValue, currencyType: $currencyType, balanceType: $balanceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceValuesDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameValue, nameValue) ||
                other.nameValue == nameValue) &&
            (identical(other.descriptionValue, descriptionValue) ||
                other.descriptionValue == descriptionValue) &&
            (identical(other.quantityValue, quantityValue) ||
                other.quantityValue == quantityValue) &&
            (identical(other.dateValue, dateValue) ||
                other.dateValue == dateValue) &&
            (identical(other.currencyType, currencyType) ||
                other.currencyType == currencyType) &&
            (identical(other.balanceType, balanceType) ||
                other.balanceType == balanceType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, nameValue, descriptionValue,
      quantityValue, dateValue, currencyType, balanceType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceValuesDtoImplCopyWith<_$BalanceValuesDtoImpl> get copyWith =>
      __$$BalanceValuesDtoImplCopyWithImpl<_$BalanceValuesDtoImpl>(
          this, _$identity);
}

abstract class _BalanceValuesDto extends BalanceValuesDto {
  const factory _BalanceValuesDto(
      {required final int? id,
      required final BalanceNameValue nameValue,
      required final BalanceDescriptionValue descriptionValue,
      required final BalanceQuantityValue quantityValue,
      required final BalanceDateTimeValue dateValue,
      required final String currencyType,
      required final BalanceTypeEntity balanceType}) = _$BalanceValuesDtoImpl;
  const _BalanceValuesDto._() : super._();

  @override
  int? get id;
  @override
  BalanceNameValue get nameValue;
  @override
  BalanceDescriptionValue get descriptionValue;
  @override
  BalanceQuantityValue get quantityValue;
  @override
  BalanceDateTimeValue get dateValue;
  @override
  String get currencyType;
  @override
  BalanceTypeEntity get balanceType;
  @override
  @JsonKey(ignore: true)
  _$$BalanceValuesDtoImplCopyWith<_$BalanceValuesDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
