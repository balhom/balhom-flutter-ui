import 'package:balhom/src/features/auth/domain/failures/reset_password_failure.dart';
import 'package:balhom/src/features/auth/domain/repositories/reset_password_repository_interface.dart';
import 'package:balhom/src/features/auth/domain/values/email_value.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordUseCase extends StateNotifier<AsyncValue<void>> {
  final ResetPasswordRepositoryInterface resetPasswordRepository;

  ResetPasswordUseCase({required this.resetPasswordRepository})
      : super(const AsyncValue.data(null));

  Future<void> handle(
      final EmailValue email, final AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    await email.value.fold((failure) {
      state = AsyncValue.error(failure, StackTrace.empty);
    }, (email) async {
      final res = await resetPasswordRepository.sendEmail(email);
      res.fold((failure) {
        state = AsyncValue.error(
            ResetPasswordFailure.fromFailure(failure, appLocalizations),
            StackTrace.empty);
      }, (_) {
        state = const AsyncValue.data(null);
      });
    });
  }
}
