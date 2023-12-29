import 'package:balhom/src/core/domain/failures/http/http_request_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universal_io/io.dart';

part 'unauthorized_request_failure.g.dart';

/// Represent 401 request error
@JsonSerializable(fieldRename: FieldRename.snake)
class UnauthorizedRequestFailure extends HttpRequestFailure {
  const UnauthorizedRequestFailure({super.detail = ""})
      : super(statusCode: HttpStatus.unauthorized);

  // Serialization
  factory UnauthorizedRequestFailure.fromJson(Map<String, dynamic> json) =>
      _$UnauthorizedRequestFailureFromJson(json);

  factory UnauthorizedRequestFailure.fromObject(final dynamic object) {
    if (object is String) {
      return UnauthorizedRequestFailure(detail: object);
    }
    return UnauthorizedRequestFailure.fromJson(object);
  }
}
