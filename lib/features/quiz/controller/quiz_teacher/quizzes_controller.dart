import 'dart:developer';

import 'package:dashboard_tbl/core/infra/clients/dio_client.dart';
import 'package:dashboard_tbl/core/infra/global/user_global.dart';
import 'package:dashboard_tbl/features/quiz/external/quiz_external.dart';
import 'package:dashboard_tbl/features/quiz/models/quiz_model.dart';
import 'package:mobx/mobx.dart';

part 'quizzes_controller.g.dart';

class QuizzesController = _QuizzesControllerBase with _$QuizzesController;

abstract class _QuizzesControllerBase with Store {
  final quizExternal = QuizExternal(DioClient());

  _QuizzesControllerBase() {
    idCompany = UserGlobal.instance.user.idCompany;
    getAllQuizzes();
  }

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
  String idCompany = '';

  @action
  Future<void> getAllQuizzes() async {
    try {
      loading = true;
      message = '';
      final quizzesList = await quizExternal.getQuizzes(idCompany);
      quizzes = quizzesList;
    } catch (e) {
      log(e.toString());
      message = '$e';
    } finally {
      loading = false;
    }
  }
}
