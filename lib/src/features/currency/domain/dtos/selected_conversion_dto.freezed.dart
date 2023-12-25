// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_conversion_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectedConversionDto {
  String get currencyFrom => throw _privateConstructorUsedError;
  String get currencyTo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectedConversionDtoCopyWith<SelectedConversionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedConversionDtoCopyWith<$Res> {
  factory $SelectedConversionDtoCopyWith(SelectedConversionDto value,
          $Res Function(SelectedConversionDto) then) =
      _$SelectedConversionDtoCopyWithImpl<$Res, SelectedConversionDto>;
  @useResult
  $Res call({String currencyFrom, String currencyTo});
}

/// @nodoc
class _$SelectedConversionDtoCopyWithImpl<$Res,
        $Val extends SelectedConversionDto>
    implements $SelectedConversionDtoCopyWith<$Res> {
  _$SelectedConversionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencyFrom = null,
    Object? currencyTo = null,
  }) {
    return _then(_value.copyWith(
      currencyFrom: null == currencyFrom
          ? _value.currencyFrom
          : currencyFrom // ignore: cast_nullable_to_non_nullable
              as String,
      currencyTo: null == currencyTo
          ? _value.currencyTo
          : currencyTo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedConversionDtoImplCopyWith<$Res>
    implements $SelectedConversionDtoCopyWith<$Res> {
  factory _$$SelectedConversionDtoImplCopyWith(
          _$SelectedConversionDtoImpl value,
          $Res Function(_$SelectedConversionDtoImpl) then) =
      __$$SelectedConversionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currencyFrom, String currencyTo});
}

/// @nodoc
class __$$SelectedConversionDtoImplCopyWithImpl<$Res>
    extends _$SelectedConversionDtoCopyWithImpl<$Res,
        _$SelectedConversionDtoImpl>
    implements _$$SelectedConversionDtoImplCopyWith<$Res> {
  __$$SelectedConversionDtoImplCopyWithImpl(_$SelectedConversionDtoImpl _value,
      $Res Function(_$SelectedConversionDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencyFrom = null,
    Object? currencyTo = null,
  }) {
    return _then(_$SelectedConversionDtoImpl(
      currencyFrom: null == currencyFrom
          ? _value.currencyFrom
          : currencyFrom // ignore: cast_nullable_to_non_nullable
              as String,
      currencyTo: null == currencyTo
          ? _value.currencyTo
          : currencyTo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectedConversionDtoImpl implements _SelectedConversionDto {
  const _$SelectedConversionDtoImpl(
      {required this.currencyFrom, required this.currencyTo});

  @override
  final String currencyFrom;
  @override
  final String currencyTo;

  @override
  String toString() {
    return 'SelectedConversionDto(currencyFrom: $currencyFrom, currencyTo: $currencyTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedConversionDtoImpl &&
            (identical(other.currencyFrom, currencyFrom) ||
                other.currencyFrom == currencyFrom) &&
            (identical(other.currencyTo, currencyTo) ||
                other.currencyTo == currencyTo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currencyFrom, currencyTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedConversionDtoImplCopyWith<_$SelectedConversionDtoImpl>
      get copyWith => __$$SelectedConversionDtoImplCopyWithImpl<
          _$SelectedConversionDtoImpl>(this, _$identity);
}

abstract class _SelectedConversionDto implements SelectedConversionDto {
  const factory _SelectedConversionDto(
      {required final String currencyFrom,
      required final String currencyTo}) = _$SelectedConversionDtoImpl;

  @override
  String get currencyFrom;
  @override
  String get currencyTo;
  @override
  @JsonKey(ignore: true)
  _$$SelectedConversionDtoImplCopyWith<_$SelectedConversionDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
