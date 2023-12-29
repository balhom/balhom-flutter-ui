import 'package:balhom/src/features/currency/domain/entities/date_currency_conversion_list_entity.dart';
import 'package:balhom/src/features/currency/domain/repositories/currency_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DaysCurrencyConversionsUseCase
    extends StateNotifier<AsyncValue<DateCurrencyConversionListEntity>> {
  final CurrencyRepositoryInterface currencyRepository;

  DaysCurrencyConversionsUseCase({
    required this.currencyRepository,
  }) : super(const AsyncValue.loading());

  Future<void> handle(final int days) async {
    final dailyStatistics =
        await currencyRepository.getDaysCurrencyConversions(days: days);
    state = await dailyStatistics.fold((failure) {
      return AsyncValue.error(failure.detail, StackTrace.empty);
    }, (dateBalanceList) async {
      return AsyncValue.data(dateBalanceList);
    });
  }
}
