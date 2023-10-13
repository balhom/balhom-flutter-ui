import 'package:balance_home_app/src/core/domain/failures/http/bad_request_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/http_connection_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/http_request_failure.dart';
import 'package:balance_home_app/src/core/domain/failures/http/unauthorized_request_failure.dart';
import 'package:balance_home_app/src/core/providers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http_parser/http_parser.dart';
import 'package:universal_io/io.dart';

import 'get_default_api_client.dart'
    if (dart.library.io) 'mobile_api_client.dart'
    if (dart.library.html) 'web_net_config.dart';

const unknownStatusCode = -1;

/// The `ApiClient` class is responsible for managing the connection
/// and making REST API requests.
class ApiClient {
  late final Dio dioClient;

  ApiClient({required String baseUrl}) {
    dioClient = getDefaultClient()
      ..options = BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 6),
          receiveTimeout: const Duration(seconds: 6),
          sendTimeout: const Duration(seconds: 6),
          followRedirects: false,
          validateStatus: (status) => true,
          headers: {
            HttpHeaders.contentTypeHeader: ContentType.json.toString(),
            HttpHeaders.acceptHeader: ContentType.json.toString(),
            HttpHeaders.acceptLanguageHeader: "en"
          });
  }

  void setHeader(String key, String value) async {
    dioClient.options.headers[key] = value;
  }

  void removeHeader(String key) async {
    if (dioClient.options.headers.containsKey(key)) {
      dioClient.options.headers.remove(key);
    }
  }

  /// Handles the HTTP status codes of the responses.
  /// Returns the correct Failures or, in case it went well, returns the response itself.
  ///
  /// HTTP status codes cases:
  /// * 20X code: `Response`
  /// * 400 code: `BadRequestFailure`
  /// * 401 code: `UnauthorizedRequestFailure`
  /// * Other: `HttpRequestFailure`
  Either<HttpRequestFailure, Response> _checkFailureOrResponse(
      final Response response) {
    connectionStateListenable.value = true;
    switch (response.statusCode) {
      case 200:
      case 201:
      case 204:
        return right(response);
      case 400:
        return left(BadRequestFailure.fromObject(response.data));
      case 401:
        return left(UnauthorizedRequestFailure.fromObject(response.data));
    }
    debugPrint("[HTTP CHECK] Unknown HttpFailure: ${response.data}");
    return left(HttpRequestFailure(
        detail: '', statusCode: response.statusCode ?? unknownStatusCode));
  }

  /// Handles exceptions thrown by connection errors.
  ///
  /// Updates the connection state as disabled (`false`)
  HttpConnectionFailure _handleConnectionError(final Exception error) {
    debugPrint("[HTTP ERROR] $error");
    connectionStateListenable.value = false;
    return HttpConnectionFailure(detail: error.toString());
  }

  /// Performs a GET request to the API with the provided path.
  /// Path should not include the base url of the server.
  ///
  /// Returns either a HTTP failure or a HTTP response.
  Future<Either<HttpRequestFailure, Response>> getRequest(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dioClient.get(path, queryParameters: queryParameters);
      return _checkFailureOrResponse(response);
    } on Exception catch (error) {
      return left(_handleConnectionError(error));
    }
  }

  /// Performs a POST request to the API with the provided path and data.
  /// Path should not include the base url of the server.
  ///
  /// Returns either a HTTP failure or a HTTP response.
  Future<Either<HttpRequestFailure, Response>> postRequest(String path,
      {Object? data}) async {
    try {
      final response = await dioClient.post(path, data: data);
      return _checkFailureOrResponse(response);
    } on Exception catch (error) {
      return left(_handleConnectionError(error));
    }
  }

  /// Performs a PUT request to the API with the provided path and data.
  /// Path should not include the base url of the server.
  ///
  /// Returns either a HTTP failure or a HTTP response.
  Future<Either<HttpRequestFailure, Response>> putRequest(String path,
      {Object? data}) async {
    try {
      final response = await dioClient.put(path, data: data);
      return _checkFailureOrResponse(response);
    } on Exception catch (error) {
      return left(_handleConnectionError(error));
    }
  }

  /// Performs a PATCH request to the API with the provided path and data.
  /// Path should not include the base url of the server.
  ///
  /// Returns either a HTTP failure or a HTTP response.
  Future<Either<HttpRequestFailure, Response>> patchRequest(String path,
      {Object? data}) async {
    try {
      final response = await dioClient.patch(path, data: data);
      return _checkFailureOrResponse(response);
    } on Exception catch (error) {
      return left(_handleConnectionError(error));
    }
  }

  /// Performs a PATCH image request to the API with the provided path,
  /// image bytes and image mime type.
  /// Path should not include the base url of the server.
  ///
  /// Returns either a HTTP failure or a HTTP response.
  Future<Either<HttpRequestFailure, Response>> putImageRequest(
      String path, Uint8List bytes, String type) async {
    final FormData data = FormData.fromMap({
      "image": MultipartFile.fromBytes(bytes,
          filename: 'upload_image.${type.split("/").last}',
          contentType: MediaType("image", type)),
    });
    return await putRequest(path, data: data);
  }

  /// Performs a DEL request to the API with the provided path.
  /// Path should not include the base url of the server.
  ///
  /// Returns either a HTTP failure or a HTTP response.
  Future<Either<HttpRequestFailure, Response>> delRequest(String path) async {
    try {
      final response = await dioClient.delete(path);
      return _checkFailureOrResponse(response);
    } on Exception catch (error) {
      return left(_handleConnectionError(error));
    }
  }
}