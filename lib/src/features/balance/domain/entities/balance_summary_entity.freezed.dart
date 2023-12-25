// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_summary_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BalanceSummaryEntity _$BalanceSummaryEntityFromJson(Map<String, dynamic> json) {
  return _BalanceSummaryEntity.fromJson(json);
}

/// @nodoc
mixin _$BalanceSummaryEntity {
  String get type => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BalanceSummaryEntityCopyWith<BalanceSummaryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceSummaryEntityCopyWith<$Res> {
  factory $BalanceSummaryEntityCopyWith(BalanceSummaryEntity value,
          $Res Function(BalanceSummaryEntity) then) =
      _$BalanceSummaryEntityCopyWithImpl<$Res, BalanceSummaryEntity>;
  @useResult
  $Res call({String type, double quantity});
}

/// @nodoc
class _$BalanceSummaryEntityCopyWithImpl<$Res,
        $Val extends BalanceSummaryEntity>
    implements $BalanceSummaryEntityCopyWith<$Res> {
  _$BalanceSummaryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BalanceSummaryEntityImplCopyWith<$Res>
    implements $BalanceSummaryEntityCopyWith<$Res> {
  factory _$$BalanceSummaryEntityImplCopyWith(_$BalanceSummaryEntityImpl value,
          $Res Function(_$BalanceSummaryEntityImpl) then) =
      __$$BalanceSummaryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, double quantity});
}

/// @nodoc
class __$$BalanceSummaryEntityImplCopyWithImpl<$Res>
    extends _$BalanceSummaryEntityCopyWithImpl<$Res, _$BalanceSummaryEntityImpl>
    implements _$$BalanceSummaryEntityImplCopyWith<$Res> {
  __$$BalanceSummaryEntityImplCopyWithImpl(_$BalanceSummaryEntityImpl _value,
      $Res Function(_$BalanceSummaryEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? quantity = null,
  }) {
    return _then(_$BalanceSummaryEntityImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BalanceSummaryEntityImpl extends _BalanceSummaryEntity {
  const _$BalanceSummaryEntityImpl({required this.type, required this.quantity})
      : super._();

  factory _$BalanceSummaryEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$BalanceSummaryEntityImplFromJson(json);

  @override
  final String type;
  @override
  final double quantity;

  @override
  String toString() {
    return 'BalanceSummaryEntity(type: $type, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceSummaryEntityImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceSummaryEntityImplCopyWith<_$BalanceSummaryEntityImpl>
      get copyWith =>
          __$$BalanceSummaryEntityImplCopyWithImpl<_$BalanceSummaryEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BalanceSummaryEntityImplToJson(
      this,
    );
  }
}

abstract class _BalanceSummaryEntity extends BalanceSummaryEntity {
  const factory _BalanceSummaryEntity(
      {required final String type,
      required final double quantity}) = _$BalanceSummaryEntityImpl;
  const _BalanceSummaryEntity._() : super._();

  factory _BalanceSummaryEntity.fromJson(Map<String, dynamic> json) =
      _$BalanceSummaryEntityImpl.fromJson;

  @override
  String get type;
  @override
  double get quantity;
  @override
  @JsonKey(ignore: true)
  _$$BalanceSummaryEntityImplCopyWith<_$BalanceSummaryEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
