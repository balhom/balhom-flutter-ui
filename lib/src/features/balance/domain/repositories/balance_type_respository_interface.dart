import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/features/balance/domain/entities/balance_type_entity.dart';
import 'package:balhom/src/features/balance/domain/enums/balance_type_enum.dart';
import 'package:fpdart/fpdart.dart';

/// Balance Type Repository Interface.
abstract class BalanceTypeRepositoryInterface {
  /// Get [BalanceTypeEntity] by `name`.
  Future<Either<Failure, BalanceTypeEntity>> getBalanceType(
      String name, BalanceTypeEnum balanceTypeEnum);

  /// Get a list of all [BalanceTypeEntity].
  Future<Either<Failure, List<BalanceTypeEntity>>> getBalanceTypes(
      BalanceTypeEnum balanceTypeEnum);
}
