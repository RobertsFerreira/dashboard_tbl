import 'dart:io';

import 'package:dashboard_tbl/core/interfaces/clients/client_http.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient extends ClientHttp {
  String _url = '';

  // "http://localhost" :
  // "http://robertferreira.ddns.net";
  static const int _port = 17000;
  late Dio _dio;

  DioClient() {
    if (kIsWeb) {
      _url = 'http://robertferreira.ddns.net';
    } else {
      _url = Platform.isLinux
          ? "http://localhost"
          : "http://http://robertferreira.ddns.net";
    }

    _dio = Dio(
      BaseOptions(
        baseUrl: '$_url:$_port',
      ),
    );
  }

  @override
  Future get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _dio.get(
        url,
        queryParameters: queryParameters,
      );
      return result;
    } on DioError {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future post(String url, {dynamic body}) async {
    try {
      final result = await _dio.post(url, data: body);
      return result;
    } on DioError {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
