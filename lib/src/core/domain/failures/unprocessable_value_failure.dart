import 'package:balhom/src/core/domain/failures/failure.dart';

///  Expected value has invalid format
class UnprocessableValueFailure extends Failure {
  const UnprocessableValueFailure({required super.detail});
}
