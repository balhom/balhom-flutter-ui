import 'package:balance_home_app/src/core/providers.dart';
import 'package:balance_home_app/src/features/account/providers.dart';
import 'package:balance_home_app/src/features/currency/application/currency_conversion_controller.dart';
import 'package:balance_home_app/src/features/currency/application/currency_type_list_controller.dart';
import 'package:balance_home_app/src/features/currency/application/days_currency_conversions_controller.dart';
import 'package:balance_home_app/src/features/currency/domain/dtos/selected_conversion_dto.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/currency_type_entity.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/date_currency_conversion_list_entity.dart';
import 'package:balance_home_app/src/features/currency/domain/repositories/currency_repository_interface.dart';
import 'package:balance_home_app/src/features/currency/infrastructure/datasources/remote/currency_remote_data_source.dart';
import 'package:balance_home_app/src/features/currency/infrastructure/repositories/currency_repository.dart';
import 'package:balance_home_app/src/features/currency/presentation/states/selected_conversion_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// Infrastructure dependencies
///

/// Currency repository
final currencyRepositoryProvider = Provider<CurrencyRepositoryInterface>(
    (ref) => CurrencyRepository(
        currencyRemoteDataSource: CurrencyRemoteDataSource(
            apiClient: ref.read(balhomApiClientProvider))));

///
/// Application dependencies
///

final currencyTypeListsControllerProvider = StateNotifierProvider<
    CurrencyTypeListController, AsyncValue<List<CurrencyTypeEntity>>>((ref) {
  final currencyRepository = ref.watch(currencyRepositoryProvider);
  return CurrencyTypeListController(currencyRepository: currencyRepository);
});

final currencyConversionControllerProvider =
    Provider<CurrencyConversionController>((ref) {
  final currencyRepository = ref.watch(currencyRepositoryProvider);
  return CurrencyConversionController(currencyRepository: currencyRepository);
});

final daysCurrencyConversionsControllerProvider = StateNotifierProvider<
    DaysCurrencyConversionsController,
    AsyncValue<DateCurrencyConversionListEntity>>((ref) {
  final currencyRepository = ref.read(currencyRepositoryProvider);
  return DaysCurrencyConversionsController(
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
  final account = ref.watch(accountControllerProvider).asData?.value;
  final String currencyFrom =
      account != null ? account.prefCurrencyType : "EUR";
  final String currencyTo = currencyFrom == "EUR" ? "USD" : "EUR";
  return SelectedConversionState(
      currencyFrom: currencyFrom, currencyTo: currencyTo);
});
