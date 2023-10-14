import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/api_bad_request_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/http_connection_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/local_db/no_local_entry_failure.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/currency_type_entity.dart';
import 'package:balance_home_app/src/features/currency/domain/repositories/currency_repository_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

class CurrencyTypeListController extends StateNotifier<
    AsyncValue<Either<Failure, List<CurrencyTypeEntity>>>> {
  final CurrencyRepositoryInterface currencyRepository;

  CurrencyTypeListController({required this.currencyRepository})
      : super(const AsyncValue.loading()) {
    handle();
  }

  @visibleForTesting
  Future<void> handle() async {
    final res = await currencyRepository.getCurrencyTypes();
    state = res.fold((failure) {
      if (failure is HttpConnectionFailure ||
          failure is NoLocalEntryFailure ||
          failure is ApiBadRequestFailure) {
        return AsyncData(left(failure));
      }
      return AsyncValue.error(failure.detail, StackTrace.empty);
    }, (value) => AsyncData(right(value)));
  }
}
