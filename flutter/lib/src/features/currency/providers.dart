import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/providers.dart';
import 'package:balance_home_app/src/features/currency/application/currency_conversion_controller.dart';
import 'package:balance_home_app/src/features/currency/application/currency_type_list_controller.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/currency_type_entity.dart';
import 'package:balance_home_app/src/features/currency/domain/repositories/currency_repository_interface.dart';
import 'package:balance_home_app/src/features/currency/infrastructure/datasources/remote/currency_remote_data_source.dart';
import 'package:balance_home_app/src/features/currency/infrastructure/repositories/currency_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

///
/// Application dependencies
///

final currencyTypeListsControllerProvider = StateNotifierProvider<
    CurrencyTypeListController,
    AsyncValue<Either<Failure, List<CurrencyTypeEntity>>>>((ref) {
  final currencyRepository = ref.watch(currencyRepositoryProvider);
  return CurrencyTypeListController(currencyRepository: currencyRepository);
});

final currencyConversionControllerProvider =
    Provider<CurrencyConversionController>((ref) {
  final currencyRepository = ref.watch(currencyRepositoryProvider);
  return CurrencyConversionController(currencyRepository: currencyRepository);
});

///
/// Infrastructure dependencies
///

/// Currency repository
final currencyRepositoryProvider = Provider<CurrencyRepositoryInterface>(
    (ref) => CurrencyRepository(
        currencyRemoteDataSource: CurrencyRemoteDataSource(
            apiClient: ref.read(balhomApiClientProvider))));
