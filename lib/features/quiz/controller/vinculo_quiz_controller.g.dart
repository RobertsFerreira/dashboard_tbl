// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vinculo_quiz_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VinculoQuizController on _VinculoQuizControllerBase, Store {
  late final _$turmasAtom =
      Atom(name: '_VinculoQuizControllerBase.turmas', context: context);

  @override
  List<DropdownMenuItem<String>> get turmas {
    _$turmasAtom.reportRead();
    return super.turmas;
  }

  @override
  set turmas(List<DropdownMenuItem<String>> value) {
    _$turmasAtom.reportWrite(value, super.turmas, () {
      super.turmas = value;
    });
  }

  late final _$quizzesDropdownAtom = Atom(
      name: '_VinculoQuizControllerBase.quizzesDropdown', context: context);

  @override
  List<DropdownMenuItem<String>> get quizzesDropdown {
    _$quizzesDropdownAtom.reportRead();
    return super.quizzesDropdown;
  }

  @override
  set quizzesDropdown(List<DropdownMenuItem<String>> value) {
    _$quizzesDropdownAtom.reportWrite(value, super.quizzesDropdown, () {
      super.quizzesDropdown = value;
    });
  }

  late final _$idTurmaAtom =
      Atom(name: '_VinculoQuizControllerBase.idTurma', context: context);

  @override
  String get idTurma {
    _$idTurmaAtom.reportRead();
    return super.idTurma;
  }

  @override
  set idTurma(String value) {
    _$idTurmaAtom.reportWrite(value, super.idTurma, () {
      super.idTurma = value;
    });
  }

  late final _$dateQuizAtom =
      Atom(name: '_VinculoQuizControllerBase.dateQuiz', context: context);

  @override
  DateTime get dateQuiz {
    _$dateQuizAtom.reportRead();
    return super.dateQuiz;
  }

  @override
  set dateQuiz(DateTime value) {
    _$dateQuizAtom.reportWrite(value, super.dateQuiz, () {
      super.dateQuiz = value;
    });
  }

  late final _$idQuizAtom =
      Atom(name: '_VinculoQuizControllerBase.idQuiz', context: context);

  @override
  String get idQuiz {
    _$idQuizAtom.reportRead();
    return super.idQuiz;
  }

  @override
  set idQuiz(String value) {
    _$idQuizAtom.reportWrite(value, super.idQuiz, () {
      super.idQuiz = value;
    });
  }

  late final _$groupsQuizAtom =
      Atom(name: '_VinculoQuizControllerBase.groupsQuiz', context: context);

  @override
  List<GroupModel> get groupsQuiz {
    _$groupsQuizAtom.reportRead();
    return super.groupsQuiz;
  }

  @override
  set groupsQuiz(List<GroupModel> value) {
    _$groupsQuizAtom.reportWrite(value, super.groupsQuiz, () {
      super.groupsQuiz = value;
    });
  }

  late final _$groupsBackupAtom =
      Atom(name: '_VinculoQuizControllerBase.groupsBackup', context: context);

  @override
  List<GroupModel> get groupsBackup {
    _$groupsBackupAtom.reportRead();
    return super.groupsBackup;
  }

  @override
  set groupsBackup(List<GroupModel> value) {
    _$groupsBackupAtom.reportWrite(value, super.groupsBackup, () {
      super.groupsBackup = value;
    });
  }

  late final _$groupsAtom =
      Atom(name: '_VinculoQuizControllerBase.groups', context: context);

  @override
  List<GroupModel> get groups {
    _$groupsAtom.reportRead();
    return super.groups;
  }

  @override
  set groups(List<GroupModel> value) {
    _$groupsAtom.reportWrite(value, super.groups, () {
      super.groups = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_VinculoQuizControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$messageAtom =
      Atom(name: '_VinculoQuizControllerBase.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$getGroupsAsyncAction =
      AsyncAction('_VinculoQuizControllerBase.getGroups', context: context);

  @override
  Future<void> getGroups() {
    return _$getGroupsAsyncAction.run(() => super.getGroups());
  }

  late final _$getQuizzesAsyncAction =
      AsyncAction('_VinculoQuizControllerBase.getQuizzes', context: context);

  @override
  Future<void> getQuizzes() {
    return _$getQuizzesAsyncAction.run(() => super.getQuizzes());
  }

  late final _$_VinculoQuizControllerBaseActionController =
      ActionController(name: '_VinculoQuizControllerBase', context: context);

  @override
  void setTurma(String? value) {
    final _$actionInfo = _$_VinculoQuizControllerBaseActionController
        .startAction(name: '_VinculoQuizControllerBase.setTurma');
    try {
      return super.setTurma(value);
    } finally {
      _$_VinculoQuizControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDateQuiz(DateTime? value) {
    final _$actionInfo = _$_VinculoQuizControllerBaseActionController
        .startAction(name: '_VinculoQuizControllerBase.setDateQuiz');
    try {
      return super.setDateQuiz(value);
    } finally {
      _$_VinculoQuizControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdQuiz(String? value) {
    final _$actionInfo = _$_VinculoQuizControllerBaseActionController
        .startAction(name: '_VinculoQuizControllerBase.setIdQuiz');
    try {
      return super.setIdQuiz(value);
    } finally {
      _$_VinculoQuizControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addGroup(GroupModel group, dynamic index) {
    final _$actionInfo = _$_VinculoQuizControllerBaseActionController
        .startAction(name: '_VinculoQuizControllerBase.addGroup');
    try {
      return super.addGroup(group, index);
    } finally {
      _$_VinculoQuizControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeGroup(GroupModel group) {
    final _$actionInfo = _$_VinculoQuizControllerBaseActionController
        .startAction(name: '_VinculoQuizControllerBase.removeGroup');
    try {
      return super.removeGroup(group);
    } finally {
      _$_VinculoQuizControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
turmas: ${turmas},
quizzesDropdown: ${quizzesDropdown},
idTurma: ${idTurma},
dateQuiz: ${dateQuiz},
idQuiz: ${idQuiz},
groupsQuiz: ${groupsQuiz},
groupsBackup: ${groupsBackup},
groups: ${groups},
loading: ${loading},
message: ${message}
    ''';
  }
}
