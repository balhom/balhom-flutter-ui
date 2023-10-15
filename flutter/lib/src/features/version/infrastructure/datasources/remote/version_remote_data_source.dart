import 'package:balance_home_app/config/balhom_api_contract.dart';
import 'package:balance_home_app/src/core/clients/api_client/api_client.dart';
import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/version/domain/entities/version_entity.dart';
import 'package:fpdart/fpdart.dart';

class VersionRemoteDataSource {
  final ApiClient apiClient;

  /// Default constructor for [VersionRemoteDataSource]
  VersionRemoteDataSource({required this.apiClient});

  Future<Either<Failure, VersionEntity>> get() async {
    final response = await apiClient.getRequest(BalhomAPIContract.version);
    // Check if there is a request failure
    return response.fold((failure) => left(failure), (value) {
      return right(VersionEntity.fromJson(value.data));
    });
  }
}
