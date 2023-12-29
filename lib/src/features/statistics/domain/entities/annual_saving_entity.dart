import 'package:freezed_annotation/freezed_annotation.dart';

part 'annual_saving_entity.freezed.dart';
part 'annual_saving_entity.g.dart';

/// [AnnualSavingEntity] model
@freezed
class AnnualSavingEntity with _$AnnualSavingEntity {
  /// Factory constructor
  /// [grossQuantity] - [double] gross quantity
  /// [expectedQuantity] - [double] expected quantity
  /// [currencyType] - [String] coin type code
  /// [year] - [int] year
  /// [created] - [DateTime] created
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AnnualSavingEntity({
    required double grossQuantity,
    required double expectedQuantity,
    required String currencyType,
    required int year,
    required DateTime created,
  }) = _AnnualSavingEntity;

  // Serialization
  factory AnnualSavingEntity.fromJson(Map<String, dynamic> json) =>
      _$AnnualSavingEntityFromJson(json);
}
