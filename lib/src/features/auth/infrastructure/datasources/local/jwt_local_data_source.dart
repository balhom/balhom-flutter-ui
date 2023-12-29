import 'package:balhom/src/core/clients/local_preferences_client.dart';
import 'package:balhom/src/core/domain/failures/empty_failure.dart';
import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

/// Manage JWT in device storage
class JwtLocalDataSource {
  final LocalPreferencesClient storageClient;

  /// Default constructor for [JwtLocalDataSource]
  JwtLocalDataSource({required this.storageClient});

  /// Get access token from the device storage
  Future<Either<Failure, String>> getAccess() async {
    final String? access = await storageClient.getValue("accessToken");
    if (access == null) {
      return left(const EmptyFailure());
    }
    return right(access);
  }

  /// Store access token in device storage
  Future<bool> storeAccess(final String accessToken) async {
    try {
      await storageClient.store("accessToken", accessToken);
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Get refresh token from the device storage
  Future<Either<Failure, String>> getRefresh() async {
    final String? access = await storageClient.getValue("refreshToken");
    if (access == null) {
      return left(const EmptyFailure());
    }
    return right(access);
  }

  /// Store refresh token in device storage
  Future<bool> storeRefresh(final String refreshToken) async {
    try {
      await storageClient.store("refreshToken", refreshToken);
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Remove jwt from device storage
  Future<bool> remove() async {
    try {
      await storageClient.removeKey("accessToken");
      await storageClient.removeKey("refreshToken");
    } catch (_) {
      return false;
    }
    return true;
  }
}
