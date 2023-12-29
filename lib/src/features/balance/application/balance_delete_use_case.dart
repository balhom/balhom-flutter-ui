import 'package:balhom/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balhom/src/features/balance/domain/repositories/balance_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BalanceDeleteUseCase extends StateNotifier<AsyncValue<void>> {
  final BalanceRepositoryInterface balanceRepository;

  BalanceDeleteUseCase({required this.balanceRepository})
      : super(const AsyncValue.data(null));

  Future<void> handle(
      final int id, final AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    final res = await balanceRepository.deleteBalance(id);
    res.fold((_) {
      state = AsyncValue.error(
          InvalidValueFailure(detail: appLocalizations.genericError),
          StackTrace.empty);
    }, (value) {
      state = const AsyncValue.data(null);
    });
  }
}
