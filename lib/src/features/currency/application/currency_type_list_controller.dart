import 'package:balhom/src/features/currency/domain/entities/currency_type_entity.dart';
import 'package:balhom/src/features/currency/domain/repositories/currency_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencyTypeListController
    extends StateNotifier<AsyncValue<List<CurrencyTypeEntity>>> {
  final CurrencyRepositoryInterface currencyRepository;

  CurrencyTypeListController({required this.currencyRepository})
      : super(const AsyncValue.loading()) {
    get();
  }

  Future<void> get() async {
    final res = await currencyRepository.getCurrencyTypes();
    state = res.fold((failure) {
      return AsyncValue.error(failure.detail, StackTrace.empty);
    }, (value) => AsyncData(value));
  }
}
