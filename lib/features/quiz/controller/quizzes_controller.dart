import 'dart:developer';

import 'package:dashboard_tbl/core/infra/clients/dio_client.dart';
import 'package:dashboard_tbl/features/quiz/external/quiz_external.dart';
import 'package:dashboard_tbl/features/quiz/models/quiz_model.dart';
import 'package:mobx/mobx.dart';

part 'quizzes_controller.g.dart';

class QuizzesController = _QuizzesControllerBase with _$QuizzesController;

abstract class _QuizzesControllerBase with Store {
  final quizExternal = QuizExternal(DioClient());

  @observable
  bool loading = false;

  @observable
  String message = '';

  @observable
  List<QuizModel> quizzes = [];

  @observable
  DateTime dataInicial = DateTime.now();

  @action
  void setDataInicial(DateTime? date) {
    if (date != null) {
      dataInicial = date;
    }
  }

  @observable
  DateTime dataFinal = DateTime.now();

  @action
  void setDataFinal(DateTime? date) {
    if (date != null) {
      dataFinal = date;
    }
  }

  @observable
  String idClass = '9a701066-27e2-49d2-ae07-0c0f8fea9524';

  @observable
  String idCompany = '1566d92f-9119-44d5-830e-9c3f94eb657c';

  @action
  Future<void> getAllQuizzes() async {
    try {
      loading = true;
      message = '';
      final quizzesList = await quizExternal.getQuizzes(
        idClass,
        idCompany,
        dataInicial,
        dataFinal,
      );
      quizzes = quizzesList;
    } catch (e) {
      log(e.toString());
      message = '$e';
    } finally {
      loading = false;
    }
  }
}
