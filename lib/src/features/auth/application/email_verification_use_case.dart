import 'package:balhom/src/features/auth/domain/failures/email_verification_failure.dart';
import 'package:balhom/src/features/auth/domain/repositories/email_verification_repository_interface.dart';
import 'package:balhom/src/features/auth/domain/values/email_value.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailVerificationUseCase extends StateNotifier<AsyncValue<void>> {
  final EmailVerificationRepositoryInterface emailVerificationRepository;

  EmailVerificationUseCase({required this.emailVerificationRepository})
      : super(const AsyncValue.data(null));

  /// Send mail for account email verification
  Future<void> handle(
      final EmailValue email, final AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    await email.value.fold((failure) async {
      state = AsyncValue.error(failure, StackTrace.empty);
    }, (email) async {
      final res = await emailVerificationRepository.sendEmail(email);
      res.fold((failure) {
        state = AsyncValue.error(
            EmailVerificationFailure.fromFailure(failure, appLocalizations),
            StackTrace.empty);
      }, (_) {
        state = const AsyncValue.data(null);
      });
    });
  }
}
