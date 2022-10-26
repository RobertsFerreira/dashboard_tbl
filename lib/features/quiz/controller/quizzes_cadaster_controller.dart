import 'dart:developer';

import 'package:dashboard_tbl/features/group/models/group_model.dart';
import 'package:dashboard_tbl/features/quiz/models/new_quiz_model.dart';
import 'package:dashboard_tbl/features/types_user/models/types_user_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/infra/clients/dio_client.dart';
import '../../group/external/group_external.dart';
import '../../users/models/user_model.dart';

part 'quizzes_cadaster_controller.g.dart';

class QuizzesCadasterController = _QuizzesCadasterControllerBase
    with _$QuizzesCadasterController;

abstract class _QuizzesCadasterControllerBase with Store {
  final serviceGroup = GroupExternal(DioClient());

  _QuizzesCadasterControllerBase() {
    getGroups();
  }

  @observable
  List<DropdownMenuItem<String>> turmas = [
    const DropdownMenuItem(
      value: '9a701066-27e2-49d2-ae07-0c0f8fea9524',
      child: Text('1º ano'),
    ),
    const DropdownMenuItem(
      value: '2',
      child: Text('2º ano'),
    ),
    const DropdownMenuItem(
      value: '3',
      child: Text('3º ano'),
    ),
  ];

  @observable
  String idTurma = '';

  @observable
  UserModel user = UserModel(
    id: '9ff83c06-1af0-4219-a808-3494980e1dc0',
    name: 'João',
    active: true,
    birthDate: DateTime.now(),
    cpf: '1233213123123',
    idCompany: '1566d92f-9119-44d5-830e-9c3f94eb657c',
    typesUser: TypesUserModel(
      id: 'd8a292ba-78e2-4ef0-9917-b6424f4e271f',
      name: 'professor',
      description: '',
    ),
    isLeaderGroup: false,
  );

  @action
  void setTurma(String? value) {
    if (value != null) {
      idTurma = value;
    }
  }

  @observable
  String idProfessor = '';

  @action
  void setProfessor(String? value) {
    if (value != null) {
      idProfessor = value;
    }
  }

  @observable
  DateTime dateQuiz = DateTime.now();

  @action
  void setDateQuiz(DateTime? value) {
    if (value != null) {
      dateQuiz = value;
    }
  }

  @observable
  List<GroupModel> groupsQuiz = [];

  @observable
  List<GroupModel> groups = [];

  @action
  void addGroup(GroupModel group) {
    if (!groupsQuiz.contains(group)) {
      groupsQuiz.add(group);
    }
  }

  @action
  void removeGroup(GroupModel group) {
    if (groupsQuiz.contains(group)) {
      groupsQuiz.remove(group);
    }
  }

  @observable
  bool loading = false;

  @observable
  String message = '';

  @action
  Future<void> getGroups() async {
    loading = true;
    message = '';
    try {
      if (idTurma.isNotEmpty) {
        final groupsList = await serviceGroup.getAllGroups(idTurma);
        groups = groupsList;
      }
    } catch (e) {
      log(e.toString());
      message = e.toString();
    } finally {
      loading = false;
    }
  }

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
      numberQuestion = numberQuestion;
    }
  }

  @observable
  NewQuizModel newQuiz = NewQuizModel(
    title: '',
    date: DateTime.now(),
    numberQuestion: 0,
    groups: [],
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
    idClass: '',
    idCompany: '',
    questions: [],
  );

  @computed
  bool get isValidCadaster =>
      titleQuiz.isNotEmpty &&
      numberQuestion > 0 &&
      groupsQuiz.isNotEmpty &&
      idTurma.isNotEmpty &&
      idProfessor.isNotEmpty;

  @computed
  bool get canPop =>
      titleQuiz.isEmpty &&
      numberQuestion == 0 &&
      groupsQuiz.isEmpty &&
      idTurma.isEmpty &&
      idProfessor.isEmpty;

  @action
  void createQuiz() {
    newQuiz = NewQuizModel(
      title: titleQuiz,
      date: dateQuiz,
      numberQuestion: numberQuestion,
      groups: groupsQuiz,
      teacher: user,
      idClass: idTurma,
      idCompany: user.idCompany,
      questions: [],
    );
  }
}
