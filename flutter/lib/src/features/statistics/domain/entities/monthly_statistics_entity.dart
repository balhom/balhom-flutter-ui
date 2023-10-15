import 'package:freezed_annotation/freezed_annotation.dart';

part 'monthly_statistics_entity.freezed.dart';
part 'monthly_statistics_entity.g.dart';

/// [MonthlyStatisticsEntity] model
@freezed
class MonthlyStatisticsEntity with _$MonthlyStatisticsEntity {
  /// Factory constructor
  /// [month] - [int] month
  /// [expense] - [double] expense
  /// [revenue] - [double] revenue
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MonthlyStatisticsEntity({
    required int month,
    required double expense,
    required double revenue,
  }) = _MonthlyStatisticsEntity;

  // Serialization
  factory MonthlyStatisticsEntity.fromJson(Map<String, dynamic> json) =>
      _$MonthlyStatisticsEntityFromJson(json);
}
