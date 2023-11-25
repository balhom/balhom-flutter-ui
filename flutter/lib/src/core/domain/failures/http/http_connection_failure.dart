import 'package:balance_home_app/src/core/domain/failures/http/http_request_failure.dart';

/// Represents Http connection error
class HttpConnectionFailure extends HttpRequestFailure {
  const HttpConnectionFailure({required super.detail}) : super(statusCode: -1);
}
