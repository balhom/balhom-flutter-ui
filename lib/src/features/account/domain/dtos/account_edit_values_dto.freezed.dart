// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_edit_values_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountEditValuesDto {
  AccountEntity get oldUser => throw _privateConstructorUsedError;
  RegisterUsernameValue get usernameValue => throw _privateConstructorUsedError;
  EmailValue get emailValue => throw _privateConstructorUsedError;
  BalanceQuantityValue get expectedMonthlyBalanceValue =>
      throw _privateConstructorUsedError;
  BalanceQuantityValue get expectedAnnualBalanceValue =>
      throw _privateConstructorUsedError;
  String get prefCurrencyType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountEditValuesDtoCopyWith<AccountEditValuesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountEditValuesDtoCopyWith<$Res> {
  factory $AccountEditValuesDtoCopyWith(AccountEditValuesDto value,
          $Res Function(AccountEditValuesDto) then) =
      _$AccountEditValuesDtoCopyWithImpl<$Res, AccountEditValuesDto>;
  @useResult
  $Res call(
      {AccountEntity oldUser,
      RegisterUsernameValue usernameValue,
      EmailValue emailValue,
      BalanceQuantityValue expectedMonthlyBalanceValue,
      BalanceQuantityValue expectedAnnualBalanceValue,
      String prefCurrencyType});

  $AccountEntityCopyWith<$Res> get oldUser;
}

/// @nodoc
class _$AccountEditValuesDtoCopyWithImpl<$Res,
        $Val extends AccountEditValuesDto>
    implements $AccountEditValuesDtoCopyWith<$Res> {
  _$AccountEditValuesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldUser = null,
    Object? usernameValue = null,
    Object? emailValue = null,
    Object? expectedMonthlyBalanceValue = null,
    Object? expectedAnnualBalanceValue = null,
    Object? prefCurrencyType = null,
  }) {
    return _then(_value.copyWith(
      oldUser: null == oldUser
          ? _value.oldUser
          : oldUser // ignore: cast_nullable_to_non_nullable
              as AccountEntity,
      usernameValue: null == usernameValue
          ? _value.usernameValue
          : usernameValue // ignore: cast_nullable_to_non_nullable
              as RegisterUsernameValue,
      emailValue: null == emailValue
          ? _value.emailValue
          : emailValue // ignore: cast_nullable_to_non_nullable
              as EmailValue,
      expectedMonthlyBalanceValue: null == expectedMonthlyBalanceValue
          ? _value.expectedMonthlyBalanceValue
          : expectedMonthlyBalanceValue // ignore: cast_nullable_to_non_nullable
              as BalanceQuantityValue,
      expectedAnnualBalanceValue: null == expectedAnnualBalanceValue
          ? _value.expectedAnnualBalanceValue
          : expectedAnnualBalanceValue // ignore: cast_nullable_to_non_nullable
              as BalanceQuantityValue,
      prefCurrencyType: null == prefCurrencyType
          ? _value.prefCurrencyType
          : prefCurrencyType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountEntityCopyWith<$Res> get oldUser {
    return $AccountEntityCopyWith<$Res>(_value.oldUser, (value) {
      return _then(_value.copyWith(oldUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountEditValuesDtoImplCopyWith<$Res>
    implements $AccountEditValuesDtoCopyWith<$Res> {
  factory _$$AccountEditValuesDtoImplCopyWith(_$AccountEditValuesDtoImpl value,
          $Res Function(_$AccountEditValuesDtoImpl) then) =
      __$$AccountEditValuesDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AccountEntity oldUser,
      RegisterUsernameValue usernameValue,
      EmailValue emailValue,
      BalanceQuantityValue expectedMonthlyBalanceValue,
      BalanceQuantityValue expectedAnnualBalanceValue,
      String prefCurrencyType});

  @override
  $AccountEntityCopyWith<$Res> get oldUser;
}

/// @nodoc
class __$$AccountEditValuesDtoImplCopyWithImpl<$Res>
    extends _$AccountEditValuesDtoCopyWithImpl<$Res, _$AccountEditValuesDtoImpl>
    implements _$$AccountEditValuesDtoImplCopyWith<$Res> {
  __$$AccountEditValuesDtoImplCopyWithImpl(_$AccountEditValuesDtoImpl _value,
      $Res Function(_$AccountEditValuesDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldUser = null,
    Object? usernameValue = null,
    Object? emailValue = null,
    Object? expectedMonthlyBalanceValue = null,
    Object? expectedAnnualBalanceValue = null,
    Object? prefCurrencyType = null,
  }) {
    return _then(_$AccountEditValuesDtoImpl(
      oldUser: null == oldUser
          ? _value.oldUser
          : oldUser // ignore: cast_nullable_to_non_nullable
              as AccountEntity,
      usernameValue: null == usernameValue
          ? _value.usernameValue
          : usernameValue // ignore: cast_nullable_to_non_nullable
              as RegisterUsernameValue,
      emailValue: null == emailValue
          ? _value.emailValue
          : emailValue // ignore: cast_nullable_to_non_nullable
              as EmailValue,
      expectedMonthlyBalanceValue: null == expectedMonthlyBalanceValue
          ? _value.expectedMonthlyBalanceValue
          : expectedMonthlyBalanceValue // ignore: cast_nullable_to_non_nullable
              as BalanceQuantityValue,
      expectedAnnualBalanceValue: null == expectedAnnualBalanceValue
          ? _value.expectedAnnualBalanceValue
          : expectedAnnualBalanceValue // ignore: cast_nullable_to_non_nullable
              as BalanceQuantityValue,
      prefCurrencyType: null == prefCurrencyType
          ? _value.prefCurrencyType
          : prefCurrencyType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AccountEditValuesDtoImpl extends _AccountEditValuesDto {
  const _$AccountEditValuesDtoImpl(
      {required this.oldUser,
      required this.usernameValue,
      required this.emailValue,
      required this.expectedMonthlyBalanceValue,
      required this.expectedAnnualBalanceValue,
      required this.prefCurrencyType})
      : super._();

  @override
  final AccountEntity oldUser;
  @override
  final RegisterUsernameValue usernameValue;
  @override
  final EmailValue emailValue;
  @override
  final BalanceQuantityValue expectedMonthlyBalanceValue;
  @override
  final BalanceQuantityValue expectedAnnualBalanceValue;
  @override
  final String prefCurrencyType;

  @override
  String toString() {
    return 'AccountEditValuesDto(oldUser: $oldUser, usernameValue: $usernameValue, emailValue: $emailValue, expectedMonthlyBalanceValue: $expectedMonthlyBalanceValue, expectedAnnualBalanceValue: $expectedAnnualBalanceValue, prefCurrencyType: $prefCurrencyType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountEditValuesDtoImpl &&
            (identical(other.oldUser, oldUser) || other.oldUser == oldUser) &&
            (identical(other.usernameValue, usernameValue) ||
                other.usernameValue == usernameValue) &&
            (identical(other.emailValue, emailValue) ||
                other.emailValue == emailValue) &&
            (identical(other.expectedMonthlyBalanceValue,
                    expectedMonthlyBalanceValue) ||
                other.expectedMonthlyBalanceValue ==
                    expectedMonthlyBalanceValue) &&
            (identical(other.expectedAnnualBalanceValue,
                    expectedAnnualBalanceValue) ||
                other.expectedAnnualBalanceValue ==
                    expectedAnnualBalanceValue) &&
            (identical(other.prefCurrencyType, prefCurrencyType) ||
                other.prefCurrencyType == prefCurrencyType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      oldUser,
      usernameValue,
      emailValue,
      expectedMonthlyBalanceValue,
      expectedAnnualBalanceValue,
      prefCurrencyType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountEditValuesDtoImplCopyWith<_$AccountEditValuesDtoImpl>
      get copyWith =>
          __$$AccountEditValuesDtoImplCopyWithImpl<_$AccountEditValuesDtoImpl>(
              this, _$identity);
}

abstract class _AccountEditValuesDto extends AccountEditValuesDto {
  const factory _AccountEditValuesDto(
      {required final AccountEntity oldUser,
      required final RegisterUsernameValue usernameValue,
      required final EmailValue emailValue,
      required final BalanceQuantityValue expectedMonthlyBalanceValue,
      required final BalanceQuantityValue expectedAnnualBalanceValue,
      required final String prefCurrencyType}) = _$AccountEditValuesDtoImpl;
  const _AccountEditValuesDto._() : super._();

  @override
  AccountEntity get oldUser;
  @override
  RegisterUsernameValue get usernameValue;
  @override
  EmailValue get emailValue;
  @override
  BalanceQuantityValue get expectedMonthlyBalanceValue;
  @override
  BalanceQuantityValue get expectedAnnualBalanceValue;
  @override
  String get prefCurrencyType;
  @override
  @JsonKey(ignore: true)
  _$$AccountEditValuesDtoImplCopyWith<_$AccountEditValuesDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
