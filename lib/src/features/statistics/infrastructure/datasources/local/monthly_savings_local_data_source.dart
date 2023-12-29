import 'package:balhom/src/core/clients/local_db_client.dart';
import 'package:balhom/src/core/domain/failures/empty_failure.dart';
import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/domain/failures/local_db/no_local_entry_failure.dart';
import 'package:balhom/src/features/statistics/domain/entities/monthly_saving_entity.dart';
import 'package:fpdart/fpdart.dart';

class MonthlySavingLocalDataSource {
  final LocalDbClient localDbClient;

  static const tableName = "monthlySavings";

  MonthlySavingLocalDataSource({required this.localDbClient});

  Future<Either<Failure, void>> put(MonthlySavingEntity monthlyBalance) async {
    try {
      final jsonId =
          "${monthlyBalance.month.toString()}_${monthlyBalance.year.toString()}";
      await localDbClient.putById(
          tableName: tableName, id: jsonId, content: monthlyBalance.toJson());
      return right(null);
    } on Exception {
      return left(const EmptyFailure());
    }
  }

  Future<Either<Failure, List<MonthlySavingEntity>>> list(
      {required int? year}) async {
    try {
      final jsonObjList = await localDbClient.getAll(tableName: tableName);
      if (jsonObjList.isEmpty) {
        return left(
            const NoLocalEntryFailure(entityName: tableName, detail: ""));
      }
      final resList = <MonthlySavingEntity>[];
      for (final jsonObj in jsonObjList) {
        final monthlyBalance = MonthlySavingEntity.fromJson(jsonObj);
        if (year == null || monthlyBalance.year == year) {
          resList.add(monthlyBalance);
        }
      }
      return right(resList);
    } on Exception {
      return left(const NoLocalEntryFailure(entityName: tableName, detail: ""));
    }
  }
}
