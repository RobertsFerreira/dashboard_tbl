abstract class ClientHttp {
  Future<dynamic> get(String url, {Map<String, dynamic> queryParameters});
  Future<dynamic> post(String url, {dynamic body});
}
