import 'package:dashboard_tbl/features/quiz/models/quiz_model.dart';
import 'package:dashboard_tbl/utils/hasura/helper_extensions.dart';
import 'package:map_fields/map_fields.dart';

import '../../../../core/infra/global/user_global.dart';
import '../../../../core/interfaces/clients/client_http.dart';
import '../../models/answer/answer_student.dart';

class QuizStudentsExternal {
  final ClientHttp _client;

  QuizStudentsExternal(this._client);

  Future<List<QuizModel>> getQuizzes(
    String idUser,
    bool answered,
    DateTime from,
    DateTime to,
  ) async {
    try {
      final response = await _client.get(
        '/user/quizzes/$idUser',
        queryParameters: {
          'dateI': from.toDateHasuraWithoutTime(),
          'dateF': to.toDateHasuraWithoutTime(),
          'answered': answered,
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

  Future<bool> insertAnswersUSer(List<AnswerStudent> answers) async {
    try {
      final userLogged = UserGlobal.instance.user;
      final listAnswers = answers
          .map<Map<String, dynamic>>(
            (e) => {
              'id_answer': e.id,
              'id_user': userLogged.id,
              'id_company': userLogged.idCompany,
              'score_answer': e.pointSelect,
              'scored_score': e.scoreValid,
            },
          )
          .toList();

      final response = await _client.post(
        '/quizzes/answers/users',
        body: {
          'answers': listAnswers,
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return true;
      } else {
        final statusCode = response.statusCode;
        final message = response.data;
        throw Exception(
          'Erro ao inserir respostas -- Status: $statusCode -- Message: $message',
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateQuizAnswered(String idQuiz, String idGroup) async {
    try {
      final body = {
        'id_quiz': idQuiz,
        'id_group': idGroup,
      };

      final response = await _client.post('/quizzes/answers/users', body: body);

      if (response.statusCode == 200) {
        return true;
      } else {
        final statusCode = response.statusCode;
        final message = response.data;
        throw Exception(
          'Erro ao inserir respostas -- Status: $statusCode -- Message: $message',
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
