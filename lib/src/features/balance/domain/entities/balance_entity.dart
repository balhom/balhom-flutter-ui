import 'package:balhom/src/features/balance/domain/entities/balance_type_entity.dart';
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
    @DateTimeUtcConverter() required DateTime date,
    required String currencyType,
    required BalanceTypeEntity balanceType,
  }) = _BalanceEntity;

  // Serialization
  factory BalanceEntity.fromJson(Map<String, dynamic> json) =>
      _$BalanceEntityFromJson(json);
}

class DateTimeUtcConverter implements JsonConverter<DateTime, String> {
  const DateTimeUtcConverter();

  @override
  DateTime fromJson(String dateTime) {
    return DateTime.parse(dateTime).toLocal();
  }

  @override
  String toJson(DateTime dateTime) {
    return dateTime.toUtc().toIso8601String();
  }
}
