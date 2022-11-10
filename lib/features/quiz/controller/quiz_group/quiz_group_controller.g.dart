// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_group_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuizGroupController on _QuizGroupControllerBase, Store {
  Computed<String>? _$questionIndexComputed;

  @override
  String get questionIndex =>
      (_$questionIndexComputed ??= Computed<String>(() => super.questionIndex,
              name: '_QuizGroupControllerBase.questionIndex'))
          .value;

  late final _$_limitScoreAnswerAtom = Atom(
      name: '_QuizGroupControllerBase._limitScoreAnswer', context: context);

  @override
  int get _limitScoreAnswer {
    _$_limitScoreAnswerAtom.reportRead();
    return super._limitScoreAnswer;
  }

  @override
  set _limitScoreAnswer(int value) {
    _$_limitScoreAnswerAtom.reportWrite(value, super._limitScoreAnswer, () {
      super._limitScoreAnswer = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: '_QuizGroupControllerBase.currentIndex', context: context);

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

  late final _$remainingScoreAtom =
      Atom(name: '_QuizGroupControllerBase.remainingScore', context: context);

  @override
  List<int> get remainingScore {
    _$remainingScoreAtom.reportRead();
    return super.remainingScore;
  }

  @override
  set remainingScore(List<int> value) {
    _$remainingScoreAtom.reportWrite(value, super.remainingScore, () {
      super.remainingScore = value;
    });
  }

  late final _$questionsAtom =
      Atom(name: '_QuizGroupControllerBase.questions', context: context);

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

  late final _$currentQuestionAtom =
      Atom(name: '_QuizGroupControllerBase.currentQuestion', context: context);

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
      Atom(name: '_QuizGroupControllerBase.answers', context: context);

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
      Atom(name: '_QuizGroupControllerBase.answerStudent', context: context);

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
      name: '_QuizGroupControllerBase.answersQuestionsStudents',
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

  late final _$progressAtom =
      Atom(name: '_QuizGroupControllerBase.progress', context: context);

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

  late final _$needApelacaoAtom =
      Atom(name: '_QuizGroupControllerBase.needApelacao', context: context);

  @override
  bool get needApelacao {
    _$needApelacaoAtom.reportRead();
    return super.needApelacao;
  }

  @override
  set needApelacao(bool value) {
    _$needApelacaoAtom.reportWrite(value, super.needApelacao, () {
      super.needApelacao = value;
    });
  }

  late final _$_QuizGroupControllerBaseActionController =
      ActionController(name: '_QuizGroupControllerBase', context: context);

  @override
  void setCurrentIndex(int value) {
    final _$actionInfo = _$_QuizGroupControllerBaseActionController.startAction(
        name: '_QuizGroupControllerBase.setCurrentIndex');
    try {
      return super.setCurrentIndex(value);
    } finally {
      _$_QuizGroupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNeedApelacao() {
    final _$actionInfo = _$_QuizGroupControllerBaseActionController.startAction(
        name: '_QuizGroupControllerBase.setNeedApelacao');
    try {
      return super.setNeedApelacao();
    } finally {
      _$_QuizGroupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _init(QuizModel quiz) {
    final _$actionInfo = _$_QuizGroupControllerBaseActionController.startAction(
        name: '_QuizGroupControllerBase._init');
    try {
      return super._init(quiz);
    } finally {
      _$_QuizGroupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextQuestion() {
    final _$actionInfo = _$_QuizGroupControllerBaseActionController.startAction(
        name: '_QuizGroupControllerBase.nextQuestion');
    try {
      return super.nextQuestion();
    } finally {
      _$_QuizGroupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previousQuestion() {
    final _$actionInfo = _$_QuizGroupControllerBaseActionController.startAction(
        name: '_QuizGroupControllerBase.previousQuestion');
    try {
      return super.previousQuestion();
    } finally {
      _$_QuizGroupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProgress() {
    final _$actionInfo = _$_QuizGroupControllerBaseActionController.startAction(
        name: '_QuizGroupControllerBase.setProgress');
    try {
      return super.setProgress();
    } finally {
      _$_QuizGroupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveAnswersStudent() {
    final _$actionInfo = _$_QuizGroupControllerBaseActionController.startAction(
        name: '_QuizGroupControllerBase.saveAnswersStudent');
    try {
      return super.saveAnswersStudent();
    } finally {
      _$_QuizGroupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCorrectQuestion(int index) {
    final _$actionInfo = _$_QuizGroupControllerBaseActionController.startAction(
        name: '_QuizGroupControllerBase.validateCorrectQuestion');
    try {
      return super.validateCorrectQuestion(index);
    } finally {
      _$_QuizGroupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
remainingScore: ${remainingScore},
questions: ${questions},
currentQuestion: ${currentQuestion},
answers: ${answers},
answerStudent: ${answerStudent},
answersQuestionsStudents: ${answersQuestionsStudents},
progress: ${progress},
needApelacao: ${needApelacao},
questionIndex: ${questionIndex}
    ''';
  }
}
