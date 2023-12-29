import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/features/auth/domain/entities/credentials_entity.dart';
import 'package:balhom/src/features/auth/domain/entities/jwt_entity.dart';
import 'package:fpdart/fpdart.dart';

/// Authentication Repository Interface.
abstract class AuthRepositoryInterface {
  Future<Either<Failure, JwtEntity>> trySignIn();

  Future<Either<Failure, JwtEntity>> login(CredentialsEntity credentials);

  Future<Either<Failure, void>> logout();
}
