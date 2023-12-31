import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

/// Email Verification Repository Interface
abstract class EmailVerificationRepositoryInterface {
  Future<Either<Failure, void>> sendEmail(String email);
}
