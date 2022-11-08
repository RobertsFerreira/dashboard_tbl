import 'dart:developer';

import 'package:dashboard_tbl/core/infra/clients/dio_client.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/infra/global/user_global.dart';
import '../../external/quiz_student/quiz_student_external.dart';
import '../../models/quiz_model.dart';

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

  @action
  void setFrom(DateTime value) => from = value;

  @action
  void setTo(DateTime value) => to = value;

  final _user = UserGlobal.instance.user;

  @action
  Future<void> getAllQuizzes() async {
    try {
      loading = true;
      message = '';
      final quizzesList = await quizStudentsExternal.getQuizzes(
        _user.id,
        false,
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
}
