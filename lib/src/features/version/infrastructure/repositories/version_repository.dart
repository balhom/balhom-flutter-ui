import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/features/version/domain/repositories/version_repository_interface.dart';
import 'package:balhom/src/features/version/domain/entities/version_entity.dart';
import 'package:balhom/src/features/version/infrastructure/datasources/remote/version_remote_data_source.dart';
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
