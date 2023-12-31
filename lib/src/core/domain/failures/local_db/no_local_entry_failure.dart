import 'package:balhom/src/core/domain/failures/failure.dart';

/// Represents an unexistant entity stored failure
class NoLocalEntryFailure extends Failure {
  final String entityName;

  const NoLocalEntryFailure({required this.entityName, required super.detail});
}
