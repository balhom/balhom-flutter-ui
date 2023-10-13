import 'package:balance_home_app/src/core/domain/failures/failure.dart';

/// Represents Http request error
class HttpRequestFailure extends Failure {
  final int statusCode;

  const HttpRequestFailure({required this.statusCode, required super.detail});

  factory HttpRequestFailure.empty() {
    return const HttpRequestFailure(statusCode: -1, detail: "");
  }
}
