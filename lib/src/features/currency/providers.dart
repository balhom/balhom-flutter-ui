import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/account/providers.dart';
import 'package:balhom/src/features/currency/application/currency_conversion_use_case.dart';
import 'package:balhom/src/features/currency/application/currency_type_list_use_case.dart';
import 'package:balhom/src/features/currency/application/days_currency_conversions_use_case.dart';
import 'package:balhom/src/features/currency/domain/dtos/selected_conversion_dto.dart';
import 'package:balhom/src/features/currency/domain/entities/currency_type_entity.dart';
import 'package:balhom/src/features/currency/domain/entities/date_currency_conversion_list_entity.dart';
import 'package:balhom/src/features/currency/domain/repositories/currency_repository_interface.dart';
import 'package:balhom/src/features/currency/infrastructure/datasources/remote/currency_remote_data_source.dart';
import 'package:balhom/src/features/currency/infrastructure/repositories/currency_repository.dart';
import 'package:balhom/src/features/currency/presentation/states/selected_conversion_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// Infrastructure dependencies
///

/// Currency repository
final currencyRepositoryProvider = Provider<CurrencyRepositoryInterface>(
    (ref) => CurrencyRepository(
        currencyRemoteDataSource: CurrencyRemoteDataSource(
            apiClient: ref.read(currencyConversionClientProvider))));

///
/// Application dependencies
///

final currencyTypeListsUseCaseProvider = StateNotifierProvider<
    CurrencyTypeListUseCase, AsyncValue<List<CurrencyTypeEntity>>>((ref) {
  final currencyRepository = ref.watch(currencyRepositoryProvider);
  return CurrencyTypeListUseCase(currencyRepository: currencyRepository);
});

final currencyConversionUseCaseProvider =
    Provider<CurrencyConversionUseCase>((ref) {
  final currencyRepository = ref.watch(currencyRepositoryProvider);
  return CurrencyConversionUseCase(currencyRepository: currencyRepository);
});

final daysCurrencyConversionsUseCaseProvider = StateNotifierProvider<
    DaysCurrencyConversionsUseCase,
    AsyncValue<DateCurrencyConversionListEntity>>((ref) {
  final currencyRepository = ref.read(currencyRepositoryProvider);
  return DaysCurrencyConversionsUseCase(
    currencyRepository: currencyRepository,
  );
});

///
/// Presentation dependencies
///

/// Selected conversion for statistic's currency chart
final selectedCurrencyConversionProvider =
    StateNotifierProvider<SelectedConversionState, SelectedConversionDto>(
        (ref) {
  final account = ref.watch(accountGetUseCaseProvider).asData?.value;
  final String currencyFrom =
      account != null ? account.prefCurrencyType : "EUR";
  final String currencyTo = currencyFrom == "EUR" ? "USD" : "EUR";
  return SelectedConversionState(
      currencyFrom: currencyFrom, currencyTo: currencyTo);
});
