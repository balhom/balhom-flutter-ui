import 'package:balhom/config/balhom_api_contract.dart';
import 'package:balhom/src/core/clients/api_client.dart';
import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/features/account/domain/entities/account_entity.dart';
import 'package:balhom/src/features/account/domain/entities/register_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

class AccountRemoteDataSource {
  final ApiClient apiClient;

  /// Default constructor
  AccountRemoteDataSource({required this.apiClient});

  Future<Either<Failure, AccountEntity>> get() async {
    final response = await apiClient.getRequest(BalhomAPIContract.accountProfile);
    // Check if there is a request failure
    return response.fold((failure) => left(failure),
        (value) => right(AccountEntity.fromJson(value.data)));
  }

  Future<Either<Failure, void>> create(
      final RegisterEntity registration) async {
    final response = await apiClient.postRequest(BalhomAPIContract.accountCreation,
        data: registration.toJson());
    // Check if there is a request failure
    return response.fold((failure) => left(failure), (_) => right(null));
  }

  Future<Either<Failure, AccountEntity>> update(AccountEntity user) async {
    final response = await apiClient.patchRequest(BalhomAPIContract.accountProfile,
        data: user.toJson());
    // Check if there is a request failure
    return response.fold((failure) => left(failure),
        (value) => right(AccountEntity.fromJson(value.data)));
  }

  Future<Either<Failure, void>> updateImage(
      Uint8List bytes, String type) async {
    final response = await apiClient.putImageRequest(
        BalhomAPIContract.accountImage, "image", bytes, type);
    // Check if there is a request failure
    return response.fold((failure) => left(failure), (_) => right(null));
  }

  Future<Either<Failure, void>> delete() async {
    final response = await apiClient.delRequest(BalhomAPIContract.accountProfile);
    // Check if there is a request failure
    return response.fold((failure) => left(failure), (_) => right(null));
  }
}
