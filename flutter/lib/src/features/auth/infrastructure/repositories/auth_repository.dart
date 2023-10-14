import 'package:balance_home_app/src/core/domain/failures/empty_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/auth/domain/entities/credentials_entity.dart';
import 'package:balance_home_app/src/features/auth/domain/entities/jwt_entity.dart';
import 'package:balance_home_app/src/features/auth/infrastructure/datasources/remote/jwt_remote_data_source.dart';
import 'package:balance_home_app/src/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:balance_home_app/src/features/auth/infrastructure/datasources/local/jwt_local_data_source.dart';
import 'package:fpdart/fpdart.dart';

/// Repository that handles authorization and persists session
class AuthRepository implements AuthRepositoryInterface {
  /// Remote jwt provider
  final JwtRemoteDataSource jwtRemoteDataSource;

  /// Local jwt storage provider
  final JwtLocalDataSource jwtLocalDataSource;

  /// Default constructor
  AuthRepository({
    required this.jwtRemoteDataSource,
    required this.jwtLocalDataSource,
  });

  @override
  Future<Either<Failure, JwtEntity>> trySignIn() async {
    final response = await jwtRemoteDataSource.refresh();
    // Check if there is a request failure
    return await response.fold((failure) => left(failure), (jwtEntity) async {
      await jwtLocalDataSource.storeAccess(jwtEntity.access!);
      jwtRemoteDataSource.setAccessToken(jwtEntity.access!);
      return right(jwtEntity);
    });
  }

  @override
  Future<Either<Failure, JwtEntity>> login(
      final CredentialsEntity credentials) async {
    final response = await jwtRemoteDataSource.get(credentials);
    // Check if there is a request failure
    return await response.fold((failure) => left(failure), (jwtEntity) async {
      await jwtLocalDataSource.storeAccess(jwtEntity.access!);
      jwtRemoteDataSource.setAccessToken(jwtEntity.access!);
      return right(jwtEntity);
    });
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    if (!await jwtLocalDataSource.remove()) return left(const EmptyFailure());
    jwtRemoteDataSource.removeAccessToken();
    return right(true);
  }
}
