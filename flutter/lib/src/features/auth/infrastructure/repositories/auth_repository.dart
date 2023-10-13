import 'package:balance_home_app/src/core/domain/failures/empty_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/auth/domain/entities/credentials_entity.dart';
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
  Future<Either<Failure, void>> trySignIn() async {
    final jwtStorage = await jwtLocalDataSource.get();
    return await jwtStorage.fold((failure) async {
      // Clean wrong data
      await jwtLocalDataSource.remove();
      return left(failure);
    }, (value) async {
      jwtRemoteDataSource.setJwt(value);
      return right(null);
    });
  }

  @override
  Future<Either<Failure, void>> login(CredentialsEntity credentials,
      {bool store = false}) async {
    final response = await jwtRemoteDataSource.get(credentials);
    // Check if there is a request failure
    return await response.fold((failure) => left(failure), (value) async {
      await jwtLocalDataSource.store(value, longDuration: store);
      jwtRemoteDataSource.setJwt(value);
      return right(null);
    });
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    if (!await jwtLocalDataSource.remove()) return left(const EmptyFailure());
    jwtRemoteDataSource.removeJwt();
    return right(true);
  }
}
