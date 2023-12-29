import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/features/account/domain/entities/account_entity.dart';
import 'package:balhom/src/features/auth/domain/values/email_value.dart';
import 'package:balhom/src/features/auth/domain/values/register_username_value.dart';
import 'package:balhom/src/features/balance/domain/values/balance_quantity_value.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_edit_values_dto.freezed.dart';

/// [AccountEditValuesDto] dto
@freezed
class AccountEditValuesDto with _$AccountEditValuesDto {
  const AccountEditValuesDto._();

  const factory AccountEditValuesDto({
    required AccountEntity oldUser,
    required RegisterUsernameValue usernameValue,
    required EmailValue emailValue,
    required BalanceQuantityValue expectedMonthlyBalanceValue,
    required BalanceQuantityValue expectedAnnualBalanceValue,
    required String prefCurrencyType,
  }) = _AccountEditValuesDto;

  Either<Failure, AccountEntity> toEntity() {
    return usernameValue.value.fold((failure) {
      return left(failure);
    }, (username) {
      return emailValue.value.fold((failure) {
        return left(failure);
      }, (email) {
        return expectedMonthlyBalanceValue.value.fold((failure) {
          return left(failure);
        }, (expectedMonthlyBalance) {
          return expectedAnnualBalanceValue.value.fold((failure) {
            return left(failure);
          }, (expectedAnnualBalance) {
            return right(AccountEntity(
                username: username,
                email: email,
                receiveEmailBalance: oldUser.receiveEmailBalance,
                currentBalance: oldUser.currentBalance,
                expectedAnnualBalance: expectedAnnualBalance,
                expectedMonthlyBalance: expectedMonthlyBalance,
                locale: oldUser.locale,
                prefCurrencyType: prefCurrencyType,
                lastLogin: null,
                image: null));
          });
        });
      });
    });
  }
}
