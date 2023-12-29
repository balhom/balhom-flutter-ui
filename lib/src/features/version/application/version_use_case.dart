import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/domain/failures/http/api_bad_request_failure.dart';
import 'package:balhom/src/core/domain/failures/http/http_connection_failure.dart';
import 'package:balhom/src/core/utils/platform_utils.dart';
import 'package:balhom/src/features/version/domain/dtos/app_version_dto.dart';
import 'package:balhom/src/features/version/domain/repositories/version_repository_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionController
    extends StateNotifier<AsyncValue<Either<Failure, AppVersionDto>>> {
  final VersionRepositoryInterface repository;

  AppVersionController({required this.repository})
      : super(const AsyncValue.loading()) {
    handle();
  }

  /// Package info comparison with app version.
  @visibleForTesting
  Future<void> handle() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final res = await repository.getVersion();

    state = res.fold((failure) {
      if (failure is ApiBadRequestFailure || failure is HttpConnectionFailure) {
        return AsyncValue.data(left(failure));
      }
      return const AsyncValue.error("", StackTrace.empty);
    }, (versionEntity) {
      final AppVersionDto localVersion =
          AppVersionDto.fromPackageInfo(packageInfo);
      final AppVersionDto remoteVersion = PlatformUtils.isWeb
          ? AppVersionDto.fromString(versionEntity.webVersion)
          : AppVersionDto.fromString(versionEntity.appVersion);
      return AsyncValue.data(right(localVersion.x != remoteVersion.x
          ? localVersion.copyWith(isLower: localVersion.x < remoteVersion.x)
          : localVersion.y != remoteVersion.y
              ? localVersion.copyWith(isLower: localVersion.y < remoteVersion.y)
              : localVersion.z != remoteVersion.z
                  ? localVersion.copyWith(
                      isLower: localVersion.z < remoteVersion.z)
                  : localVersion.copyWith(isLower: false)));
    });
  }
}
