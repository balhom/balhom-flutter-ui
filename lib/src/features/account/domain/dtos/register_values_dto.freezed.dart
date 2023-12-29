// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_values_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterValuesDto {
  RegisterUsernameValue get usernameValue => throw _privateConstructorUsedError;
  EmailValue get emailValue => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;
  String get prefCurrencyType => throw _privateConstructorUsedError;
  RegisterPasswordValue get passwordValue => throw _privateConstructorUsedError;
  RegisterRepeatPasswordValue get repeatPasswordValue =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterValuesDtoCopyWith<RegisterValuesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterValuesDtoCopyWith<$Res> {
  factory $RegisterValuesDtoCopyWith(
          RegisterValuesDto value, $Res Function(RegisterValuesDto) then) =
      _$RegisterValuesDtoCopyWithImpl<$Res, RegisterValuesDto>;
  @useResult
  $Res call(
      {RegisterUsernameValue usernameValue,
      EmailValue emailValue,
      String locale,
      String prefCurrencyType,
      RegisterPasswordValue passwordValue,
      RegisterRepeatPasswordValue repeatPasswordValue});
}

/// @nodoc
class _$RegisterValuesDtoCopyWithImpl<$Res, $Val extends RegisterValuesDto>
    implements $RegisterValuesDtoCopyWith<$Res> {
  _$RegisterValuesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameValue = null,
    Object? emailValue = null,
    Object? locale = null,
    Object? prefCurrencyType = null,
    Object? passwordValue = null,
    Object? repeatPasswordValue = null,
  }) {
    return _then(_value.copyWith(
      usernameValue: null == usernameValue
          ? _value.usernameValue
          : usernameValue // ignore: cast_nullable_to_non_nullable
              as RegisterUsernameValue,
      emailValue: null == emailValue
          ? _value.emailValue
          : emailValue // ignore: cast_nullable_to_non_nullable
              as EmailValue,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      prefCurrencyType: null == prefCurrencyType
          ? _value.prefCurrencyType
          : prefCurrencyType // ignore: cast_nullable_to_non_nullable
              as String,
      passwordValue: null == passwordValue
          ? _value.passwordValue
          : passwordValue // ignore: cast_nullable_to_non_nullable
              as RegisterPasswordValue,
      repeatPasswordValue: null == repeatPasswordValue
          ? _value.repeatPasswordValue
          : repeatPasswordValue // ignore: cast_nullable_to_non_nullable
              as RegisterRepeatPasswordValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterValuesDtoImplCopyWith<$Res>
    implements $RegisterValuesDtoCopyWith<$Res> {
  factory _$$RegisterValuesDtoImplCopyWith(_$RegisterValuesDtoImpl value,
          $Res Function(_$RegisterValuesDtoImpl) then) =
      __$$RegisterValuesDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RegisterUsernameValue usernameValue,
      EmailValue emailValue,
      String locale,
      String prefCurrencyType,
      RegisterPasswordValue passwordValue,
      RegisterRepeatPasswordValue repeatPasswordValue});
}

/// @nodoc
class __$$RegisterValuesDtoImplCopyWithImpl<$Res>
    extends _$RegisterValuesDtoCopyWithImpl<$Res, _$RegisterValuesDtoImpl>
    implements _$$RegisterValuesDtoImplCopyWith<$Res> {
  __$$RegisterValuesDtoImplCopyWithImpl(_$RegisterValuesDtoImpl _value,
      $Res Function(_$RegisterValuesDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameValue = null,
    Object? emailValue = null,
    Object? locale = null,
    Object? prefCurrencyType = null,
    Object? passwordValue = null,
    Object? repeatPasswordValue = null,
  }) {
    return _then(_$RegisterValuesDtoImpl(
      usernameValue: null == usernameValue
          ? _value.usernameValue
          : usernameValue // ignore: cast_nullable_to_non_nullable
              as RegisterUsernameValue,
      emailValue: null == emailValue
          ? _value.emailValue
          : emailValue // ignore: cast_nullable_to_non_nullable
              as EmailValue,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      prefCurrencyType: null == prefCurrencyType
          ? _value.prefCurrencyType
          : prefCurrencyType // ignore: cast_nullable_to_non_nullable
              as String,
      passwordValue: null == passwordValue
          ? _value.passwordValue
          : passwordValue // ignore: cast_nullable_to_non_nullable
              as RegisterPasswordValue,
      repeatPasswordValue: null == repeatPasswordValue
          ? _value.repeatPasswordValue
          : repeatPasswordValue // ignore: cast_nullable_to_non_nullable
              as RegisterRepeatPasswordValue,
    ));
  }
}

/// @nodoc

class _$RegisterValuesDtoImpl extends _RegisterValuesDto {
  const _$RegisterValuesDtoImpl(
      {required this.usernameValue,
      required this.emailValue,
      required this.locale,
      required this.prefCurrencyType,
      required this.passwordValue,
      required this.repeatPasswordValue})
      : super._();

  @override
  final RegisterUsernameValue usernameValue;
  @override
  final EmailValue emailValue;
  @override
  final String locale;
  @override
  final String prefCurrencyType;
  @override
  final RegisterPasswordValue passwordValue;
  @override
  final RegisterRepeatPasswordValue repeatPasswordValue;

  @override
  String toString() {
    return 'RegisterValuesDto(usernameValue: $usernameValue, emailValue: $emailValue, locale: $locale, prefCurrencyType: $prefCurrencyType, passwordValue: $passwordValue, repeatPasswordValue: $repeatPasswordValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterValuesDtoImpl &&
            (identical(other.usernameValue, usernameValue) ||
                other.usernameValue == usernameValue) &&
            (identical(other.emailValue, emailValue) ||
                other.emailValue == emailValue) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.prefCurrencyType, prefCurrencyType) ||
                other.prefCurrencyType == prefCurrencyType) &&
            (identical(other.passwordValue, passwordValue) ||
                other.passwordValue == passwordValue) &&
            (identical(other.repeatPasswordValue, repeatPasswordValue) ||
                other.repeatPasswordValue == repeatPasswordValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usernameValue, emailValue,
      locale, prefCurrencyType, passwordValue, repeatPasswordValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterValuesDtoImplCopyWith<_$RegisterValuesDtoImpl> get copyWith =>
      __$$RegisterValuesDtoImplCopyWithImpl<_$RegisterValuesDtoImpl>(
          this, _$identity);
}

abstract class _RegisterValuesDto extends RegisterValuesDto {
  const factory _RegisterValuesDto(
          {required final RegisterUsernameValue usernameValue,
          required final EmailValue emailValue,
          required final String locale,
          required final String prefCurrencyType,
          required final RegisterPasswordValue passwordValue,
          required final RegisterRepeatPasswordValue repeatPasswordValue}) =
      _$RegisterValuesDtoImpl;
  const _RegisterValuesDto._() : super._();

  @override
  RegisterUsernameValue get usernameValue;
  @override
  EmailValue get emailValue;
  @override
  String get locale;
  @override
  String get prefCurrencyType;
  @override
  RegisterPasswordValue get passwordValue;
  @override
  RegisterRepeatPasswordValue get repeatPasswordValue;
  @override
  @JsonKey(ignore: true)
  _$$RegisterValuesDtoImplCopyWith<_$RegisterValuesDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
