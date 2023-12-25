// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_type_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BalanceTypeEntity _$BalanceTypeEntityFromJson(Map<String, dynamic> json) {
  return _BalanceTypeEntity.fromJson(json);
}

/// @nodoc
mixin _$BalanceTypeEntity {
  BalanceTypeEnum get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BalanceTypeEntityCopyWith<BalanceTypeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceTypeEntityCopyWith<$Res> {
  factory $BalanceTypeEntityCopyWith(
          BalanceTypeEntity value, $Res Function(BalanceTypeEntity) then) =
      _$BalanceTypeEntityCopyWithImpl<$Res, BalanceTypeEntity>;
  @useResult
  $Res call({BalanceTypeEnum type, String name, String image});
}

/// @nodoc
class _$BalanceTypeEntityCopyWithImpl<$Res, $Val extends BalanceTypeEntity>
    implements $BalanceTypeEntityCopyWith<$Res> {
  _$BalanceTypeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BalanceTypeEnum,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BalanceTypeEntityImplCopyWith<$Res>
    implements $BalanceTypeEntityCopyWith<$Res> {
  factory _$$BalanceTypeEntityImplCopyWith(_$BalanceTypeEntityImpl value,
          $Res Function(_$BalanceTypeEntityImpl) then) =
      __$$BalanceTypeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BalanceTypeEnum type, String name, String image});
}

/// @nodoc
class __$$BalanceTypeEntityImplCopyWithImpl<$Res>
    extends _$BalanceTypeEntityCopyWithImpl<$Res, _$BalanceTypeEntityImpl>
    implements _$$BalanceTypeEntityImplCopyWith<$Res> {
  __$$BalanceTypeEntityImplCopyWithImpl(_$BalanceTypeEntityImpl _value,
      $Res Function(_$BalanceTypeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_$BalanceTypeEntityImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BalanceTypeEnum,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BalanceTypeEntityImpl implements _BalanceTypeEntity {
  const _$BalanceTypeEntityImpl(
      {required this.type, required this.name, required this.image});

  factory _$BalanceTypeEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$BalanceTypeEntityImplFromJson(json);

  @override
  final BalanceTypeEnum type;
  @override
  final String name;
  @override
  final String image;

  @override
  String toString() {
    return 'BalanceTypeEntity(type: $type, name: $name, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceTypeEntityImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, name, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceTypeEntityImplCopyWith<_$BalanceTypeEntityImpl> get copyWith =>
      __$$BalanceTypeEntityImplCopyWithImpl<_$BalanceTypeEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BalanceTypeEntityImplToJson(
      this,
    );
  }
}

abstract class _BalanceTypeEntity implements BalanceTypeEntity {
  const factory _BalanceTypeEntity(
      {required final BalanceTypeEnum type,
      required final String name,
      required final String image}) = _$BalanceTypeEntityImpl;

  factory _BalanceTypeEntity.fromJson(Map<String, dynamic> json) =
      _$BalanceTypeEntityImpl.fromJson;

  @override
  BalanceTypeEnum get type;
  @override
  String get name;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$BalanceTypeEntityImplCopyWith<_$BalanceTypeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
