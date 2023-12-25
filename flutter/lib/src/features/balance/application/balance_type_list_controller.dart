import 'package:balance_home_app/src/core/domain/failures/http/api_bad_request_failure.dart';
import 'package:balance_home_app/src/features/balance/domain/entities/balance_type_entity.dart';
import 'package:balance_home_app/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balance_home_app/src/features/balance/domain/repositories/balance_type_respository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceTypeListController
    extends StateNotifier<AsyncValue<List<BalanceTypeEntity>>> {
  final BalanceTypeRepositoryInterface balanceTypeRepository;

  BalanceTypeListController(
      {required this.balanceTypeRepository,
      required BalanceTypeEnum balanceTypeEnum})
      : super(const AsyncValue.data([])) {
    get(balanceTypeEnum);
  }

  Future<void> get(final BalanceTypeEnum balanceTypeEnum) async {
    state = const AsyncValue.loading();
    final res = await balanceTypeRepository.getBalanceTypes(balanceTypeEnum);
    state = res.fold(
        (failure) => AsyncValue.error(
            failure is ApiBadRequestFailure ? failure.detail : "",
            StackTrace.empty),
        (value) => AsyncData(value));
  }
}
