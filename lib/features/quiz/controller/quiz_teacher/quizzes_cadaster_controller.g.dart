// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizzes_cadaster_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuizzesCadasterController on _QuizzesCadasterControllerBase, Store {
  Computed<bool>? _$isValidCadasterComputed;

  @override
  bool get isValidCadaster =>
      (_$isValidCadasterComputed ??= Computed<bool>(() => super.isValidCadaster,
              name: '_QuizzesCadasterControllerBase.isValidCadaster'))
          .value;
  Computed<bool>? _$canPopComputed;

  @override
  bool get canPop => (_$canPopComputed ??= Computed<bool>(() => super.canPop,
          name: '_QuizzesCadasterControllerBase.canPop'))
      .value;

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

  late final _$_QuizzesCadasterControllerBaseActionController =
      ActionController(
          name: '_QuizzesCadasterControllerBase', context: context);

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
user: ${user},
idProfessor: ${idProfessor},
loading: ${loading},
message: ${message},
titleQuiz: ${titleQuiz},
numberQuestion: ${numberQuestion},
newQuiz: ${newQuiz},
isValidCadaster: ${isValidCadaster},
canPop: ${canPop}
    ''';
  }
}
