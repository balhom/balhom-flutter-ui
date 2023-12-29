// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterEntity _$RegisterEntityFromJson(Map<String, dynamic> json) {
  return _RegisterEntity.fromJson(json);
}

/// @nodoc
mixin _$RegisterEntity {
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;
  String get prefCurrencyType => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get repeatPassword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterEntityCopyWith<RegisterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEntityCopyWith<$Res> {
  factory $RegisterEntityCopyWith(
          RegisterEntity value, $Res Function(RegisterEntity) then) =
      _$RegisterEntityCopyWithImpl<$Res, RegisterEntity>;
  @useResult
  $Res call(
      {String username,
      String email,
      String locale,
      String prefCurrencyType,
      String password,
      String repeatPassword});
}

/// @nodoc
class _$RegisterEntityCopyWithImpl<$Res, $Val extends RegisterEntity>
    implements $RegisterEntityCopyWith<$Res> {
  _$RegisterEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? locale = null,
    Object? prefCurrencyType = null,
    Object? password = null,
    Object? repeatPassword = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      prefCurrencyType: null == prefCurrencyType
          ? _value.prefCurrencyType
          : prefCurrencyType // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      repeatPassword: null == repeatPassword
          ? _value.repeatPassword
          : repeatPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterEntityImplCopyWith<$Res>
    implements $RegisterEntityCopyWith<$Res> {
  factory _$$RegisterEntityImplCopyWith(_$RegisterEntityImpl value,
          $Res Function(_$RegisterEntityImpl) then) =
      __$$RegisterEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String email,
      String locale,
      String prefCurrencyType,
      String password,
      String repeatPassword});
}

/// @nodoc
class __$$RegisterEntityImplCopyWithImpl<$Res>
    extends _$RegisterEntityCopyWithImpl<$Res, _$RegisterEntityImpl>
    implements _$$RegisterEntityImplCopyWith<$Res> {
  __$$RegisterEntityImplCopyWithImpl(
      _$RegisterEntityImpl _value, $Res Function(_$RegisterEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? locale = null,
    Object? prefCurrencyType = null,
    Object? password = null,
    Object? repeatPassword = null,
  }) {
    return _then(_$RegisterEntityImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      prefCurrencyType: null == prefCurrencyType
          ? _value.prefCurrencyType
          : prefCurrencyType // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      repeatPassword: null == repeatPassword
          ? _value.repeatPassword
          : repeatPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$RegisterEntityImpl implements _RegisterEntity {
  const _$RegisterEntityImpl(
      {required this.username,
      required this.email,
      required this.locale,
      required this.prefCurrencyType,
      required this.password,
      required this.repeatPassword});

  factory _$RegisterEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterEntityImplFromJson(json);

  @override
  final String username;
  @override
  final String email;
  @override
  final String locale;
  @override
  final String prefCurrencyType;
  @override
  final String password;
  @override
  final String repeatPassword;

  @override
  String toString() {
    return 'RegisterEntity(username: $username, email: $email, locale: $locale, prefCurrencyType: $prefCurrencyType, password: $password, repeatPassword: $repeatPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterEntityImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.prefCurrencyType, prefCurrencyType) ||
                other.prefCurrencyType == prefCurrencyType) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.repeatPassword, repeatPassword) ||
                other.repeatPassword == repeatPassword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, email, locale,
      prefCurrencyType, password, repeatPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterEntityImplCopyWith<_$RegisterEntityImpl> get copyWith =>
      __$$RegisterEntityImplCopyWithImpl<_$RegisterEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterEntityImplToJson(
      this,
    );
  }
}

abstract class _RegisterEntity implements RegisterEntity {
  const factory _RegisterEntity(
      {required final String username,
      required final String email,
      required final String locale,
      required final String prefCurrencyType,
      required final String password,
      required final String repeatPassword}) = _$RegisterEntityImpl;

  factory _RegisterEntity.fromJson(Map<String, dynamic> json) =
      _$RegisterEntityImpl.fromJson;

  @override
  String get username;
  @override
  String get email;
  @override
  String get locale;
  @override
  String get prefCurrencyType;
  @override
  String get password;
  @override
  String get repeatPassword;
  @override
  @JsonKey(ignore: true)
  _$$RegisterEntityImplCopyWith<_$RegisterEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
