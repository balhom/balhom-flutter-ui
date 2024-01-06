import 'package:balhom/src/core/utils/platform_utils.dart';
import 'package:balhom/src/features/version/domain/dtos/app_version_dto.dart';
import 'package:balhom/src/features/version/domain/repositories/version_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionUseCase extends StateNotifier<AsyncValue<AppVersionDto>> {
  final VersionRepositoryInterface repository;

  AppVersionUseCase({required this.repository})
      : super(const AsyncValue.loading()) {
    handle();
  }

  /// Package info comparison with app version.
  Future<void> handle() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final res = await repository.getVersion();

    state = res.fold((failure) {
      return AsyncValue.error(failure, StackTrace.empty);
    }, (versionEntity) {
      final AppVersionDto localVersion =
          AppVersionDto.fromPackageInfo(packageInfo);
      final AppVersionDto remoteVersion = PlatformUtils.isWeb
          ? AppVersionDto.fromString(versionEntity.webVersion)
          : AppVersionDto.fromString(versionEntity.appVersion);
      return AsyncValue.data(localVersion.x != remoteVersion.x
          ? localVersion.copyWith(isLower: localVersion.x < remoteVersion.x)
          : localVersion.y != remoteVersion.y
              ? localVersion.copyWith(isLower: localVersion.y < remoteVersion.y)
              : localVersion.z != remoteVersion.z
                  ? localVersion.copyWith(
                      isLower: localVersion.z < remoteVersion.z)
                  : localVersion.copyWith(isLower: false));
    });
  }
}
