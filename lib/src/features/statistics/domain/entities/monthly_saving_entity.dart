import 'package:freezed_annotation/freezed_annotation.dart';

part 'monthly_saving_entity.freezed.dart';
part 'monthly_saving_entity.g.dart';

/// [MonthlySavingEntity] model
@freezed
class MonthlySavingEntity with _$MonthlySavingEntity {
  /// Factory constructor
  /// [grossQuantity] - [double] gross quantity
  /// [expectedQuantity] - [double] expected quantity
  /// [currencyType] - [String] coin type code
  /// [year] - [int] year
  /// [month] - [int] month
  /// [created] - [DateTime] created
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MonthlySavingEntity({
    required double grossQuantity,
    required double expectedQuantity,
    required String currencyType,
    required int year,
    required int month,
    required DateTime created,
  }) = _MonthlySavingEntity;

  // Serialization
  factory MonthlySavingEntity.fromJson(Map<String, dynamic> json) =>
      _$MonthlySavingEntityFromJson(json);
}
