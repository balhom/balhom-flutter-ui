// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annual_saving_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnnualSavingEntity _$AnnualSavingEntityFromJson(Map<String, dynamic> json) {
  return _AnnualSavingEntity.fromJson(json);
}

/// @nodoc
mixin _$AnnualSavingEntity {
  double get grossQuantity => throw _privateConstructorUsedError;
  double get expectedQuantity => throw _privateConstructorUsedError;
  String get currencyType => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnualSavingEntityCopyWith<AnnualSavingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnualSavingEntityCopyWith<$Res> {
  factory $AnnualSavingEntityCopyWith(
          AnnualSavingEntity value, $Res Function(AnnualSavingEntity) then) =
      _$AnnualSavingEntityCopyWithImpl<$Res, AnnualSavingEntity>;
  @useResult
  $Res call(
      {double grossQuantity,
      double expectedQuantity,
      String currencyType,
      int year,
      DateTime created});
}

/// @nodoc
class _$AnnualSavingEntityCopyWithImpl<$Res, $Val extends AnnualSavingEntity>
    implements $AnnualSavingEntityCopyWith<$Res> {
  _$AnnualSavingEntityCopyWithImpl(this._value, this._then);

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
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnnualSavingEntityImplCopyWith<$Res>
    implements $AnnualSavingEntityCopyWith<$Res> {
  factory _$$AnnualSavingEntityImplCopyWith(_$AnnualSavingEntityImpl value,
          $Res Function(_$AnnualSavingEntityImpl) then) =
      __$$AnnualSavingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double grossQuantity,
      double expectedQuantity,
      String currencyType,
      int year,
      DateTime created});
}

/// @nodoc
class __$$AnnualSavingEntityImplCopyWithImpl<$Res>
    extends _$AnnualSavingEntityCopyWithImpl<$Res, _$AnnualSavingEntityImpl>
    implements _$$AnnualSavingEntityImplCopyWith<$Res> {
  __$$AnnualSavingEntityImplCopyWithImpl(_$AnnualSavingEntityImpl _value,
      $Res Function(_$AnnualSavingEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grossQuantity = null,
    Object? expectedQuantity = null,
    Object? currencyType = null,
    Object? year = null,
    Object? created = null,
  }) {
    return _then(_$AnnualSavingEntityImpl(
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
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AnnualSavingEntityImpl implements _AnnualSavingEntity {
  const _$AnnualSavingEntityImpl(
      {required this.grossQuantity,
      required this.expectedQuantity,
      required this.currencyType,
      required this.year,
      required this.created});

  factory _$AnnualSavingEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnnualSavingEntityImplFromJson(json);

  @override
  final double grossQuantity;
  @override
  final double expectedQuantity;
  @override
  final String currencyType;
  @override
  final int year;
  @override
  final DateTime created;

  @override
  String toString() {
    return 'AnnualSavingEntity(grossQuantity: $grossQuantity, expectedQuantity: $expectedQuantity, currencyType: $currencyType, year: $year, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnualSavingEntityImpl &&
            (identical(other.grossQuantity, grossQuantity) ||
                other.grossQuantity == grossQuantity) &&
            (identical(other.expectedQuantity, expectedQuantity) ||
                other.expectedQuantity == expectedQuantity) &&
            (identical(other.currencyType, currencyType) ||
                other.currencyType == currencyType) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, grossQuantity, expectedQuantity,
      currencyType, year, created);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnualSavingEntityImplCopyWith<_$AnnualSavingEntityImpl> get copyWith =>
      __$$AnnualSavingEntityImplCopyWithImpl<_$AnnualSavingEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnnualSavingEntityImplToJson(
      this,
    );
  }
}

abstract class _AnnualSavingEntity implements AnnualSavingEntity {
  const factory _AnnualSavingEntity(
      {required final double grossQuantity,
      required final double expectedQuantity,
      required final String currencyType,
      required final int year,
      required final DateTime created}) = _$AnnualSavingEntityImpl;

  factory _AnnualSavingEntity.fromJson(Map<String, dynamic> json) =
      _$AnnualSavingEntityImpl.fromJson;

  @override
  double get grossQuantity;
  @override
  double get expectedQuantity;
  @override
  String get currencyType;
  @override
  int get year;
  @override
  DateTime get created;
  @override
  @JsonKey(ignore: true)
  _$$AnnualSavingEntityImplCopyWith<_$AnnualSavingEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
