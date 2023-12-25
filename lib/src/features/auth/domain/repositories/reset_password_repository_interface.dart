import 'package:balhom/src/core/domain/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

/// Forgot Password Repository Interface
abstract class ResetPasswordRepositoryInterface {
  Future<Either<Failure, void>> sendEmail(String email);
}
