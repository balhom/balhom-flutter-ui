// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BalanceEntity _$BalanceEntityFromJson(Map<String, dynamic> json) {
  return _BalanceEntity.fromJson(json);
}

/// @nodoc
mixin _$BalanceEntity {
// ignore: invalid_annotation_target
  @JsonKey(includeIfNull: false)
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get realQuantity =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(includeIfNull: false)
  double? get convertedQuantity => throw _privateConstructorUsedError;
  @DateTimeUtcConverter()
  DateTime get date => throw _privateConstructorUsedError;
  String get currencyType => throw _privateConstructorUsedError;
  BalanceTypeEntity get balanceType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BalanceEntityCopyWith<BalanceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceEntityCopyWith<$Res> {
  factory $BalanceEntityCopyWith(
          BalanceEntity value, $Res Function(BalanceEntity) then) =
      _$BalanceEntityCopyWithImpl<$Res, BalanceEntity>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? id,
      String name,
      String description,
      double realQuantity,
      @JsonKey(includeIfNull: false) double? convertedQuantity,
      @DateTimeUtcConverter() DateTime date,
      String currencyType,
      BalanceTypeEntity balanceType});

  $BalanceTypeEntityCopyWith<$Res> get balanceType;
}

/// @nodoc
class _$BalanceEntityCopyWithImpl<$Res, $Val extends BalanceEntity>
    implements $BalanceEntityCopyWith<$Res> {
  _$BalanceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? realQuantity = null,
    Object? convertedQuantity = freezed,
    Object? date = null,
    Object? currencyType = null,
    Object? balanceType = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      realQuantity: null == realQuantity
          ? _value.realQuantity
          : realQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      convertedQuantity: freezed == convertedQuantity
          ? _value.convertedQuantity
          : convertedQuantity // ignore: cast_nullable_to_non_nullable
              as double?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
abstract class _$$BalanceEntityImplCopyWith<$Res>
    implements $BalanceEntityCopyWith<$Res> {
  factory _$$BalanceEntityImplCopyWith(
          _$BalanceEntityImpl value, $Res Function(_$BalanceEntityImpl) then) =
      __$$BalanceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? id,
      String name,
      String description,
      double realQuantity,
      @JsonKey(includeIfNull: false) double? convertedQuantity,
      @DateTimeUtcConverter() DateTime date,
      String currencyType,
      BalanceTypeEntity balanceType});

  @override
  $BalanceTypeEntityCopyWith<$Res> get balanceType;
}

/// @nodoc
class __$$BalanceEntityImplCopyWithImpl<$Res>
    extends _$BalanceEntityCopyWithImpl<$Res, _$BalanceEntityImpl>
    implements _$$BalanceEntityImplCopyWith<$Res> {
  __$$BalanceEntityImplCopyWithImpl(
      _$BalanceEntityImpl _value, $Res Function(_$BalanceEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? realQuantity = null,
    Object? convertedQuantity = freezed,
    Object? date = null,
    Object? currencyType = null,
    Object? balanceType = null,
  }) {
    return _then(_$BalanceEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      realQuantity: null == realQuantity
          ? _value.realQuantity
          : realQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      convertedQuantity: freezed == convertedQuantity
          ? _value.convertedQuantity
          : convertedQuantity // ignore: cast_nullable_to_non_nullable
              as double?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
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

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BalanceEntityImpl extends _BalanceEntity {
  const _$BalanceEntityImpl(
      {@JsonKey(includeIfNull: false) required this.id,
      required this.name,
      required this.description,
      required this.realQuantity,
      @JsonKey(includeIfNull: false) required this.convertedQuantity,
      @DateTimeUtcConverter() required this.date,
      required this.currencyType,
      required this.balanceType})
      : super._();

  factory _$BalanceEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$BalanceEntityImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(includeIfNull: false)
  final int? id;
  @override
  final String name;
  @override
  final String description;
  @override
  final double realQuantity;
// ignore: invalid_annotation_target
  @override
  @JsonKey(includeIfNull: false)
  final double? convertedQuantity;
  @override
  @DateTimeUtcConverter()
  final DateTime date;
  @override
  final String currencyType;
  @override
  final BalanceTypeEntity balanceType;

  @override
  String toString() {
    return 'BalanceEntity(id: $id, name: $name, description: $description, realQuantity: $realQuantity, convertedQuantity: $convertedQuantity, date: $date, currencyType: $currencyType, balanceType: $balanceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.realQuantity, realQuantity) ||
                other.realQuantity == realQuantity) &&
            (identical(other.convertedQuantity, convertedQuantity) ||
                other.convertedQuantity == convertedQuantity) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.currencyType, currencyType) ||
                other.currencyType == currencyType) &&
            (identical(other.balanceType, balanceType) ||
                other.balanceType == balanceType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      realQuantity, convertedQuantity, date, currencyType, balanceType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceEntityImplCopyWith<_$BalanceEntityImpl> get copyWith =>
      __$$BalanceEntityImplCopyWithImpl<_$BalanceEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BalanceEntityImplToJson(
      this,
    );
  }
}

abstract class _BalanceEntity extends BalanceEntity {
  const factory _BalanceEntity(
      {@JsonKey(includeIfNull: false) required final int? id,
      required final String name,
      required final String description,
      required final double realQuantity,
      @JsonKey(includeIfNull: false) required final double? convertedQuantity,
      @DateTimeUtcConverter() required final DateTime date,
      required final String currencyType,
      required final BalanceTypeEntity balanceType}) = _$BalanceEntityImpl;
  const _BalanceEntity._() : super._();

  factory _BalanceEntity.fromJson(Map<String, dynamic> json) =
      _$BalanceEntityImpl.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(includeIfNull: false)
  int? get id;
  @override
  String get name;
  @override
  String get description;
  @override
  double get realQuantity;
  @override // ignore: invalid_annotation_target
  @JsonKey(includeIfNull: false)
  double? get convertedQuantity;
  @override
  @DateTimeUtcConverter()
  DateTime get date;
  @override
  String get currencyType;
  @override
  BalanceTypeEntity get balanceType;
  @override
  @JsonKey(ignore: true)
  _$$BalanceEntityImplCopyWith<_$BalanceEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
