import 'package:balhom/src/core/domain/failures/unprocessable_value_failure.dart';
import 'package:balhom/src/features/account/domain/repositories/account_repository_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountUpdateImageUseCase extends StateNotifier<AsyncValue<void>> {
  final AccountRepositoryInterface accountRepository;

  AccountUpdateImageUseCase({required this.accountRepository})
      : super(const AsyncValue.data(null));

  Future<void> handle(final Uint8List imageBytes, final String imageType,
      final AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    final res = await accountRepository.updateImage(imageBytes, imageType);
    res.fold((_) {
      state = AsyncValue.error(
          InvalidValueFailure(detail: appLocalizations.accountEditImageError),
          StackTrace.empty);
    }, (value) {
      state = const AsyncValue.data(null);
    });
  }
}
