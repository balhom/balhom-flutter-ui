// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_saving_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MonthlySavingEntity _$MonthlySavingEntityFromJson(Map<String, dynamic> json) {
  return _MonthlySavingEntity.fromJson(json);
}

/// @nodoc
mixin _$MonthlySavingEntity {
  double get grossQuantity => throw _privateConstructorUsedError;
  double get expectedQuantity => throw _privateConstructorUsedError;
  String get currencyType => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonthlySavingEntityCopyWith<MonthlySavingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlySavingEntityCopyWith<$Res> {
  factory $MonthlySavingEntityCopyWith(
          MonthlySavingEntity value, $Res Function(MonthlySavingEntity) then) =
      _$MonthlySavingEntityCopyWithImpl<$Res, MonthlySavingEntity>;
  @useResult
  $Res call(
      {double grossQuantity,
      double expectedQuantity,
      String currencyType,
      int year,
      int month,
      DateTime created});
}

/// @nodoc
class _$MonthlySavingEntityCopyWithImpl<$Res, $Val extends MonthlySavingEntity>
    implements $MonthlySavingEntityCopyWith<$Res> {
  _$MonthlySavingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grossQuantity = null,
    Object? expectedQuantity = null,
    Object? currencyType = null,
    Object? year = null,
    Object? month = null,
    Object? created = null,
  }) {
    return _then(_value.copyWith(
      grossQuantity: null == grossQuantity
          ? _value.grossQuantity
          : grossQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      expectedQuantity: null == expectedQuantity
          ? _value.expectedQuantity
          : expectedQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      currencyType: null == currencyType
          ? _value.currencyType
          : currencyType // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlySavingEntityImplCopyWith<$Res>
    implements $MonthlySavingEntityCopyWith<$Res> {
  factory _$$MonthlySavingEntityImplCopyWith(_$MonthlySavingEntityImpl value,
          $Res Function(_$MonthlySavingEntityImpl) then) =
      __$$MonthlySavingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double grossQuantity,
      double expectedQuantity,
      String currencyType,
      int year,
      int month,
      DateTime created});
}

/// @nodoc
class __$$MonthlySavingEntityImplCopyWithImpl<$Res>
    extends _$MonthlySavingEntityCopyWithImpl<$Res, _$MonthlySavingEntityImpl>
    implements _$$MonthlySavingEntityImplCopyWith<$Res> {
  __$$MonthlySavingEntityImplCopyWithImpl(_$MonthlySavingEntityImpl _value,
      $Res Function(_$MonthlySavingEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grossQuantity = null,
    Object? expectedQuantity = null,
    Object? currencyType = null,
    Object? year = null,
    Object? month = null,
    Object? created = null,
  }) {
    return _then(_$MonthlySavingEntityImpl(
      grossQuantity: null == grossQuantity
          ? _value.grossQuantity
          : grossQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      expectedQuantity: null == expectedQuantity
          ? _value.expectedQuantity
          : expectedQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      currencyType: null == currencyType
          ? _value.currencyType
          : currencyType // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$MonthlySavingEntityImpl implements _MonthlySavingEntity {
  const _$MonthlySavingEntityImpl(
      {required this.grossQuantity,
      required this.expectedQuantity,
      required this.currencyType,
      required this.year,
      required this.month,
      required this.created});

  factory _$MonthlySavingEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlySavingEntityImplFromJson(json);

  @override
  final double grossQuantity;
  @override
  final double expectedQuantity;
  @override
  final String currencyType;
  @override
  final int year;
  @override
  final int month;
  @override
  final DateTime created;

  @override
  String toString() {
    return 'MonthlySavingEntity(grossQuantity: $grossQuantity, expectedQuantity: $expectedQuantity, currencyType: $currencyType, year: $year, month: $month, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlySavingEntityImpl &&
            (identical(other.grossQuantity, grossQuantity) ||
                other.grossQuantity == grossQuantity) &&
            (identical(other.expectedQuantity, expectedQuantity) ||
                other.expectedQuantity == expectedQuantity) &&
            (identical(other.currencyType, currencyType) ||
                other.currencyType == currencyType) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, grossQuantity, expectedQuantity,
      currencyType, year, month, created);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlySavingEntityImplCopyWith<_$MonthlySavingEntityImpl> get copyWith =>
      __$$MonthlySavingEntityImplCopyWithImpl<_$MonthlySavingEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlySavingEntityImplToJson(
      this,
    );
  }
}

abstract class _MonthlySavingEntity implements MonthlySavingEntity {
  const factory _MonthlySavingEntity(
      {required final double grossQuantity,
      required final double expectedQuantity,
      required final String currencyType,
      required final int year,
      required final int month,
      required final DateTime created}) = _$MonthlySavingEntityImpl;

  factory _MonthlySavingEntity.fromJson(Map<String, dynamic> json) =
      _$MonthlySavingEntityImpl.fromJson;

  @override
  double get grossQuantity;
  @override
  double get expectedQuantity;
  @override
  String get currencyType;
  @override
  int get year;
  @override
  int get month;
  @override
  DateTime get created;
  @override
  @JsonKey(ignore: true)
  _$$MonthlySavingEntityImplCopyWith<_$MonthlySavingEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
