import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/api_bad_request_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/input_bad_request_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balance_home_app/src/features/account/domain/dtos/register_values_dto.dart';
import 'package:balance_home_app/src/features/account/domain/entities/account_entity.dart';
import 'package:balance_home_app/src/features/account/domain/repositories/account_repository_interface.dart';
import 'package:balance_home_app/src/features/auth/domain/failures/register_failure.dart';
import 'package:balance_home_app/src/features/auth/domain/values/email_value.dart';
import 'package:balance_home_app/src/features/auth/domain/values/register_name_value.dart';
import 'package:balance_home_app/src/features/balance/domain/values/balance_quantity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountController extends StateNotifier<AsyncValue<AccountEntity?>> {
  final AccountRepositoryInterface accountRepository;

  AccountController({required this.accountRepository})
      : super(const AsyncValue.data(null));

  Future<Either<Failure, void>> get() async {
    state = const AsyncValue.loading();
    return await Future.delayed(const Duration(seconds: 2), () async {
      final res = await accountRepository.get();
      return res.fold((failure) {
        return left(failure);
      }, (value) {
        state = AsyncValue.data(value);
        return right(null);
      });
    });
  }

  Future<Either<Failure, void>> create(
      final RegisterValuesDto registerValuesDto,
      final AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();

    return await registerValuesDto.toEntity().fold((failure) {
      state = const AsyncValue.data(null);
      return left(failure);
    }, (registerEntity) async {
      final res = await accountRepository.create(registerEntity);
      state = const AsyncValue.data(null);
      return res.fold((failure) {
        return left(RegisterFailure.fromFailure(failure, appLocalizations));
      }, (value) => right(value));
    });
  }

  Future<Either<Failure, AccountEntity>> update(
      AccountEntity oldUser,
      RegisterNameValue username,
      EmailValue email,
      BalanceQuantity expectedMonthlyBalance,
      BalanceQuantity expectedAnnualBalance,
      String prefCurrencyType,
      AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    return await username.value.fold((failure) {
      state = const AsyncValue.data(null);
      return left(failure);
    }, (username) async {
      return await email.value.fold((failure) {
        state = const AsyncValue.data(null);
        return left(failure);
      }, (email) async {
        return await expectedMonthlyBalance.value.fold((failure) {
          state = const AsyncValue.data(null);
          return left(failure);
        }, (expectedMonthlyBalance) async {
          return await expectedAnnualBalance.value.fold((failure) {
            state = const AsyncValue.data(null);
            return left(failure);
          }, (expectedAnnualBalance) async {
            final res = await accountRepository.update(
              AccountEntity(
                  username: username,
                  email: email,
                  receiveEmailBalance: oldUser.receiveEmailBalance,
                  balance: oldUser.balance,
                  expectedAnnualBalance: expectedAnnualBalance,
                  expectedMonthlyBalance: expectedMonthlyBalance,
                  language: oldUser.language,
                  prefCoinType: prefCurrencyType,
                  lastLogin: null,
                  image: null),
            );
            return res.fold((failure) {
              state = const AsyncValue.data(null);
              if (failure is ApiBadRequestFailure) {
                return left(UnprocessableValueFailure(detail: failure.detail));
              } else if (failure is InputBadRequestFailure) {
                if (failure.containsFieldName("pref_currency_type")) {
                  return left(UnprocessableValueFailure(
                      detail: appLocalizations.userEditPrefCurrencyTypeError));
                } else if (failure.containsFieldName("username")) {
                  return left(UnprocessableValueFailure(
                      detail: appLocalizations.usernameUsed));
                }
              }
              return left(UnprocessableValueFailure(
                  detail: appLocalizations.genericError));
            }, (value) {
              state = const AsyncValue.data(null);
              return right(value);
            });
          });
        });
      });
    });
  }

  Future<Either<Failure, void>> updateImage(final Uint8List imageBytes,
      final String imageType, final AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    final res = await accountRepository.updateImage(imageBytes, imageType);
    return res.fold((_) {
      state = const AsyncValue.data(null);
      return left(UnprocessableValueFailure(
          detail: appLocalizations.userEditImageError));
    }, (value) {
      state = const AsyncValue.data(null);
      return right(value);
    });
  }

  /// Delete current account data
  Future<Either<Failure, void>> delete() async {
    final res = await accountRepository.delete();
    if (res.isLeft()) return res;
    return right(null);
  }
}
