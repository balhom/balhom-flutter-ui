import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/api_bad_request_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/http_connection_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/local_db/no_local_entry_failure.dart';
import 'package:balance_home_app/src/core/presentation/models/selected_date.dart';
import 'package:balance_home_app/src/features/balance/domain/entities/balance_entity.dart';
import 'package:balance_home_app/src/features/balance/domain/enums/balance_sorting_enum.dart';
import 'package:balance_home_app/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:balance_home_app/src/features/balance/domain/repositories/balance_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

class BalanceListController
    extends StateNotifier<AsyncValue<Either<Failure, List<BalanceEntity>>>> {
  final BalanceRepositoryInterface balanceRepository;
  final SelectedDateDto selectedDateDto;

  BalanceListController(
      {required this.balanceRepository, required this.selectedDateDto})
      : super(AsyncValue.data(right([])));

  Future<void> getBalances(final BalanceTypeEnum balanceTypeEnum,
      final BalanceSortingEnum balanceSortingEnum, final int page) async {
    state = const AsyncValue.loading();
    final res = await balanceRepository.getBalances(
        dateFrom: selectedDateDto.dateFrom,
        dateTo: selectedDateDto.dateTo,
        balanceTypeEnum: balanceTypeEnum,
        balanceSortingEnum: balanceSortingEnum,
        page: page);
    state = res.fold((failure) {
      if (failure is HttpConnectionFailure ||
          failure is NoLocalEntryFailure ||
          failure is ApiBadRequestFailure) {
        return AsyncData(left(failure));
      }
      return AsyncValue.error(failure.detail, StackTrace.empty);
    }, (entities) {
      return AsyncValue.data(right(entities));
    });
  }

  /// Add an entity to list
  void addBalance(final BalanceEntity entity) {
    // No need to use repository,
    // it will be used by Create Controller
    if (state.value != null) {
      state.value!.fold((_) {}, (entities) {
        entities.add(entity);
        state = AsyncValue.data(right(entities));
      });
    } else {
      state = AsyncValue.data(right([entity]));
    }
  }

  /// Update an entity of the list
  void updateBalance(final BalanceEntity entity) {
    // No need to use repository,
    // it will be used by Edit Controller
    if (state.value != null) {
      state.value!.fold((_) {}, (entities) {
        final i = entities.indexWhere((element) => element.id == entity.id);
        if (i != -1) {
          entities
            ..removeAt(i)
            ..insert(i, entity);
        }
        state = AsyncValue.data(right(entities));
      });
    } else {
      state = AsyncValue.data(right([entity]));
    }
  }

  /// Delete an entity of the list
  void deleteBalance(final BalanceEntity entity) {
    if (state.value != null) {
      state.value!.fold((_) {}, (entities) {
        entities.remove(entity);
        balanceRepository.deleteBalance(entity);
        state = AsyncValue.data(right(entities));
      });
    }
  }

  /// Get a list of years of stored balances
  Future<List<int>> getAllBalanceYears(
      final BalanceTypeEnum balanceTypeEnum) async {
    final res = await balanceRepository.getBalanceYears(balanceTypeEnum);
    return res.fold((_) => [], (value) => value);
  }
}
