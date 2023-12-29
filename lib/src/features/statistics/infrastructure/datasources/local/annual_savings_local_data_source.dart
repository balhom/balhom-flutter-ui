import 'package:balhom/src/core/clients/local_db_client.dart';
import 'package:balhom/src/core/domain/failures/empty_failure.dart';
import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/domain/failures/local_db/no_local_entry_failure.dart';
import 'package:balhom/src/features/statistics/domain/entities/annual_saving_entity.dart';
import 'package:fpdart/fpdart.dart';

class AnnualSavingsLocalDataSource {
  final LocalDbClient localDbClient;

  static const tableName = "annualSavings";

  AnnualSavingsLocalDataSource({required this.localDbClient});

  Future<Either<Failure, void>> put(AnnualSavingEntity annualBalance) async {
    try {
      final jsonAnnualBalance = annualBalance.toJson();
      await localDbClient.putById(
          tableName: tableName,
          id: annualBalance.year.toString(),
          content: jsonAnnualBalance);
      return right(null);
    } on Exception {
      return left(const EmptyFailure());
    }
  }

  Future<Either<Failure, List<AnnualSavingEntity>>> list() async {
    try {
      final jsonObjList = await localDbClient.getAll(tableName: tableName);
      if (jsonObjList.isEmpty) {
        return left(
            const NoLocalEntryFailure(entityName: tableName, detail: ""));
      }
      return right(
          jsonObjList.map((e) => AnnualSavingEntity.fromJson(e)).toList());
    } on Exception {
      return left(const NoLocalEntryFailure(entityName: tableName, detail: ""));
    }
  }
}
