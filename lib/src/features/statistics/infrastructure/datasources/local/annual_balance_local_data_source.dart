import 'package:balhom/src/core/clients/local_db_client.dart';
import 'package:balhom/src/core/domain/failures/empty_failure.dart';
import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/domain/failures/local_db/no_local_entry_failure.dart';
import 'package:balhom/src/features/statistics/domain/entities/annual_balance_entity.dart';
import 'package:fpdart/fpdart.dart';

class AnnualBalanceLocalDataSource {
  final LocalDbClient localDbClient;

  static const tableName = "annualBalance";

  AnnualBalanceLocalDataSource({required this.localDbClient});

  Future<Either<Failure, AnnualBalanceEntity>> get(int year) async {
    try {
      final jsonObj = await localDbClient.getById(
          tableName: tableName, id: year.toString());
      if (jsonObj == null) {
        return left(
            const NoLocalEntryFailure(entityName: tableName, detail: ""));
      }
      return right(AnnualBalanceEntity.fromJson(jsonObj));
    } on Exception {
      return left(const NoLocalEntryFailure(entityName: tableName, detail: ""));
    }
  }

  Future<Either<Failure, void>> put(AnnualBalanceEntity annualBalance) async {
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

  Future<Either<Failure, List<AnnualBalanceEntity>>> list() async {
    try {
      final jsonObjList = await localDbClient.getAll(tableName: tableName);
      if (jsonObjList.isEmpty) {
        return left(
            const NoLocalEntryFailure(entityName: tableName, detail: ""));
      }
      return right(
          jsonObjList.map((e) => AnnualBalanceEntity.fromJson(e)).toList());
    } on Exception {
      return left(const NoLocalEntryFailure(entityName: tableName, detail: ""));
    }
  }

  Future<Either<Failure, void>> deleteAll() async {
    try {
      await localDbClient.deleteAll(tableName: tableName);
      return right(null);
    } on Exception {
      return left(const EmptyFailure());
    }
  }
}
