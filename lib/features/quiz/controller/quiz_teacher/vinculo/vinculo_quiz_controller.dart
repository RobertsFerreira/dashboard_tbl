import 'package:asuka/asuka.dart' as asuka;
import 'package:dashboard_tbl/features/quiz/models/apelacao/apelacao_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/infra/clients/dio_client.dart';
import '../../../external/quiz_external.dart';
import '../../../models/quiz_result/quiz_result.dart';
import '../../../models/vincule_quiz/vinculo_quiz_model.dart';

part 'vinculo_quiz_controller.g.dart';

class VinculoQuizController = _VinculoQuizControllerBase
    with _$VinculoQuizController;

abstract class _VinculoQuizControllerBase with Store {
  final quizExternal = QuizExternal(DioClient());

  @observable
  bool loading = false;

  @observable
  bool answered = false;

  @action
  bool setAnswered(bool value) => answered = value;

  @observable
  DateTime dataIni = DateTime.now();

  @action
  void setDataIni(DateTime? value) {
    if (value != null) {
      dataIni = value;
    }
  }

  @observable
  DateTime dataFim = DateTime.now();

  @action
  void setDataFim(DateTime? value) {
    if (value != null) {
      dataFim = value;
    }
  }

  @observable
  List<VinculoQuizModel> vinculoQuizzes = [];

  @observable
  List<QuizResult> quizResults = [];

  @action
  Future<void> getAll() async {
    try {
      loading = true;
      vinculoQuizzes =
          await quizExternal.getVinculosQuizzes(dataIni, dataFim, answered);
      vinculoQuizzes = vinculoQuizzes;
    } catch (e) {
      asuka.AsukaSnackbar.alert(e.toString()).show();
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> getResultsOfQuiz(VinculoQuizModel quiz) async {
    try {
      loading = true;
      quizResults = await quizExternal.getAllQuizzesResults(quiz);
      quizResults = quizResults;
      await getApelacoes(quiz);
    } catch (e) {
      asuka.AsukaSnackbar.alert(e.toString()).show();
    } finally {
      loading = false;
    }
  }

  @observable
  List<ApelacaoModel> apelacoes = [];

  @action
  Future<void> getApelacoes(VinculoQuizModel quiz) async {
    try {
      loading = true;
      final idQuiz = quiz.id;
      final data = quiz.date;
      apelacoes = await quizExternal.getApelacoes(idQuiz, data);
      apelacoes = apelacoes;
    } catch (e) {
      asuka.AsukaSnackbar.alert(e.toString()).show();
    } finally {
      loading = false;
    }
  }
}
