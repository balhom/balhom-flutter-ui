import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_type_entity.dart';
import 'package:balhom/src/features/balance/domain/values/balance_date_value.dart';
import 'package:balhom/src/features/balance/domain/values/balance_description_value.dart';
import 'package:balhom/src/features/balance/domain/values/balance_name_value.dart';
import 'package:balhom/src/features/balance/domain/values/balance_quantity_value.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_values_dto.freezed.dart';

/// [BalanceValuesDto] dto
@freezed
class BalanceValuesDto with _$BalanceValuesDto {
  const BalanceValuesDto._();

  const factory BalanceValuesDto({
    required int? id,
    required BalanceNameValue nameValue,
    required BalanceDescriptionValue descriptionValue,
    required BalanceQuantityValue quantityValue,
    required BalanceDateTimeValue dateValue,
    required String currencyType,
    required BalanceTypeEntity balanceType,
  }) = _BalanceValuesDto;

  Either<Failure, BalanceEntity> toEntity() {
    return nameValue.value.fold((failure) {
      return left(failure);
    }, (name) {
      return descriptionValue.value.fold((failure) {
        return left(failure);
      }, (description) {
        return quantityValue.value.fold((failure) {
          return left(failure);
        }, (quantity) {
          return dateValue.value.fold((failure) {
            return left(failure);
          }, (date) {
            return right(BalanceEntity(
                id: id,
                name: name,
                description: description,
                realQuantity: quantity,
                date: date,
                currencyType: currencyType,
                balanceType: balanceType,
                convertedQuantity: null));
          });
        });
      });
    });
  }
}
