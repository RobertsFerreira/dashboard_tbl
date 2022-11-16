import 'package:dashboard_tbl/core/infra/global/user_global.dart';
import 'package:dashboard_tbl/features/quiz/models/quiz_model.dart';
import 'package:dashboard_tbl/utils/hasura/helper_extensions.dart';
import 'package:map_fields/map_fields.dart';

import '../../../core/interfaces/clients/client_http.dart';
import '../../group/models/group_model.dart';
import '../models/apelacao/apelacao_model.dart';
import '../models/new_quiz_model.dart';
import '../models/quiz_result/quiz_result.dart';
import '../models/vincule_quiz/vinculo_quiz_model.dart';

class QuizExternal {
  final ClientHttp _client;

  QuizExternal(this._client);

  Future<List<QuizModel>> getQuizzes(
    String idCompany,
  ) async {
    try {
      final idUser = UserGlobal.instance.user.id;
      final response = await _client.get('/quizzes/$idCompany/$idUser');

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

  Future<List<VinculoQuizModel>> getVinculosQuizzes(
    DateTime initDate,
    DateTime finalDate,
    bool answered,
  ) async {
    List<VinculoQuizModel> quizzesVinculos = [];
    try {
      final queryParameters = {
        'data_ini': initDate.toDateHasuraWithoutTime(),
        'data_fim': finalDate.toDateHasuraWithoutTime(),
        'answered': answered,
      };
      final response = await _client.get(
        '/quiz/group/linked',
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        final map = MapFields.load(response.data);
        final listQuizzes = map.getList<Map<String, dynamic>>('quizzes');
        quizzesVinculos =
            listQuizzes.map((e) => VinculoQuizModel.fromMap(e)).toList();
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
    return quizzesVinculos;
  }

  Future<bool> vinculeQuiz(
    String idCompany,
    List<GroupModel> groups,
    String idQuiz,
    DateTime date,
  ) async {
    try {
      final body = {
        'groups': groups.map((e) => e.toMap()).toList(),
        'id_quiz': idQuiz,
        'date': date.toDateHasuraWithoutTime(),
        'id_company': idCompany,
      };
      final response = await _client.post(
        '/quizzes/vincule',
        body: body,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        final statusCode = response.statusCode;
        final message = response.data;
        throw Exception(
          'Erro ao vincular quiz -- Status: $statusCode -- Message: $message',
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> insertQuiz(NewQuizModel quiz) async {
    try {
      if (quiz.isValidQuestions) {
        final json = quiz.toJson();
        final response = await _client.post('/quizzes', body: json);
        if (response.statusCode == 201) {
          return true;
        } else {
          return false;
        }
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<QuizResult>> getAllQuizzesResults(VinculoQuizModel quiz) async {
    List<QuizResult> quizzesResults = <QuizResult>[];
    try {
      final response = await _client.get(
        '/quizzes/result',
        queryParameters: {
          'id_quiz': quiz.id,
        },
      );
      if (response.statusCode == 200) {
        final map = MapFields.load(response.data);
        final listQuizzes = map.getList<Map<String, dynamic>>('quizzes');
        quizzesResults = listQuizzes.map((e) => QuizResult.fromMap(e)).toList();
      } else {
        final statusCode = response.statusCode;
        final message = response.data;
        if (statusCode == 204) {
          return [];
        }
        throw Exception(
          'Erro ao buscar resultados dos quizzes -- Status: $statusCode -- Message: $message',
        );
      }
    } catch (e) {
      rethrow;
    }
    return quizzesResults;
  }

  Future<List<ApelacaoModel>> getApelacoes(String idQuiz, DateTime date) async {
    List<ApelacaoModel> quizzesApelacoes = <ApelacaoModel>[];
    try {
      final response = await _client.get(
        '/apelacao',
        queryParameters: {
          'id_quiz': idQuiz,
          'data': date,
        },
      );
      if (response.statusCode == 200) {
        final map = MapFields.load(response.data);
        final listQuizzes = map.getList<Map<String, dynamic>>('apelacoes');
        quizzesApelacoes =
            listQuizzes.map((e) => ApelacaoModel.fromMap(e)).toList();
      } else {
        final statusCode = response.statusCode;
        final message = response.data;
        if (statusCode == 204) {
          return [];
        }
        throw Exception(
          'Erro ao buscar apelação -- Status: $statusCode -- Message: $message',
        );
      }
    } catch (e) {
      rethrow;
    }
    return quizzesApelacoes;
  }
}
