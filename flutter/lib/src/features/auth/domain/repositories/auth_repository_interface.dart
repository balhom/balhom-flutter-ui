import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/auth/domain/entities/credentials_entity.dart';
import 'package:balance_home_app/src/features/auth/domain/entities/jwt_entity.dart';
import 'package:fpdart/fpdart.dart';

/// Authentication Repository Interface.
abstract class AuthRepositoryInterface {
  Future<Either<Failure, JwtEntity>> trySignIn();

  Future<Either<Failure, JwtEntity>> login(CredentialsEntity credentials);

  Future<Either<Failure, void>> logout();
}
