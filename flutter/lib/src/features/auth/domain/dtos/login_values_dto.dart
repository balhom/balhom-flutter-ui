import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/auth/domain/entities/credentials_entity.dart';
import 'package:balance_home_app/src/features/auth/domain/values/email_value.dart';
import 'package:balance_home_app/src/features/auth/domain/values/login_password_value.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_values_dto.freezed.dart';

/// [LoginValuesDto] dto
@freezed
class LoginValuesDto with _$LoginValuesDto {
  const LoginValuesDto._();

  const factory LoginValuesDto({
    required EmailValue emailValue,
    required LoginPasswordValue passwordValue,
  }) = _LoginValuesDto;

  Either<Failure, CredentialsEntity> toEntity() {
    return emailValue.value.fold((failure) {
      return left(failure);
    }, (email) {
      return passwordValue.value.fold((failure) {
        return left(failure);
      }, (password) {
        return right(CredentialsEntity(email: email, password: password));
      });
    });
  }
}
