import 'package:asuka/asuka.dart' as asuka;
import 'package:mobx/mobx.dart';

import '../../../../../core/infra/clients/dio_client.dart';
import '../../../external/quiz_external.dart';
import '../../../models/vincule_quiz/vinculo_quiz_model.dart';

part 'vinculo_quiz_controller.g.dart';

class VinculoQuizController = _VinculoQuizControllerBase
    with _$VinculoQuizController;

abstract class _VinculoQuizControllerBase with Store {
  final quizExternal = QuizExternal(DioClient());

  @observable
  bool loading = false;

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

  @action
  Future<void> getAll() async {
    try {
      loading = true;
      vinculoQuizzes = await quizExternal.getVinculosQuizzes(dataIni, dataFim);
      vinculoQuizzes = vinculoQuizzes;
    } catch (e) {
      asuka.AsukaSnackbar.alert(e.toString()).show();
    } finally {
      loading = false;
    }
  }
}
