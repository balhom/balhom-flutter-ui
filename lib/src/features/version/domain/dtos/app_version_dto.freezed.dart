// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_version_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppVersionDto {
  int get x => throw _privateConstructorUsedError;
  int get y => throw _privateConstructorUsedError;
  int get z => throw _privateConstructorUsedError;
  bool? get isLower => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppVersionDtoCopyWith<AppVersionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppVersionDtoCopyWith<$Res> {
  factory $AppVersionDtoCopyWith(
          AppVersionDto value, $Res Function(AppVersionDto) then) =
      _$AppVersionDtoCopyWithImpl<$Res, AppVersionDto>;
  @useResult
  $Res call({int x, int y, int z, bool? isLower});
}

/// @nodoc
class _$AppVersionDtoCopyWithImpl<$Res, $Val extends AppVersionDto>
    implements $AppVersionDtoCopyWith<$Res> {
  _$AppVersionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? z = null,
    Object? isLower = freezed,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
      z: null == z
          ? _value.z
          : z // ignore: cast_nullable_to_non_nullable
              as int,
      isLower: freezed == isLower
          ? _value.isLower
          : isLower // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppVersionDtoImplCopyWith<$Res>
    implements $AppVersionDtoCopyWith<$Res> {
  factory _$$AppVersionDtoImplCopyWith(
          _$AppVersionDtoImpl value, $Res Function(_$AppVersionDtoImpl) then) =
      __$$AppVersionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int x, int y, int z, bool? isLower});
}

/// @nodoc
class __$$AppVersionDtoImplCopyWithImpl<$Res>
    extends _$AppVersionDtoCopyWithImpl<$Res, _$AppVersionDtoImpl>
    implements _$$AppVersionDtoImplCopyWith<$Res> {
  __$$AppVersionDtoImplCopyWithImpl(
      _$AppVersionDtoImpl _value, $Res Function(_$AppVersionDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? z = null,
    Object? isLower = freezed,
  }) {
    return _then(_$AppVersionDtoImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
      z: null == z
          ? _value.z
          : z // ignore: cast_nullable_to_non_nullable
              as int,
      isLower: freezed == isLower
          ? _value.isLower
          : isLower // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$AppVersionDtoImpl implements _AppVersionDto {
  const _$AppVersionDtoImpl(
      {required this.x, required this.y, required this.z, this.isLower});

  @override
  final int x;
  @override
  final int y;
  @override
  final int z;
  @override
  final bool? isLower;

  @override
  String toString() {
    return 'AppVersionDto(x: $x, y: $y, z: $z, isLower: $isLower)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppVersionDtoImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.z, z) || other.z == z) &&
            (identical(other.isLower, isLower) || other.isLower == isLower));
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y, z, isLower);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppVersionDtoImplCopyWith<_$AppVersionDtoImpl> get copyWith =>
      __$$AppVersionDtoImplCopyWithImpl<_$AppVersionDtoImpl>(this, _$identity);
}

abstract class _AppVersionDto implements AppVersionDto {
  const factory _AppVersionDto(
      {required final int x,
      required final int y,
      required final int z,
      final bool? isLower}) = _$AppVersionDtoImpl;

  @override
  int get x;
  @override
  int get y;
  @override
  int get z;
  @override
  bool? get isLower;
  @override
  @JsonKey(ignore: true)
  _$$AppVersionDtoImplCopyWith<_$AppVersionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
