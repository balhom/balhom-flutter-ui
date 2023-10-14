import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/auth/infrastructure/datasources/remote/reset_password_remote_data_source.dart';
import 'package:balance_home_app/src/features/auth/domain/repositories/reset_password_repository_interface.dart';
import 'package:fpdart/fpdart.dart';

class ResetPasswordRepository implements ResetPasswordRepositoryInterface {
  final ResetPasswordRemoteDataSource resetPasswordRemoteDataSource;

  ResetPasswordRepository({required this.resetPasswordRemoteDataSource});

  /// Send reset password email
  @override
  Future<Either<Failure, void>> sendEmail(String email) async {
    return await resetPasswordRemoteDataSource.sendEmail(email);
  }
}
