import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Mobile API Client
Dio getDefaultClient() => Dio()
  ..interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      final cookies = (await SharedPreferences.getInstance()).get('cookies');
      if (cookies != null) {
        options.headers['cookie'] = cookies;
      }
      return handler.next(options);
    },
    onResponse: (response, handler) {
      response.headers.forEach(
          (final String headerName, final List<String> headerValues) async {
        // If header is cookie type
        if (headerName == HttpHeaders.setCookieHeader) {
          final cookieMap = <String, String>{};

          for (var cookie in headerValues) {
            final key = cookie.substring(0, cookie.indexOf('='));
            final value = cookie.substring(key.length + 1, cookie.indexOf(';'));

            cookieMap[key] = value;
          }

          String cookiesFormatted = '';
          cookieMap
              .forEach((key, value) => cookiesFormatted += '$key=$value; ');

          await (await SharedPreferences.getInstance())
              .setString('cookies', cookiesFormatted);
        }
      });
      return handler.next(response);
    },
  ));
