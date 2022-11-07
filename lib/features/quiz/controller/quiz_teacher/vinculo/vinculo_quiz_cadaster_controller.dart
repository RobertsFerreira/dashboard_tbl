import 'dart:developer';

import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/infra/clients/dio_client.dart';
import '../../../../../core/infra/global/user_global.dart';
import '../../../../group/external/group_external.dart';
import '../../../../group/models/group_model.dart';
import '../../../external/quiz_external.dart';
import '../../../models/quiz_model.dart';

part 'vinculo_quiz_cadaster_controller.g.dart';

class VinculoQuizCadasterController = _VinculoQuizCadasterControllerBase
    with _$VinculoQuizCadasterController;

abstract class _VinculoQuizCadasterControllerBase with Store {
  final serviceGroup = GroupExternal(DioClient());

  final quizService = QuizExternal(DioClient());

  _VinculoQuizCadasterControllerBase() {
    idTurma = turmas.first.value ?? '';
    _init();
  }

  Future<void> _init() async {
    await getGroups();
    await getQuizzes();
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
  List<DropdownMenuItem<String>> quizzesDropdown = [];

  List<QuizModel> quizzes = [];

  @observable
  String idTurma = '';

  @action
  void setTurma(String? value) {
    if (value != null) {
      idTurma = value;
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
  String idQuiz = '';

  @action
  void setIdQuiz(String? value) {
    if (value != null) {
      idQuiz = value;
    }
  }

  @observable
  List<GroupModel> groupsQuiz = [];

  @observable
  List<GroupModel> groupsBackup = [];

  @observable
  List<GroupModel> groups = [];

  @action
  void addGroup(GroupModel group, index) {
    if (!groupsQuiz.contains(group)) {
      groupsQuiz.add(group);
      groupsQuiz = groupsQuiz;
      groups.removeAt(index);
      groups = groups;
    }
  }

  @action
  void removeGroup(GroupModel group) {
    if (groupsQuiz.contains(group)) {
      groupsQuiz.remove(group);
      groupsQuiz = groupsQuiz;
      final index =
          groupsBackup.indexWhere((element) => element.id == group.id);
      groups.insert(index, group);
      groups = groups;
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
        groupsBackup = [...groups];
      }
    } catch (e) {
      log(e.toString());
      message = e.toString();
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> getQuizzes() async {
    loading = true;
    message = '';
    try {
      final quizzesList =
          await quizService.getQuizzes(UserGlobal.instance.user.idCompany);
      quizzes = quizzesList;

      quizzesDropdown = quizzes
          .map((quiz) => DropdownMenuItem(
                value: quiz.id,
                child: Text(quiz.title),
              ))
          .toList();
      quizzesDropdown = quizzesDropdown;
    } catch (e) {
      log(e.toString());
      message = e.toString();
    } finally {
      loading = false;
    }
  }

  @computed
  bool get validVinculo =>
      idTurma.isNotEmpty && idQuiz.isNotEmpty && groupsQuiz.isNotEmpty;

  @action
  Future<void> vincularQuiz() async {
    loading = true;
    message = '';
    try {
      final result = await quizService.vinculeQuiz(
        UserGlobal.instance.user.idCompany,
        groupsQuiz,
        idQuiz,
        dateQuiz,
      );
      if (result) {
        asuka.AsukaSnackbar.success('Vinculado com sucesso').show();
      } else {
        asuka.AsukaSnackbar.alert('Erro ao vincular').show();
      }
    } catch (e) {
      asuka.Asuka.showDialog(
        barrierColor: Colors.black.withOpacity(0.3),
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text('Erro'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Ok'),
            ),
          ],
        ),
      );
      message = e.toString();
    } finally {
      loading = false;
    }
  }
}
