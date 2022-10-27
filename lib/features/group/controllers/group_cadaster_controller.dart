import 'package:dashboard_tbl/core/infra/clients/dio_client.dart';
import 'package:dashboard_tbl/features/group/models/new_group_model.dart';
import 'package:dashboard_tbl/features/users/external/user_external.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../users/models/user_model.dart';
import '../external/group_external.dart';

part 'group_cadaster_controller.g.dart';

class GrupoCadasterController = _GrupoCadasterControllerBase
    with _$GrupoCadasterController;

abstract class _GrupoCadasterControllerBase with Store {
  final userService = UserExternal(DioClient());
  final groupService = GroupExternal(DioClient());

  @observable
  bool loading = false;

  @observable
  bool isValidSave = false;

  @observable
  String reference = '';

  @observable
  String codeClass = '9a701066-27e2-49d2-ae07-0c0f8fea9524';

  @observable
  String message = '';

  @observable
  List<UserModel> users = [];

  @observable
  List<UserModel> usersGroup = [];

  final TextEditingController textEditingController = TextEditingController();

  @observable
  UserModel? userLeader;

  @action
  bool containsLider() {
    return users
            .where((element) => element.isLeaderGroup == true)
            .toList()
            .isNotEmpty &&
        userLeader != null;
  }

  @action
  void _isValidSave() {
    isValidSave = userLeader != null &&
        reference.isNotEmpty &&
        codeClass.isNotEmpty &&
        usersGroup.isNotEmpty;
  }

  @action
  void setUserLeader(int index, UserModel user, bool? value) {
    users[index] = user.copyWith(
      isLeaderGroup: value,
    );
    users = users;
    userLeader = value != null && value ? users[index] : null;
    textEditingController.text = userLeader?.name ?? '';
    if (value != null && value == false) {
      removeUserGroup(user);
    } else {
      addUserGroup(user);
    }
    _isValidSave();
  }

  @action
  void setReference(String value) {
    reference = value;
    _isValidSave();
  }

  @action
  void setCodeClass(String value) {
    codeClass = value;
    _isValidSave();
  }

  @action
  Future<void> _getAllUsers() async {
    try {
      final users = await userService.getUserByTypeUser(
        idCompany: '1566d92f-9119-44d5-830e-9c3f94eb657c',
      );
      this.users = users;
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> getAllUsers() async {
    await _getAllUsers();
  }

  @action
  void addUserGroup(UserModel user) {
    if (usersGroup.where((element) => element.id == user.id).isEmpty) {
      usersGroup.add(user);
      usersGroup = usersGroup;
    }
  }

  @action
  void removeUserGroup(UserModel user) {
    usersGroup.removeWhere((element) => element.id == user.id);
    usersGroup = usersGroup;
    if (user.isLeaderGroup) {
      final userIndex = users.firstWhere((element) => element.id == user.id);
      final index = users.indexOf(userIndex);
      users[index] = user.copyWith(isLeaderGroup: false);
      userLeader = null;
      textEditingController.text = '';
    }
  }

  @action
  Future<void> saveGroup() async {
    loading = true;
    try {
      final group = NewGroupModel(
        idClass: codeClass,
        reference: reference,
        idUserLeader: userLeader != null ? userLeader!.id : '',
        users: usersGroup,
      );
      final response = await groupService.insertGroupsCab(group);
      if (response) {
        message = 'Grupo Inserido com sucesso!';
      }
    } catch (e) {
      message = 'Erro ao inserir grupo! - Erro: ${e.toString()}';
    }
    loading = false;
  }
}
