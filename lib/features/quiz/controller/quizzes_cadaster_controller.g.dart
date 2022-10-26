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

  late final _$userAtom =
      Atom(name: '_QuizzesCadasterControllerBase.user', context: context);

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$idProfessorAtom = Atom(
      name: '_QuizzesCadasterControllerBase.idProfessor', context: context);

  @override
  String get idProfessor {
    _$idProfessorAtom.reportRead();
    return super.idProfessor;
  }

  @override
  set idProfessor(String value) {
    _$idProfessorAtom.reportWrite(value, super.idProfessor, () {
      super.idProfessor = value;
    });
  }

  late final _$dateQuizAtom =
      Atom(name: '_QuizzesCadasterControllerBase.dateQuiz', context: context);

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

  late final _$titleQuizAtom =
      Atom(name: '_QuizzesCadasterControllerBase.titleQuiz', context: context);

  @override
  String get titleQuiz {
    _$titleQuizAtom.reportRead();
    return super.titleQuiz;
  }

  @override
  set titleQuiz(String value) {
    _$titleQuizAtom.reportWrite(value, super.titleQuiz, () {
      super.titleQuiz = value;
    });
  }

  late final _$numberQuestionAtom = Atom(
      name: '_QuizzesCadasterControllerBase.numberQuestion', context: context);

  @override
  int get numberQuestion {
    _$numberQuestionAtom.reportRead();
    return super.numberQuestion;
  }

  @override
  set numberQuestion(int value) {
    _$numberQuestionAtom.reportWrite(value, super.numberQuestion, () {
      super.numberQuestion = value;
    });
  }

  late final _$newQuizAtom =
      Atom(name: '_QuizzesCadasterControllerBase.newQuiz', context: context);

  @override
  NewQuizModel get newQuiz {
    _$newQuizAtom.reportRead();
    return super.newQuiz;
  }

  @override
  set newQuiz(NewQuizModel value) {
    _$newQuizAtom.reportWrite(value, super.newQuiz, () {
      super.newQuiz = value;
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
  void setTurma(String? value) {
    final _$actionInfo = _$_QuizzesCadasterControllerBaseActionController
        .startAction(name: '_QuizzesCadasterControllerBase.setTurma');
    try {
      return super.setTurma(value);
    } finally {
      _$_QuizzesCadasterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProfessor(String? value) {
    final _$actionInfo = _$_QuizzesCadasterControllerBaseActionController
        .startAction(name: '_QuizzesCadasterControllerBase.setProfessor');
    try {
      return super.setProfessor(value);
    } finally {
      _$_QuizzesCadasterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDateQuiz(DateTime? value) {
    final _$actionInfo = _$_QuizzesCadasterControllerBaseActionController
        .startAction(name: '_QuizzesCadasterControllerBase.setDateQuiz');
    try {
      return super.setDateQuiz(value);
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
  void removeGroup(GroupModel group) {
    final _$actionInfo = _$_QuizzesCadasterControllerBaseActionController
        .startAction(name: '_QuizzesCadasterControllerBase.removeGroup');
    try {
      return super.removeGroup(group);
    } finally {
      _$_QuizzesCadasterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitleQuiz(String value) {
    final _$actionInfo = _$_QuizzesCadasterControllerBaseActionController
        .startAction(name: '_QuizzesCadasterControllerBase.setTitleQuiz');
    try {
      return super.setTitleQuiz(value);
    } finally {
      _$_QuizzesCadasterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumberQuestions(String value) {
    final _$actionInfo = _$_QuizzesCadasterControllerBaseActionController
        .startAction(name: '_QuizzesCadasterControllerBase.setNumberQuestions');
    try {
      return super.setNumberQuestions(value);
    } finally {
      _$_QuizzesCadasterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createQuiz() {
    final _$actionInfo = _$_QuizzesCadasterControllerBaseActionController
        .startAction(name: '_QuizzesCadasterControllerBase.createQuiz');
    try {
      return super.createQuiz();
    } finally {
      _$_QuizzesCadasterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
turmas: ${turmas},
idTurma: ${idTurma},
user: ${user},
idProfessor: ${idProfessor},
dateQuiz: ${dateQuiz},
groupsQuiz: ${groupsQuiz},
groups: ${groups},
loading: ${loading},
message: ${message},
titleQuiz: ${titleQuiz},
numberQuestion: ${numberQuestion},
newQuiz: ${newQuiz}
    ''';
  }
}
