import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:balhom/src/features/auth/domain/failures/reset_password_failure.dart';
import 'package:balhom/src/features/auth/domain/repositories/reset_password_repository_interface.dart';
import 'package:balhom/src/features/auth/domain/values/email_value.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordController extends StateNotifier<AsyncValue<void>> {
  final ResetPasswordRepositoryInterface resetPasswordRepository;

  ResetPasswordController({required this.resetPasswordRepository})
      : super(const AsyncValue.data(null));

  Future<Either<Failure, void>> sendEmail(
      final EmailValue email, final AppLocalizations appLocalizations) async {
    state = const AsyncValue.loading();
    return await email.value.fold((failure) {
      state = const AsyncValue.data(null);
      return left(failure);
    }, (email) async {
      final res = await resetPasswordRepository.sendEmail(email);
      state = const AsyncValue.data(null);
      return res.fold((failure) {
        return left(
            ResetPasswordFailure.fromFailure(failure, appLocalizations));
      }, (_) {
        return right(null);
      });
    });
  }
}
