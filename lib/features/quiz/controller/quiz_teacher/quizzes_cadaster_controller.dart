import 'package:dashboard_tbl/features/quiz/models/new_quiz_model.dart';
import 'package:dashboard_tbl/features/types_user/models/types_user_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/infra/clients/dio_client.dart';
import '../../../../core/infra/global/user_global.dart';
import '../../../group/external/group_external.dart';
import '../../../users/models/user_model.dart';

part 'quizzes_cadaster_controller.g.dart';

class QuizzesCadasterController = _QuizzesCadasterControllerBase
    with _$QuizzesCadasterController;

abstract class _QuizzesCadasterControllerBase with Store {
  final serviceGroup = GroupExternal(DioClient());

  _QuizzesCadasterControllerBase() {
    user = UserGlobal.instance.user;
    idProfessor = user.id;
  }

  @observable
  UserModel user = UserModel.empty();

  @observable
  String idProfessor = '';

  @observable
  bool loading = false;

  @observable
  String message = '';

  @observable
  String titleQuiz = '';

  @action
  void setTitleQuiz(String value) {
    titleQuiz = value;
  }

  @observable
  int numberQuestion = 0;

  @action
  void setNumberQuestions(String value) {
    final numberQst = int.tryParse(value);
    if (numberQst != null) {
      numberQuestion = numberQst;
    }
  }

  @observable
  NewQuizModel newQuiz = NewQuizModel(
    title: '',
    numberQuestion: 0,
    teacher: UserModel(
      id: '',
      name: '',
      active: true,
      birthDate: DateTime.now(),
      cpf: '',
      idCompany: '',
      typesUser: TypesUserModel(
        id: '',
        name: '',
        description: '',
      ),
      isLeaderGroup: false,
    ),
    idCompany: '',
    questions: [],
  );

  @computed
  bool get isValidCadaster {
    return titleQuiz.isNotEmpty && numberQuestion > 0;
  }

  @computed
  bool get canPop => titleQuiz.isEmpty && numberQuestion == 0;

  @action
  void createQuiz() {
    newQuiz = NewQuizModel(
      title: titleQuiz,
      numberQuestion: numberQuestion,
      teacher: user,
      idCompany: user.idCompany,
      questions: [],
    );
  }
}
