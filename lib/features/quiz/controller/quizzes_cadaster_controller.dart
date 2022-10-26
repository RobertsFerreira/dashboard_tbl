import 'dart:developer';

import 'package:dashboard_tbl/features/group/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/infra/clients/dio_client.dart';
import '../../group/external/group_external.dart';

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

  @action
  void setTurma(String value) {
    idTurma = value;
  }

  @observable
  List<GroupModel> groupsQuiz = [];

  @observable
  List<GroupModel> groups = [];

  @action
  void addGroup(GroupModel group) {
    groupsQuiz.add(group);
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
      final groupsList = await serviceGroup.getAllGroups(idTurma);
      groups = groupsList;
    } catch (e) {
      log(e.toString());
      message = e.toString();
    } finally {
      loading = false;
    }
  }
}
