import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/version/domain/entities/version_entity.dart';
import 'package:fpdart/fpdart.dart';

/// App info Repository Interface
abstract class VersionRepositoryInterface {
  /// Get current last version
  Future<Either<Failure, VersionEntity>> getVersion();
}