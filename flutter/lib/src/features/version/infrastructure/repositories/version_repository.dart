import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/version/domain/repositories/version_repository_interface.dart';
import 'package:balance_home_app/src/features/version/domain/entities/version_entity.dart';
import 'package:balance_home_app/src/features/version/infrastructure/datasources/remote/version_remote_data_source.dart';
import 'package:fpdart/fpdart.dart';

class VersionRepository extends VersionRepositoryInterface {
  final VersionRemoteDataSource appVersionRemoteDataSource;

  VersionRepository({required this.appVersionRemoteDataSource});

  /// Get app current last version
  @override
  Future<Either<Failure, VersionEntity>> getVersion() async {
    return await appVersionRemoteDataSource.get();
  }
}
