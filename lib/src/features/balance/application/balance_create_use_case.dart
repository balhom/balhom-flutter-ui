import 'package:balhom/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balhom/src/features/balance/domain/dtos/balance_values_dto.dart';
import 'package:balhom/src/features/balance/domain/repositories/balance_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BalanceCreateUseCase extends StateNotifier<AsyncValue<void>> {
  final BalanceRepositoryInterface balanceRepository;

  BalanceCreateUseCase({required this.balanceRepository})
      : super(const AsyncValue.data(null));

  Future<void> handle(final BalanceValuesDto balanceValuesDto,
      final AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    await balanceValuesDto.toEntity().fold<Future<void>>((failure) async {
      state = AsyncValue.error(failure, StackTrace.empty);
    }, (balanceEntity) async {
      final res = await balanceRepository.createBalance(balanceEntity);
      res.fold((failure) {
        state = AsyncValue.error(
            InvalidValueFailure(detail: appLocalizations.genericError),
            StackTrace.empty);
      }, (_) {
        state = const AsyncValue.data(null);
      });
    });
  }
}
