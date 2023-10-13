import 'package:balance_home_app/src/features/account/application/account_controller.dart';
import 'package:balance_home_app/src/features/currency/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// Application dependencies
///

final accountEditControllerProvider =
    StateNotifierProvider<AccountController, AsyncValue<void>>((ref) {
  final accountRepo = ref.read(accountRepositoryProvider);
  final currencyConversionRepo = ref.read(currencyConversionRepositoryProvider);
  return AccountController(
      accountRepository: accountRepo,
      currencyConversionRepository: currencyConversionRepo);
});
