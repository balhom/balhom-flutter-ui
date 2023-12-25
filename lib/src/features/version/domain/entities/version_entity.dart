import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_entity.freezed.dart';
part 'version_entity.g.dart';

/// [VersionEntity] model
@freezed
class VersionEntity with _$VersionEntity {
  /// Factory constructor
  /// [access] - [String] access token
  /// [refresh] - [String] refresh token
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory VersionEntity({
    // ignore: invalid_annotation_target
    @JsonKey(includeIfNull: false) required String appVersion,
    // ignore: invalid_annotation_target
    @JsonKey(includeIfNull: false) required String webVersion,
    // ignore: invalid_annotation_target
    @JsonKey(includeIfNull: false) required String apiVersion,
  }) = _VersionEntity;

  // Serialization
  factory VersionEntity.fromJson(Map<String, dynamic> json) =>
      _$VersionEntityFromJson(json);
}
