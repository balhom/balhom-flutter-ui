import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/account/domain/entities/register_entity.dart';
import 'package:balance_home_app/src/features/account/domain/entities/account_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

/// Authentication Repository Interface.
abstract class AccountRepositoryInterface {
  Future<Either<Failure, void>> delete();

  Future<Either<Failure, void>> create(RegisterEntity registration);

  Future<Either<Failure, AccountEntity>> update(AccountEntity user);

  Future<Either<Failure, void>> updateImage(
      Uint8List imageBytes, String imageType);

  Future<Either<Failure, AccountEntity>> get();
}
