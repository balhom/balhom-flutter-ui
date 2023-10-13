import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'app_version_dto.freezed.dart';

/// App version class.
///
/// Version is formatted as 3 numbers: `x.y.z`
@freezed
class AppVersionDto with _$AppVersionDto {
  const factory AppVersionDto(
      {required int x,
      required int y,
      required int z,
      bool? isLower}) = _AppVersionDto;

  factory AppVersionDto.fromPackageInfo(final PackageInfo packageInfo) {
    return AppVersionDto.fromString(packageInfo.version);
  }

  factory AppVersionDto.fromString(final String version) {
    final List<String> subVersions = version.split(".");
    return AppVersionDto(
        x: int.parse(subVersions[0]),
        y: int.parse(subVersions[1]),
        z: int.parse(subVersions[2]));
  }
}
