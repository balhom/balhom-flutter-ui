import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/auth/domain/entities/credentials_entity.dart';
import 'package:fpdart/fpdart.dart';

/// Authentication Repository Interface.
abstract class AuthRepositoryInterface {
  Future<Either<Failure, void>> trySignIn();

  Future<Either<Failure, void>> login(CredentialsEntity credentials,
      {bool store = false});

  Future<Either<Failure, void>> logout();
}
