import 'package:balhom/src/core/providers.dart';
import 'package:balhom/src/features/version/application/version_use_case.dart';
import 'package:balhom/src/features/version/domain/dtos/app_version_dto.dart';
import 'package:balhom/src/features/version/domain/repositories/version_repository_interface.dart';
import 'package:balhom/src/features/version/infrastructure/datasources/remote/version_remote_data_source.dart';
import 'package:balhom/src/features/version/infrastructure/repositories/version_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// Infrastructure dependencies
///

final appInfoRepositoryProvider = Provider<VersionRepositoryInterface>((ref) {
  return VersionRepository(
      appVersionRemoteDataSource: VersionRemoteDataSource(
          apiClient: ref.read(balhomApiClientProvider)));
});

///
/// Application dependencies
///

final versionUseCase =
    StateNotifierProvider<AppVersionUseCase, AsyncValue<AppVersionDto>>((ref) {
  final repo = ref.read(appInfoRepositoryProvider);
  return AppVersionUseCase(repository: repo);
});
