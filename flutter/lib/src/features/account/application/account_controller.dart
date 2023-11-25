import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balance_home_app/src/features/account/domain/dtos/account_edit_values_dto.dart';
import 'package:balance_home_app/src/features/account/domain/dtos/register_values_dto.dart';
import 'package:balance_home_app/src/features/account/domain/entities/account_entity.dart';
import 'package:balance_home_app/src/features/account/domain/failures/account_edit_failure.dart';
import 'package:balance_home_app/src/features/account/domain/failures/register_failure.dart';
import 'package:balance_home_app/src/features/account/domain/repositories/account_repository_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountController extends StateNotifier<AsyncValue<AccountEntity?>> {
  final AccountRepositoryInterface accountRepository;

  AccountController({required this.accountRepository})
      : super(const AsyncValue.data(null)) {
    get();
  }

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
      final AccountEditValuesDto accountEditValuesDto,
      final AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    return await accountEditValuesDto.toEntity().fold((failure) {
      state = const AsyncValue.data(null);
      return left(failure);
    }, (accountEntity) async {
      final res = await accountRepository.update(accountEntity);
      return res.fold((failure) {
        state = const AsyncValue.data(null);
        return left(AccountEditFailure.fromFailure(failure, appLocalizations));
      }, (value) {
        state = const AsyncValue.data(null);
        return right(value);
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
          detail: appLocalizations.accountEditImageError));
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
