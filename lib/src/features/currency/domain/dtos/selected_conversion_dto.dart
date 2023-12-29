import 'package:freezed_annotation/freezed_annotation.dart';

part 'selected_conversion_dto.freezed.dart';

@freezed
class SelectedConversionDto with _$SelectedConversionDto {
  const factory SelectedConversionDto({
    required String currencyFrom,
    required String currencyTo,
  }) = _SelectedConversionDto;
}
