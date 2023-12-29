// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credentials_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CredentialsEntity _$CredentialsEntityFromJson(Map<String, dynamic> json) {
  return _CredentialsEntity.fromJson(json);
}

/// @nodoc
mixin _$CredentialsEntity {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CredentialsEntityCopyWith<CredentialsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredentialsEntityCopyWith<$Res> {
  factory $CredentialsEntityCopyWith(
          CredentialsEntity value, $Res Function(CredentialsEntity) then) =
      _$CredentialsEntityCopyWithImpl<$Res, CredentialsEntity>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$CredentialsEntityCopyWithImpl<$Res, $Val extends CredentialsEntity>
    implements $CredentialsEntityCopyWith<$Res> {
  _$CredentialsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CredentialsEntityImplCopyWith<$Res>
    implements $CredentialsEntityCopyWith<$Res> {
  factory _$$CredentialsEntityImplCopyWith(_$CredentialsEntityImpl value,
          $Res Function(_$CredentialsEntityImpl) then) =
      __$$CredentialsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$CredentialsEntityImplCopyWithImpl<$Res>
    extends _$CredentialsEntityCopyWithImpl<$Res, _$CredentialsEntityImpl>
    implements _$$CredentialsEntityImplCopyWith<$Res> {
  __$$CredentialsEntityImplCopyWithImpl(_$CredentialsEntityImpl _value,
      $Res Function(_$CredentialsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$CredentialsEntityImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CredentialsEntityImpl implements _CredentialsEntity {
  const _$CredentialsEntityImpl({required this.email, required this.password});

  factory _$CredentialsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CredentialsEntityImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'CredentialsEntity(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CredentialsEntityImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CredentialsEntityImplCopyWith<_$CredentialsEntityImpl> get copyWith =>
      __$$CredentialsEntityImplCopyWithImpl<_$CredentialsEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CredentialsEntityImplToJson(
      this,
    );
  }
}

abstract class _CredentialsEntity implements CredentialsEntity {
  const factory _CredentialsEntity(
      {required final String email,
      required final String password}) = _$CredentialsEntityImpl;

  factory _CredentialsEntity.fromJson(Map<String, dynamic> json) =
      _$CredentialsEntityImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$CredentialsEntityImplCopyWith<_$CredentialsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
