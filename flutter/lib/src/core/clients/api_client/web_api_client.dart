import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

Dio getDefaultClient() => DioForBrowser()
  ..httpClientAdapter = BrowserHttpClientAdapter(withCredentials: true);
