import 'dart:developer';

import 'package:asuka/asuka.dart' as asuka;
import 'package:dashboard_tbl/core/infra/clients/dio_client.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/infra/global/user_global.dart';
import '../../external/quiz_student/quiz_student_external.dart';
import '../../models/quiz_model.dart';
import '../../models/quiz_result/quiz_result.dart';

part 'controller_quiz_students.g.dart';

class ControllerQuizStudents = _ControllerQuizStudentsBase
    with _$ControllerQuizStudents;

abstract class _ControllerQuizStudentsBase with Store {
  final quizStudentsExternal = QuizStudentsExternal(DioClient());

  @observable
  bool loading = false;

  @observable
  String message = "";

  @observable
  DateTime from = DateTime.now();

  @observable
  DateTime to = DateTime.now();

  @observable
  List<QuizModel> quizzes = [];

  @observable
  bool answered = false;

  @action
  bool setAnswered(bool value) => answered = value;

  @action
  void setFrom(DateTime value) => from = value;

  @action
  void setTo(DateTime value) => to = value;

  final _user = UserGlobal.instance.user;

  @observable
  List<QuizResult> quizResults = [];

  @action
  Future<void> getAllQuizzes() async {
    try {
      loading = true;
      message = '';
      final quizzesList = await quizStudentsExternal.getQuizzes(
        _user.id,
        answered,
        from,
        to,
      );
      quizzes = quizzesList;
    } catch (e) {
      log(e.toString());
      message = '$e';
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> getResultsOfQuiz(String idQuiz) async {
    try {
      loading = true;
      quizResults = await quizStudentsExternal.getAllQuizzesResults(idQuiz);
      quizResults = quizResults;
    } catch (e) {
      asuka.AsukaSnackbar.alert(e.toString()).show();
    } finally {
      loading = false;
    }
  }
}
