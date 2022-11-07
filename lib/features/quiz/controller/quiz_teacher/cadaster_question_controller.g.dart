// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadaster_question_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CadasterQuestionController on _CadasterQuestionControllerBase, Store {
  Computed<bool>? _$containsCorrectAnswerComputed;

  @override
  bool get containsCorrectAnswer => (_$containsCorrectAnswerComputed ??=
          Computed<bool>(() => super.containsCorrectAnswer,
              name: '_CadasterQuestionControllerBase.containsCorrectAnswer'))
      .value;
  Computed<bool>? _$saveQuestionComputed;

  @override
  bool get saveQuestion =>
      (_$saveQuestionComputed ??= Computed<bool>(() => super.saveQuestion,
              name: '_CadasterQuestionControllerBase.saveQuestion'))
          .value;
  Computed<bool>? _$canSaveComputed;

  @override
  bool get canSave => (_$canSaveComputed ??= Computed<bool>(() => super.canSave,
          name: '_CadasterQuestionControllerBase.canSave'))
      .value;

  late final _$newQuizAtom =
      Atom(name: '_CadasterQuestionControllerBase.newQuiz', context: context);

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

  late final _$loadingAtom =
      Atom(name: '_CadasterQuestionControllerBase.loading', context: context);

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

  late final _$messageErrorAtom = Atom(
      name: '_CadasterQuestionControllerBase.messageError', context: context);

  @override
  String get messageError {
    _$messageErrorAtom.reportRead();
    return super.messageError;
  }

  @override
  set messageError(String value) {
    _$messageErrorAtom.reportWrite(value, super.messageError, () {
      super.messageError = value;
    });
  }

  late final _$numberAnswersAtom = Atom(
      name: '_CadasterQuestionControllerBase.numberAnswers', context: context);

  @override
  int get numberAnswers {
    _$numberAnswersAtom.reportRead();
    return super.numberAnswers;
  }

  @override
  set numberAnswers(int value) {
    _$numberAnswersAtom.reportWrite(value, super.numberAnswers, () {
      super.numberAnswers = value;
    });
  }

  late final _$answersAtom =
      Atom(name: '_CadasterQuestionControllerBase.answers', context: context);

  @override
  List<NewAnswerModel> get answers {
    _$answersAtom.reportRead();
    return super.answers;
  }

  @override
  set answers(List<NewAnswerModel> value) {
    _$answersAtom.reportWrite(value, super.answers, () {
      super.answers = value;
    });
  }

  late final _$descriptionQuestionAtom = Atom(
      name: '_CadasterQuestionControllerBase.descriptionQuestion',
      context: context);

  @override
  String get descriptionQuestion {
    _$descriptionQuestionAtom.reportRead();
    return super.descriptionQuestion;
  }

  @override
  set descriptionQuestion(String value) {
    _$descriptionQuestionAtom.reportWrite(value, super.descriptionQuestion, () {
      super.descriptionQuestion = value;
    });
  }

  late final _$_CadasterQuestionControllerBaseActionController =
      ActionController(
          name: '_CadasterQuestionControllerBase', context: context);

  @override
  void setQuiz(NewQuizModel value) {
    final _$actionInfo = _$_CadasterQuestionControllerBaseActionController
        .startAction(name: '_CadasterQuestionControllerBase.setQuiz');
    try {
      return super.setQuiz(value);
    } finally {
      _$_CadasterQuestionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescriptionQuestion(String value) {
    final _$actionInfo =
        _$_CadasterQuestionControllerBaseActionController.startAction(
            name: '_CadasterQuestionControllerBase.setDescriptionQuestion');
    try {
      return super.setDescriptionQuestion(value);
    } finally {
      _$_CadasterQuestionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescriptionAnswer(int index, String value) {
    final _$actionInfo =
        _$_CadasterQuestionControllerBaseActionController.startAction(
            name: '_CadasterQuestionControllerBase.setDescriptionAnswer');
    try {
      return super.setDescriptionAnswer(index, value);
    } finally {
      _$_CadasterQuestionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setScoreAnswer(int index, String value) {
    final _$actionInfo = _$_CadasterQuestionControllerBaseActionController
        .startAction(name: '_CadasterQuestionControllerBase.setScoreAnswer');
    try {
      return super.setScoreAnswer(index, value);
    } finally {
      _$_CadasterQuestionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCorrectAnswer(int index, NewAnswerModel answer, bool? value) {
    final _$actionInfo = _$_CadasterQuestionControllerBaseActionController
        .startAction(name: '_CadasterQuestionControllerBase.setCorrectAnswer');
    try {
      return super.setCorrectAnswer(index, answer, value);
    } finally {
      _$_CadasterQuestionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addQuestion() {
    final _$actionInfo = _$_CadasterQuestionControllerBaseActionController
        .startAction(name: '_CadasterQuestionControllerBase.addQuestion');
    try {
      return super.addQuestion();
    } finally {
      _$_CadasterQuestionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementNumberAnswers() {
    final _$actionInfo =
        _$_CadasterQuestionControllerBaseActionController.startAction(
            name: '_CadasterQuestionControllerBase.incrementNumberAnswers');
    try {
      return super.incrementNumberAnswers();
    } finally {
      _$_CadasterQuestionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementNumberAnswers() {
    final _$actionInfo =
        _$_CadasterQuestionControllerBaseActionController.startAction(
            name: '_CadasterQuestionControllerBase.decrementNumberAnswers');
    try {
      return super.decrementNumberAnswers();
    } finally {
      _$_CadasterQuestionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newQuiz: ${newQuiz},
loading: ${loading},
messageError: ${messageError},
numberAnswers: ${numberAnswers},
answers: ${answers},
descriptionQuestion: ${descriptionQuestion},
containsCorrectAnswer: ${containsCorrectAnswer},
saveQuestion: ${saveQuestion},
canSave: ${canSave}
    ''';
  }
}
