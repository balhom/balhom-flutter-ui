import 'package:balance_home_app/src/features/balance/domain/entities/balance_type_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_entity.freezed.dart';
part 'balance_entity.g.dart';

/// [BalanceEntity] model
@freezed
class BalanceEntity with _$BalanceEntity {
  const BalanceEntity._();

  /// Factory constructor
  /// [id] - [int] id
  /// [name] - [String] name
  /// [description] - [String] description
  /// [realQuantity] - [double] quantity
  /// [convertedQuantity] - [double] quantity
  /// [date] - [DateTime] date
  /// [currencyType] - [String] currency type code
  /// [balanceType] - [BalanceTypeEntity] balance type
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BalanceEntity({
    // ignore: invalid_annotation_target
    @JsonKey(includeIfNull: false) required int? id,
    required String name,
    required String description,
    required double realQuantity,
    // ignore: invalid_annotation_target
    @JsonKey(includeIfNull: false) required double? convertedQuantity,
    required DateTime date,
    required String currencyType,
    required BalanceTypeEntity balanceType,
  }) = _BalanceEntity;

  // Serialization
  factory BalanceEntity.fromJson(Map<String, dynamic> json) =>
      _$BalanceEntityFromJson(json);
}
