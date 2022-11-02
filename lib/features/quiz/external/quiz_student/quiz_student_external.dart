import 'package:dashboard_tbl/features/quiz/models/quiz_model.dart';
import 'package:dashboard_tbl/utils/hasura/helper_extensions.dart';
import 'package:map_fields/map_fields.dart';

import '../../../../core/interfaces/clients/client_http.dart';

class QuizStudentsExternal {
  final ClientHttp _client;

  QuizStudentsExternal(this._client);

  Future<List<QuizModel>> getQuizzes(
    String idUser,
    String idCompany,
    DateTime from,
    DateTime to,
  ) async {
    try {
      final response = await _client.get(
        '/quizzes/user/$idCompany/$idUser',
        queryParameters: {
          'from': from.toDateHasuraWithoutTime(),
          'to': to.toDateHasuraWithoutTime(),
        },
      );

      if (response.statusCode == 200) {
        final map = MapFields.load(response.data);
        final listQuizzes = map.getList<Map<String, dynamic>>('quizzes');
        return listQuizzes.map((e) => QuizModel.fromMap(e)).toList();
      } else {
        final statusCode = response.statusCode;
        final message = response.data;
        if (statusCode == 204) {
          return [];
        }
        throw Exception(
          'Erro ao buscar quizzes -- Status: $statusCode -- Message: $message',
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
