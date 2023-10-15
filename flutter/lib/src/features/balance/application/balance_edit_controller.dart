import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balance_home_app/src/features/balance/domain/dtos/balance_values_dto.dart';
import 'package:balance_home_app/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balance_home_app/src/features/balance/domain/repositories/balance_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BalanceEditController extends StateNotifier<AsyncValue<BalanceEntity?>> {
  final BalanceRepositoryInterface balanceRepository;

  BalanceEditController({required this.balanceRepository})
      : super(const AsyncValue.data(null));

  Future<Either<Failure, BalanceEntity>> update(
      final BalanceValuesDto balanceValuesDto,
      final AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    return await balanceValuesDto.toEntity().fold((failure) {
      state = const AsyncValue.data(null);
      return left(failure);
    }, (balanceEntity) async {
      final res = await balanceRepository.updateBalance(balanceEntity);
      return res.fold((_) {
        state = const AsyncValue.data(null);
        return left(
            UnprocessableValueFailure(detail: appLocalizations.genericError));
      }, (value) {
        state = AsyncValue.data(value);
        return right(value);
      });
    });
  }
}
