import '../../../core/interfaces/clients/client_http.dart';

class QuizExternal {
  final ClientHttp _client;

  QuizExternal(this._client);

  Future<void> getQuizzes() async {
    await _client.get('/quizzes');
  }
}
