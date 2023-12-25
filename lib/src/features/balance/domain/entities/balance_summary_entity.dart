import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_summary_entity.freezed.dart';
part 'balance_summary_entity.g.dart';

/// [BalanceSummaryEntity] model
@freezed
class BalanceSummaryEntity with _$BalanceSummaryEntity {
  const BalanceSummaryEntity._();

  /// Factory constructor
  /// [type] - [String] type
  /// [quantity] - [double] quantity
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BalanceSummaryEntity({
    required String type,
    required double quantity,
  }) = _BalanceSummaryEntity;

  // Serialization
  factory BalanceSummaryEntity.fromJson(Map<String, dynamic> json) =>
      _$BalanceSummaryEntityFromJson(json);
}
