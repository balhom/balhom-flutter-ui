import 'package:balance_home_app/config/api_contract.dart';
import 'package:balance_home_app/src/core/clients/api_client/api_client.dart';
import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/auth/domain/entities/credentials_entity.dart';
import 'package:balance_home_app/src/features/auth/domain/entities/jwt_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:universal_io/io.dart';

class JwtRemoteDataSource {
  final ApiClient apiClient;

  JwtRemoteDataSource({required this.apiClient});

  Future<Either<Failure, JwtEntity>> get(
      final CredentialsEntity credentials) async {
    final response = await apiClient.postRequest(APIContract.authAccess,
        data: credentials.toJson());
    // Check if there is a request failure
    return response.fold((failure) => left(failure),
        (value) => right(JwtEntity.fromJson(value.data)));
  }

  Future<Either<Failure, JwtEntity>> refresh() async {
    final response = await apiClient.postRequest(APIContract.authRefresh);
    // Check if there is a request failure
    return response.fold((failure) => left(failure),
        (value) => right(JwtEntity.fromJson(value.data)));
  }

  void setAccessToken(final String accessToken) {
    apiClient.setHeader(HttpHeaders.authorizationHeader, "Bearer $accessToken");
  }

  void removeAccessToken() {
    apiClient.removeHeader(HttpHeaders.authorizationHeader);
  }
}
