import 'package:balance_home_app/src/core/providers.dart';
import 'package:balance_home_app/src/features/version/application/version_controller.dart';
import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/version/domain/dtos/app_version_dto.dart';
import 'package:balance_home_app/src/features/version/domain/repositories/version_repository_interface.dart';
import 'package:balance_home_app/src/features/version/infrastructure/datasources/remote/version_remote_data_source.dart';
import 'package:balance_home_app/src/features/version/infrastructure/repositories/version_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

///
/// Infrastructure dependencies
///

final appInfoRepositoryProvider = Provider<VersionRepositoryInterface>((ref) {
  return VersionRepository(
      appVersionRemoteDataSource:
          VersionRemoteDataSource(apiClient: ref.read(balhomApiClientProvider)));
});

///
/// Application dependencies
///

final versionController = StateNotifierProvider<AppVersionController,
    AsyncValue<Either<Failure, AppVersionDto>>>((ref) {
  final repo = ref.read(appInfoRepositoryProvider);
  return AppVersionController(repository: repo);
});
