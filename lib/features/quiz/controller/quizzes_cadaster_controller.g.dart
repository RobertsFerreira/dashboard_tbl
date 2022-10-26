// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizzes_cadaster_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuizzesCadasterController on _QuizzesCadasterControllerBase, Store {
  late final _$turmasAtom =
      Atom(name: '_QuizzesCadasterControllerBase.turmas', context: context);

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

  late final _$idTurmaAtom =
      Atom(name: '_QuizzesCadasterControllerBase.idTurma', context: context);

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

  late final _$groupsQuizAtom =
      Atom(name: '_QuizzesCadasterControllerBase.groupsQuiz', context: context);

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

  late final _$groupsAtom =
      Atom(name: '_QuizzesCadasterControllerBase.groups', context: context);

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
      Atom(name: '_QuizzesCadasterControllerBase.loading', context: context);

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
      Atom(name: '_QuizzesCadasterControllerBase.message', context: context);

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
      AsyncAction('_QuizzesCadasterControllerBase.getGroups', context: context);

  @override
  Future<void> getGroups() {
    return _$getGroupsAsyncAction.run(() => super.getGroups());
  }

  late final _$_QuizzesCadasterControllerBaseActionController =
      ActionController(
          name: '_QuizzesCadasterControllerBase', context: context);

  @override
  void setTurma(String value) {
    final _$actionInfo = _$_QuizzesCadasterControllerBaseActionController
        .startAction(name: '_QuizzesCadasterControllerBase.setTurma');
    try {
      return super.setTurma(value);
    } finally {
      _$_QuizzesCadasterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addGroup(GroupModel group) {
    final _$actionInfo = _$_QuizzesCadasterControllerBaseActionController
        .startAction(name: '_QuizzesCadasterControllerBase.addGroup');
    try {
      return super.addGroup(group);
    } finally {
      _$_QuizzesCadasterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
turmas: ${turmas},
idTurma: ${idTurma},
groupsQuiz: ${groupsQuiz},
groups: ${groups},
loading: ${loading},
message: ${message}
    ''';
  }
}
