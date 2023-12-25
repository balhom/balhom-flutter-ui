import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balhom/src/features/balance/domain/dtos/balance_values_dto.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balhom/src/features/balance/domain/repositories/balance_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BalanceCreateController
    extends StateNotifier<AsyncValue<BalanceEntity?>> {
  final BalanceRepositoryInterface balanceRepository;

  BalanceCreateController({required this.balanceRepository})
      : super(const AsyncValue.data(null));

  Future<Either<Failure, BalanceEntity>> create(
      final BalanceValuesDto balanceValuesDto,
      final AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    return await balanceValuesDto.toEntity().fold((failure) {
      state = const AsyncValue.data(null);
      return left(failure);
    }, (balanceEntity) async {
      final res = await balanceRepository.createBalance(balanceEntity);
      return res.fold((failure) {
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
