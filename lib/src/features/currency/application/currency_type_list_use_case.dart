import 'package:balhom/src/features/currency/domain/entities/currency_type_entity.dart';
import 'package:balhom/src/features/currency/domain/repositories/currency_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencyTypeListUseCase
    extends StateNotifier<AsyncValue<List<CurrencyTypeEntity>>> {
  final CurrencyRepositoryInterface currencyRepository;

  CurrencyTypeListUseCase({required this.currencyRepository})
      : super(const AsyncValue.loading()) {
    handle();
  }

  Future<void> handle() async {
    final res = await currencyRepository.getCurrencyTypes();
    state = res.fold((failure) {
      return AsyncValue.error(failure.detail, StackTrace.empty);
    }, (value) => AsyncData(value));
  }
}
