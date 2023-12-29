// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'min_max_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MinMaxDto {
  double get min => throw _privateConstructorUsedError;
  double get max => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MinMaxDtoCopyWith<MinMaxDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MinMaxDtoCopyWith<$Res> {
  factory $MinMaxDtoCopyWith(MinMaxDto value, $Res Function(MinMaxDto) then) =
      _$MinMaxDtoCopyWithImpl<$Res, MinMaxDto>;
  @useResult
  $Res call({double min, double max});
}

/// @nodoc
class _$MinMaxDtoCopyWithImpl<$Res, $Val extends MinMaxDto>
    implements $MinMaxDtoCopyWith<$Res> {
  _$MinMaxDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_value.copyWith(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MinMaxDtoImplCopyWith<$Res>
    implements $MinMaxDtoCopyWith<$Res> {
  factory _$$MinMaxDtoImplCopyWith(
          _$MinMaxDtoImpl value, $Res Function(_$MinMaxDtoImpl) then) =
      __$$MinMaxDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double min, double max});
}

/// @nodoc
class __$$MinMaxDtoImplCopyWithImpl<$Res>
    extends _$MinMaxDtoCopyWithImpl<$Res, _$MinMaxDtoImpl>
    implements _$$MinMaxDtoImplCopyWith<$Res> {
  __$$MinMaxDtoImplCopyWithImpl(
      _$MinMaxDtoImpl _value, $Res Function(_$MinMaxDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_$MinMaxDtoImpl(
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$MinMaxDtoImpl implements _MinMaxDto {
  const _$MinMaxDtoImpl({required this.min, required this.max});

  @override
  final double min;
  @override
  final double max;

  @override
  String toString() {
    return 'MinMaxDto(min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MinMaxDtoImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MinMaxDtoImplCopyWith<_$MinMaxDtoImpl> get copyWith =>
      __$$MinMaxDtoImplCopyWithImpl<_$MinMaxDtoImpl>(this, _$identity);
}

abstract class _MinMaxDto implements MinMaxDto {
  const factory _MinMaxDto(
      {required final double min, required final double max}) = _$MinMaxDtoImpl;

  @override
  double get min;
  @override
  double get max;
  @override
  @JsonKey(ignore: true)
  _$$MinMaxDtoImplCopyWith<_$MinMaxDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
