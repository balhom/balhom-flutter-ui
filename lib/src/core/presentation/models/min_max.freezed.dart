// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'min_max.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MinMax {
  double get min => throw _privateConstructorUsedError;
  double get max => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MinMaxCopyWith<MinMax> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MinMaxCopyWith<$Res> {
  factory $MinMaxCopyWith(MinMax value, $Res Function(MinMax) then) =
      _$MinMaxCopyWithImpl<$Res, MinMax>;
  @useResult
  $Res call({double min, double max});
}

/// @nodoc
class _$MinMaxCopyWithImpl<$Res, $Val extends MinMax>
    implements $MinMaxCopyWith<$Res> {
  _$MinMaxCopyWithImpl(this._value, this._then);

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
abstract class _$$MinMaxImplCopyWith<$Res> implements $MinMaxCopyWith<$Res> {
  factory _$$MinMaxImplCopyWith(
          _$MinMaxImpl value, $Res Function(_$MinMaxImpl) then) =
      __$$MinMaxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double min, double max});
}

/// @nodoc
class __$$MinMaxImplCopyWithImpl<$Res>
    extends _$MinMaxCopyWithImpl<$Res, _$MinMaxImpl>
    implements _$$MinMaxImplCopyWith<$Res> {
  __$$MinMaxImplCopyWithImpl(
      _$MinMaxImpl _value, $Res Function(_$MinMaxImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = null,
    Object? max = null,
  }) {
    return _then(_$MinMaxImpl(
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

class _$MinMaxImpl implements _MinMax {
  const _$MinMaxImpl({required this.min, required this.max});

  @override
  final double min;
  @override
  final double max;

  @override
  String toString() {
    return 'MinMax(min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MinMaxImpl &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MinMaxImplCopyWith<_$MinMaxImpl> get copyWith =>
      __$$MinMaxImplCopyWithImpl<_$MinMaxImpl>(this, _$identity);
}

abstract class _MinMax implements MinMax {
  const factory _MinMax(
      {required final double min, required final double max}) = _$MinMaxImpl;

  @override
  double get min;
  @override
  double get max;
  @override
  @JsonKey(ignore: true)
  _$$MinMaxImplCopyWith<_$MinMaxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
