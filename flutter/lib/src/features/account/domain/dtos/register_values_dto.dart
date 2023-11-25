import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/account/domain/entities/register_entity.dart';
import 'package:balance_home_app/src/features/auth/domain/values/email_value.dart';
import 'package:balance_home_app/src/features/auth/domain/values/register_username_value.dart';
import 'package:balance_home_app/src/features/auth/domain/values/register_password_value.dart';
import 'package:balance_home_app/src/features/auth/domain/values/register_repeat_password_value.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_values_dto.freezed.dart';

/// [RegisterValuesDto] dto
@freezed
class RegisterValuesDto with _$RegisterValuesDto {
  const RegisterValuesDto._();

  const factory RegisterValuesDto({
    required RegisterUsernameValue usernameValue,
    required EmailValue emailValue,
    required String locale,
    required String prefCurrencyType,
    required RegisterPasswordValue passwordValue,
    required RegisterRepeatPasswordValue repeatPasswordValue,
  }) = _RegisterValuesDto;

  Either<Failure, RegisterEntity> toEntity() {
    return usernameValue.value.fold((failure) {
      return left(failure);
    }, (username) {
      return emailValue.value.fold((failure) {
        return left(failure);
      }, (email) {
        return passwordValue.value.fold((failure) {
          return left(failure);
        }, (password) {
          return repeatPasswordValue.value.fold((failure) {
            return left(failure);
          }, (repeatPassword) {
            return right(RegisterEntity(
                username: username,
                email: email,
                locale: locale,
                prefCurrencyType: prefCurrencyType,
                password: password,
                repeatPassword: repeatPassword));
          });
        });
      });
    });
  }
}
