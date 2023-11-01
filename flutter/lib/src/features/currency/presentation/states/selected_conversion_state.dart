import 'package:balance_home_app/src/features/currency/domain/dtos/selected_conversion_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedConversionState extends StateNotifier<SelectedConversionDto> {
  SelectedConversionState(
      {required String currencyFrom, required String currencyTo})
      : super(SelectedConversionDto(
            currencyFrom: currencyFrom, currencyTo: currencyTo));

  void setSelectedConersion(final SelectedConversionDto selectedExchange) {
    state = selectedExchange;
  }

  void setCurrencyFrom(final String currencyFrom) {
    state = state.copyWith(currencyFrom: currencyFrom);
  }

  void setCurrencyTo(final String currencyTo) {
    state = state.copyWith(currencyTo: currencyTo);
  }
}
