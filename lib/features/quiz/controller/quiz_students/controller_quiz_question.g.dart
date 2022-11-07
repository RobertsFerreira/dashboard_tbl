// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_quiz_question.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerQuizQuestion on _ControllerQuizQuestionBase, Store {
  Computed<String>? _$questionIndexComputed;

  @override
  String get questionIndex =>
      (_$questionIndexComputed ??= Computed<String>(() => super.questionIndex,
              name: '_ControllerQuizQuestionBase.questionIndex'))
          .value;

  late final _$currentIndexAtom =
      Atom(name: '_ControllerQuizQuestionBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$progressAtom =
      Atom(name: '_ControllerQuizQuestionBase.progress', context: context);

  @override
  double get progress {
    _$progressAtom.reportRead();
    return super.progress;
  }

  @override
  set progress(double value) {
    _$progressAtom.reportWrite(value, super.progress, () {
      super.progress = value;
    });
  }

  late final _$questionsAtom =
      Atom(name: '_ControllerQuizQuestionBase.questions', context: context);

  @override
  List<QuestionModel> get questions {
    _$questionsAtom.reportRead();
    return super.questions;
  }

  @override
  set questions(List<QuestionModel> value) {
    _$questionsAtom.reportWrite(value, super.questions, () {
      super.questions = value;
    });
  }

  late final _$currentQuestionAtom = Atom(
      name: '_ControllerQuizQuestionBase.currentQuestion', context: context);

  @override
  QuestionModel get currentQuestion {
    _$currentQuestionAtom.reportRead();
    return super.currentQuestion;
  }

  @override
  set currentQuestion(QuestionModel value) {
    _$currentQuestionAtom.reportWrite(value, super.currentQuestion, () {
      super.currentQuestion = value;
    });
  }

  late final _$answersAtom =
      Atom(name: '_ControllerQuizQuestionBase.answers', context: context);

  @override
  List<AnswerModel> get answers {
    _$answersAtom.reportRead();
    return super.answers;
  }

  @override
  set answers(List<AnswerModel> value) {
    _$answersAtom.reportWrite(value, super.answers, () {
      super.answers = value;
    });
  }

  late final _$answerStudentAtom =
      Atom(name: '_ControllerQuizQuestionBase.answerStudent', context: context);

  @override
  List<AnswerStudent> get answerStudent {
    _$answerStudentAtom.reportRead();
    return super.answerStudent;
  }

  @override
  set answerStudent(List<AnswerStudent> value) {
    _$answerStudentAtom.reportWrite(value, super.answerStudent, () {
      super.answerStudent = value;
    });
  }

  late final _$answersQuestionsStudentsAtom = Atom(
      name: '_ControllerQuizQuestionBase.answersQuestionsStudents',
      context: context);

  @override
  List<List<AnswerStudent>> get answersQuestionsStudents {
    _$answersQuestionsStudentsAtom.reportRead();
    return super.answersQuestionsStudents;
  }

  @override
  set answersQuestionsStudents(List<List<AnswerStudent>> value) {
    _$answersQuestionsStudentsAtom
        .reportWrite(value, super.answersQuestionsStudents, () {
      super.answersQuestionsStudents = value;
    });
  }

  late final _$insertAnswersUSerAsyncAction = AsyncAction(
      '_ControllerQuizQuestionBase.insertAnswersUSer',
      context: context);

  @override
  Future<void> insertAnswersUSer() {
    return _$insertAnswersUSerAsyncAction.run(() => super.insertAnswersUSer());
  }

  late final _$_ControllerQuizQuestionBaseActionController =
      ActionController(name: '_ControllerQuizQuestionBase', context: context);

  @override
  void setProgress(double value) {
    final _$actionInfo = _$_ControllerQuizQuestionBaseActionController
        .startAction(name: '_ControllerQuizQuestionBase.setProgress');
    try {
      return super.setProgress(value);
    } finally {
      _$_ControllerQuizQuestionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentIndex(int value) {
    final _$actionInfo = _$_ControllerQuizQuestionBaseActionController
        .startAction(name: '_ControllerQuizQuestionBase.setCurrentIndex');
    try {
      return super.setCurrentIndex(value);
    } finally {
      _$_ControllerQuizQuestionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _init(QuizModel quiz) {
    final _$actionInfo = _$_ControllerQuizQuestionBaseActionController
        .startAction(name: '_ControllerQuizQuestionBase._init');
    try {
      return super._init(quiz);
    } finally {
      _$_ControllerQuizQuestionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectPoint(int? value, int index) {
    final _$actionInfo = _$_ControllerQuizQuestionBaseActionController
        .startAction(name: '_ControllerQuizQuestionBase.setSelectPoint');
    try {
      return super.setSelectPoint(value, index);
    } finally {
      _$_ControllerQuizQuestionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String indexProgress(double progress) {
    final _$actionInfo = _$_ControllerQuizQuestionBaseActionController
        .startAction(name: '_ControllerQuizQuestionBase.indexProgress');
    try {
      return super.indexProgress(progress);
    } finally {
      _$_ControllerQuizQuestionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveAnswersStudent() {
    final _$actionInfo = _$_ControllerQuizQuestionBaseActionController
        .startAction(name: '_ControllerQuizQuestionBase.saveAnswersStudent');
    try {
      return super.saveAnswersStudent();
    } finally {
      _$_ControllerQuizQuestionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextQuestion() {
    final _$actionInfo = _$_ControllerQuizQuestionBaseActionController
        .startAction(name: '_ControllerQuizQuestionBase.nextQuestion');
    try {
      return super.nextQuestion();
    } finally {
      _$_ControllerQuizQuestionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previousQuestion() {
    final _$actionInfo = _$_ControllerQuizQuestionBaseActionController
        .startAction(name: '_ControllerQuizQuestionBase.previousQuestion');
    try {
      return super.previousQuestion();
    } finally {
      _$_ControllerQuizQuestionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
progress: ${progress},
questions: ${questions},
currentQuestion: ${currentQuestion},
answers: ${answers},
answerStudent: ${answerStudent},
answersQuestionsStudents: ${answersQuestionsStudents},
questionIndex: ${questionIndex}
    ''';
  }
}
