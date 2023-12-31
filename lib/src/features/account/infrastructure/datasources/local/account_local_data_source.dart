import 'package:balhom/src/core/clients/local_db_client.dart';
import 'package:balhom/src/core/domain/failures/empty_failure.dart';
import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/core/domain/failures/local_db/no_local_entry_failure.dart';
import 'package:balhom/src/features/account/domain/entities/account_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';

class UserLocalDataSource {
  @visibleForTesting
  final LocalDbClient localDbClient;
  static const tableName = "user";
  @visibleForTesting
  final userId = "profile";

  /// Default constructor
  UserLocalDataSource({required this.localDbClient});

  Future<Either<Failure, AccountEntity>> get() async {
    try {
      final jsonObj =
          await localDbClient.getById(tableName: tableName, id: userId);
      if (jsonObj == null) {
        return left(
            const NoLocalEntryFailure(entityName: tableName, detail: ""));
      }
      return right(AccountEntity.fromJson(jsonObj));
    } on Exception {
      return left(
          const NoLocalEntryFailure(entityName: tableName, detail: ""));
    }
  }

  Future<Either<Failure, void>> put(AccountEntity user) async {
    try {
      await localDbClient.putById(
          tableName: tableName, id: userId, content: user.toJson());
      return right(null);
    } on Exception {
      return left(const EmptyFailure());
    }
  }

  Future<Either<Failure, void>> delete() async {
    try {
      await localDbClient.clearAllTables();
      return right(null);
    } on Exception {
      return left(const EmptyFailure());
    }
  }
}
