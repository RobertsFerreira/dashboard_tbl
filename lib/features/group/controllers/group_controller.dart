import 'dart:developer';

import 'package:dashboard_tbl/features/group/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/infra/clients/dio_client.dart';
import '../external/group_external.dart';

part 'group_controller.g.dart';

class GroupController = _GroupControllerBase with _$GroupController;

abstract class _GroupControllerBase with Store {
  final GroupExternal service = GroupExternal(DioClient());

  @observable
  List<GroupModel> groups = [];

  @observable
  String turma = '';

  @observable
  String message = '';

  @observable
  bool loading = false;

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
  List<DropdownMenuItem<String>> anos = [
    const DropdownMenuItem(
      value: '2021-1',
      child: Text('2021-1'),
    ),
    const DropdownMenuItem(
      value: '2021-2',
      child: Text('2021-2'),
    ),
    const DropdownMenuItem(
      value: '2022-1',
      child: Text('2022-1'),
    ),
  ];

  @action
  void setTurma(String value) => turma = value;

  @action
  Future<void> getGroups() async {
    loading = true;
    message = '';
    try {
      final groupsList = await service.getAllGroups(turma);
      groups = groupsList;
    } catch (e) {
      log(e.toString());
      message = e.toString();
    }
    loading = false;
  }
}
