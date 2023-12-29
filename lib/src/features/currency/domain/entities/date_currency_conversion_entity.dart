import 'package:balhom/src/features/currency/domain/entities/currency_conversion_list_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_currency_conversion_entity.freezed.dart';
part 'date_currency_conversion_entity.g.dart';

/// [DateCurrencyConversionEntity] model
@freezed
class DateCurrencyConversionEntity with _$DateCurrencyConversionEntity {
  /// Factory constructor
  /// [conversions] - [List] conversions
  /// [date] - [DateTime] date
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DateCurrencyConversionEntity(
      {required List<CurrencyConversionListEntity> conversions,
      required DateTime date}) = _DateCurrencyConversionEntity;

  // Serialization
  factory DateCurrencyConversionEntity.fromJson(Map<String, dynamic> json) =>
      _$DateCurrencyConversionEntityFromJson(json);
}
