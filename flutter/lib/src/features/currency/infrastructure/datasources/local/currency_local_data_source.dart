import 'package:balance_home_app/src/core/clients/local_db_client.dart';
import 'package:balance_home_app/src/core/domain/failures/empty_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/core/domain/failures/local_db/no_local_entry_failure.dart';
import 'package:balance_home_app/src/features/currency/domain/entities/currency_type_entity.dart';
import 'package:fpdart/fpdart.dart';

class CurrencyLocalDataSource {
  final LocalDbClient localDbClient;

  static const tableName = "currencyType";

  CurrencyLocalDataSource({required this.localDbClient});

  Future<Either<Failure, void>> putTypes(
      final List<CurrencyTypeEntity> currencyTypeList) async {
    try {
      for (final CurrencyTypeEntity currencyTypeEntity in currencyTypeList) {
        await localDbClient.putById(
            tableName: tableName,
            id: currencyTypeEntity.code,
            content: currencyTypeEntity.toJson());
      }
      return right(null);
    } on Exception {
      return left(const EmptyFailure());
    }
  }

  Future<Either<Failure, List<CurrencyTypeEntity>>> listTypes() async {
    try {
      final jsonObjList = await localDbClient.getAll(tableName: tableName);
      if (jsonObjList.isEmpty) {
        return left(
            const NoLocalEntryFailure(entityName: tableName, detail: ""));
      }
      return right(
          jsonObjList.map((e) => CurrencyTypeEntity.fromJson(e)).toList());
    } on Exception {
      return left(const NoLocalEntryFailure(entityName: tableName, detail: ""));
    }
  }

  Future<Either<Failure, void>> deleteAllTypes() async {
    try {
      await localDbClient.deleteAll(tableName: tableName);
      return right(null);
    } on Exception {
      return left(const EmptyFailure());
    }
  }
}
