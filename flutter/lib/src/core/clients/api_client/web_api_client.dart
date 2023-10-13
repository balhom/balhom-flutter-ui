import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

Dio getDefaultClient() =>
    Dio()..httpClientAdapter = BrowserHttpClientAdapter(withCredentials: true);
