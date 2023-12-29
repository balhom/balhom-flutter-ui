import 'package:balhom/src/core/domain/failures/http/api_bad_request_failure.dart';
import 'package:balhom/src/core/domain/failures/http/http_request_failure.dart';
import 'package:balhom/src/core/domain/failures/http/input_bad_request_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universal_io/io.dart';

part 'bad_request_failure.g.dart';

/// Represents 400 request error
@JsonSerializable(fieldRename: FieldRename.snake)
class BadRequestFailure extends HttpRequestFailure {
  const BadRequestFailure({required super.detail})
      : super(statusCode: HttpStatus.badRequest);

  // Serialization
  factory BadRequestFailure.fromJson(final Map<String, dynamic> json) {
    if (json.containsKey("error_code")) {
      return ApiBadRequestFailure.fromJson(json);
    } else if (json.containsKey("fields")) {
      return InputBadRequestFailure.fromJson(json);
    } else if (json.containsKey("detail")) {
      return _$BadRequestFailureFromJson(json);
    }
    return BadRequestFailure.fromObject("");
  }

  factory BadRequestFailure.fromObject(final dynamic object) {
    if (object is String) {
      return BadRequestFailure(detail: object);
    }
    return BadRequestFailure.fromJson(object);
  }
}
