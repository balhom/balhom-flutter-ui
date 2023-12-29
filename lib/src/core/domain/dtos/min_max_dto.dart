import 'package:freezed_annotation/freezed_annotation.dart';

part 'min_max_dto.freezed.dart';

@freezed
class MinMaxDto with _$MinMaxDto {
  const factory MinMaxDto({
    required double min,
    required double max,
  }) = _MinMaxDto;
}
