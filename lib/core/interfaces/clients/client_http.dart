abstract class ClientHttp {
  Future<dynamic> get(String url, {Map<String, String>? queryParameters});
  Future<dynamic> post(String url, {dynamic body});
}
