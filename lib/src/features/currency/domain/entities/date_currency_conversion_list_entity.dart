import 'package:balhom/src/features/currency/domain/entities/date_currency_conversion_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_currency_conversion_list_entity.freezed.dart';
part 'date_currency_conversion_list_entity.g.dart';

/// [DateCurrencyConversionListEntity] model
@freezed
class DateCurrencyConversionListEntity with _$DateCurrencyConversionListEntity {
  /// Factory constructor
  /// [dateConversions] - [List] dateConversions
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DateCurrencyConversionListEntity(
          {required List<DateCurrencyConversionEntity> dateConversions}) =
      _DateCurrencyConversionListEntity;

  // Serialization
  factory DateCurrencyConversionListEntity.fromJson(
          Map<String, dynamic> json) =>
      _$DateCurrencyConversionListEntityFromJson(json);
}
