// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_balance_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MonthlyBalanceEntity _$MonthlyBalanceEntityFromJson(Map<String, dynamic> json) {
  return _MonthlyBalanceEntity.fromJson(json);
}

/// @nodoc
mixin _$MonthlyBalanceEntity {
  double get grossQuantity => throw _privateConstructorUsedError;
  double get expectedQuantity => throw _privateConstructorUsedError;
  String get currencyType => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonthlyBalanceEntityCopyWith<MonthlyBalanceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyBalanceEntityCopyWith<$Res> {
  factory $MonthlyBalanceEntityCopyWith(MonthlyBalanceEntity value,
          $Res Function(MonthlyBalanceEntity) then) =
      _$MonthlyBalanceEntityCopyWithImpl<$Res, MonthlyBalanceEntity>;
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
class _$MonthlyBalanceEntityCopyWithImpl<$Res,
        $Val extends MonthlyBalanceEntity>
    implements $MonthlyBalanceEntityCopyWith<$Res> {
  _$MonthlyBalanceEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$MonthlyBalanceEntityImplCopyWith<$Res>
    implements $MonthlyBalanceEntityCopyWith<$Res> {
  factory _$$MonthlyBalanceEntityImplCopyWith(_$MonthlyBalanceEntityImpl value,
          $Res Function(_$MonthlyBalanceEntityImpl) then) =
      __$$MonthlyBalanceEntityImplCopyWithImpl<$Res>;
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
class __$$MonthlyBalanceEntityImplCopyWithImpl<$Res>
    extends _$MonthlyBalanceEntityCopyWithImpl<$Res, _$MonthlyBalanceEntityImpl>
    implements _$$MonthlyBalanceEntityImplCopyWith<$Res> {
  __$$MonthlyBalanceEntityImplCopyWithImpl(_$MonthlyBalanceEntityImpl _value,
      $Res Function(_$MonthlyBalanceEntityImpl) _then)
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
    return _then(_$MonthlyBalanceEntityImpl(
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
class _$MonthlyBalanceEntityImpl implements _MonthlyBalanceEntity {
  const _$MonthlyBalanceEntityImpl(
      {required this.grossQuantity,
      required this.expectedQuantity,
      required this.currencyType,
      required this.year,
      required this.month,
      required this.created});

  factory _$MonthlyBalanceEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyBalanceEntityImplFromJson(json);

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
    return 'MonthlyBalanceEntity(grossQuantity: $grossQuantity, expectedQuantity: $expectedQuantity, currencyType: $currencyType, year: $year, month: $month, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyBalanceEntityImpl &&
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
  _$$MonthlyBalanceEntityImplCopyWith<_$MonthlyBalanceEntityImpl>
      get copyWith =>
          __$$MonthlyBalanceEntityImplCopyWithImpl<_$MonthlyBalanceEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyBalanceEntityImplToJson(
      this,
    );
  }
}

abstract class _MonthlyBalanceEntity implements MonthlyBalanceEntity {
  const factory _MonthlyBalanceEntity(
      {required final double grossQuantity,
      required final double expectedQuantity,
      required final String currencyType,
      required final int year,
      required final int month,
      required final DateTime created}) = _$MonthlyBalanceEntityImpl;

  factory _MonthlyBalanceEntity.fromJson(Map<String, dynamic> json) =
      _$MonthlyBalanceEntityImpl.fromJson;

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
  _$$MonthlyBalanceEntityImplCopyWith<_$MonthlyBalanceEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
