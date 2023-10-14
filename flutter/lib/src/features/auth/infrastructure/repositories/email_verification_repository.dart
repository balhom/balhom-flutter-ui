import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/auth/domain/repositories/email_verification_repository_interface.dart';
import 'package:balance_home_app/src/features/auth/infrastructure/datasources/remote/email_verification_remote_data_source.dart';
import 'package:fpdart/fpdart.dart';

class EmailVerificationRepository
    implements EmailVerificationRepositoryInterface {
  final EmailVerificationRemoteDataSource emailVerificationRemoteDataSource;

  EmailVerificationRepository(
      {required this.emailVerificationRemoteDataSource});

  /// Send verification email
  @override
  Future<Either<Failure, void>> sendEmail(String email) async {
    return await emailVerificationRemoteDataSource.sendEmail(email);
  }
}
