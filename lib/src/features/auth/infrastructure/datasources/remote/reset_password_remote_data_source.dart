import 'package:balhom/config/balhom_api_contract.dart';
import 'package:balhom/src/core/clients/api_client.dart';
import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

class ResetPasswordRemoteDataSource {
  final ApiClient apiClient;

  ResetPasswordRemoteDataSource({required this.apiClient});

  Future<Either<Failure, void>> sendEmail(String email) async {
    final response = await apiClient
        .postRequest(BalhomAPIContract.authPasswordReset, data: {"email": email});
    // Check if there is a request failure
    return response.fold((failure) => left(failure), (_) => right(null));
  }
}
