import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_statistics_entity.freezed.dart';
part 'daily_statistics_entity.g.dart';

/// [DailyStatisticsEntity] model
@freezed
class DailyStatisticsEntity with _$DailyStatisticsEntity {
  /// Factory constructor
  /// [day] - [int] day
  /// [expense] - [double] expense
  /// [revenue] - [double] revenue
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DailyStatisticsEntity({
    required int day,
    required double expense,
    required double revenue,
  }) = _DailyStatisticsEntity;

  // Serialization
  factory DailyStatisticsEntity.fromJson(Map<String, dynamic> json) =>
      _$DailyStatisticsEntityFromJson(json);
}
