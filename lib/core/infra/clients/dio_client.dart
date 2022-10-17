import 'package:dashboard_tbl/core/interfaces/clients/client_http.dart';
import 'package:dio/dio.dart';

class DioClient extends ClientHttp {
  static const String _url = "http://robertferreira.ddns.net";
  static const int _port = 17000;
  late Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: '$_url:$_port',
      ),
    );
  }

  @override
  Future get(
    String url, {
    Map<String, String>? queryParameters,
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