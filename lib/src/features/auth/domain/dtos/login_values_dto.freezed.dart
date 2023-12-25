// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_values_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginValuesDto {
  EmailValue get emailValue => throw _privateConstructorUsedError;
  LoginPasswordValue get passwordValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginValuesDtoCopyWith<LoginValuesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginValuesDtoCopyWith<$Res> {
  factory $LoginValuesDtoCopyWith(
          LoginValuesDto value, $Res Function(LoginValuesDto) then) =
      _$LoginValuesDtoCopyWithImpl<$Res, LoginValuesDto>;
  @useResult
  $Res call({EmailValue emailValue, LoginPasswordValue passwordValue});
}

/// @nodoc
class _$LoginValuesDtoCopyWithImpl<$Res, $Val extends LoginValuesDto>
    implements $LoginValuesDtoCopyWith<$Res> {
  _$LoginValuesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailValue = null,
    Object? passwordValue = null,
  }) {
    return _then(_value.copyWith(
      emailValue: null == emailValue
          ? _value.emailValue
          : emailValue // ignore: cast_nullable_to_non_nullable
              as EmailValue,
      passwordValue: null == passwordValue
          ? _value.passwordValue
          : passwordValue // ignore: cast_nullable_to_non_nullable
              as LoginPasswordValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginValuesDtoImplCopyWith<$Res>
    implements $LoginValuesDtoCopyWith<$Res> {
  factory _$$LoginValuesDtoImplCopyWith(_$LoginValuesDtoImpl value,
          $Res Function(_$LoginValuesDtoImpl) then) =
      __$$LoginValuesDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({EmailValue emailValue, LoginPasswordValue passwordValue});
}

/// @nodoc
class __$$LoginValuesDtoImplCopyWithImpl<$Res>
    extends _$LoginValuesDtoCopyWithImpl<$Res, _$LoginValuesDtoImpl>
    implements _$$LoginValuesDtoImplCopyWith<$Res> {
  __$$LoginValuesDtoImplCopyWithImpl(
      _$LoginValuesDtoImpl _value, $Res Function(_$LoginValuesDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailValue = null,
    Object? passwordValue = null,
  }) {
    return _then(_$LoginValuesDtoImpl(
      emailValue: null == emailValue
          ? _value.emailValue
          : emailValue // ignore: cast_nullable_to_non_nullable
              as EmailValue,
      passwordValue: null == passwordValue
          ? _value.passwordValue
          : passwordValue // ignore: cast_nullable_to_non_nullable
              as LoginPasswordValue,
    ));
  }
}

/// @nodoc

class _$LoginValuesDtoImpl extends _LoginValuesDto {
  const _$LoginValuesDtoImpl(
      {required this.emailValue, required this.passwordValue})
      : super._();

  @override
  final EmailValue emailValue;
  @override
  final LoginPasswordValue passwordValue;

  @override
  String toString() {
    return 'LoginValuesDto(emailValue: $emailValue, passwordValue: $passwordValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginValuesDtoImpl &&
            (identical(other.emailValue, emailValue) ||
                other.emailValue == emailValue) &&
            (identical(other.passwordValue, passwordValue) ||
                other.passwordValue == passwordValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailValue, passwordValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginValuesDtoImplCopyWith<_$LoginValuesDtoImpl> get copyWith =>
      __$$LoginValuesDtoImplCopyWithImpl<_$LoginValuesDtoImpl>(
          this, _$identity);
}

abstract class _LoginValuesDto extends LoginValuesDto {
  const factory _LoginValuesDto(
      {required final EmailValue emailValue,
      required final LoginPasswordValue passwordValue}) = _$LoginValuesDtoImpl;
  const _LoginValuesDto._() : super._();

  @override
  EmailValue get emailValue;
  @override
  LoginPasswordValue get passwordValue;
  @override
  @JsonKey(ignore: true)
  _$$LoginValuesDtoImplCopyWith<_$LoginValuesDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
