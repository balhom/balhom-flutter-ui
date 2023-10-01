import 'package:balance_home_app/src/core/domain/failures/failure.dart';
import 'package:balance_home_app/src/features/auth/infrastructure/datasources/remote/email_code_remote_data_source.dart';
import 'package:balance_home_app/src/features/auth/domain/entities/email_code_entity.dart';
import 'package:balance_home_app/src/features/auth/domain/repositories/email_code_repository_interface.dart';
import 'package:fpdart/fpdart.dart';

class EmailCodeRepository implements EmailCodeRepositoryInterface {
  final EmailCodeRemoteDataSource emailCodeRemoteDataSource;

  EmailCodeRepository({required this.emailCodeRemoteDataSource});

  /// Request email code by `email`.
  @override
  Future<Either<Failure, void>> requestCode(String email) async {
    return await emailCodeRemoteDataSource.request(email);
  }

  /// Request email code verification.
  @override
  Future<Either<Failure, void>> verifyCode(EmailCodeEntity entity) async {
    return await emailCodeRemoteDataSource.verify(entity);
  }
}
