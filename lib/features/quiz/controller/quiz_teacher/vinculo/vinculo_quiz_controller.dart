import 'package:mobx/mobx.dart';

part 'vinculo_quiz_controller.g.dart';

class VinculoQuizController = _VinculoQuizControllerBase
    with _$VinculoQuizController;

abstract class _VinculoQuizControllerBase with Store {
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
}
