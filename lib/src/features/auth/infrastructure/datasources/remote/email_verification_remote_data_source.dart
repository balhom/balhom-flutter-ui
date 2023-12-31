import 'package:balhom/config/balhom_api_contract.dart';
import 'package:balhom/src/core/clients/api_client.dart';
import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

class EmailVerificationRemoteDataSource {
  final ApiClient apiClient;

  EmailVerificationRemoteDataSource({required this.apiClient});

  Future<Either<Failure, void>> sendEmail(String email) async {
    final response = await apiClient
        .postRequest(BalhomAPIContract.authEmailVerify, data: {"email": email});
    // Check if there is a request failure
    return response.fold((failure) => left(failure), (_) => right(null));
  }
}
