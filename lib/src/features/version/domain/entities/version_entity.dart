import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_entity.freezed.dart';
part 'version_entity.g.dart';

/// [VersionEntity] model
@freezed
class VersionEntity with _$VersionEntity {
  /// Factory constructor
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory VersionEntity({
    required String appVersion,
    required String webVersion,
    required String apiVersion,
  }) = _VersionEntity;

  // Serialization
  factory VersionEntity.fromJson(Map<String, dynamic> json) =>
      _$VersionEntityFromJson(json);
}
