// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vinculo_quiz_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VinculoQuizController on _VinculoQuizControllerBase, Store {
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

  late final _$answeredAtom =
      Atom(name: '_VinculoQuizControllerBase.answered', context: context);

  @override
  bool get answered {
    _$answeredAtom.reportRead();
    return super.answered;
  }

  @override
  set answered(bool value) {
    _$answeredAtom.reportWrite(value, super.answered, () {
      super.answered = value;
    });
  }

  late final _$dataIniAtom =
      Atom(name: '_VinculoQuizControllerBase.dataIni', context: context);

  @override
  DateTime get dataIni {
    _$dataIniAtom.reportRead();
    return super.dataIni;
  }

  @override
  set dataIni(DateTime value) {
    _$dataIniAtom.reportWrite(value, super.dataIni, () {
      super.dataIni = value;
    });
  }

  late final _$dataFimAtom =
      Atom(name: '_VinculoQuizControllerBase.dataFim', context: context);

  @override
  DateTime get dataFim {
    _$dataFimAtom.reportRead();
    return super.dataFim;
  }

  @override
  set dataFim(DateTime value) {
    _$dataFimAtom.reportWrite(value, super.dataFim, () {
      super.dataFim = value;
    });
  }

  late final _$vinculoQuizzesAtom =
      Atom(name: '_VinculoQuizControllerBase.vinculoQuizzes', context: context);

  @override
  List<VinculoQuizModel> get vinculoQuizzes {
    _$vinculoQuizzesAtom.reportRead();
    return super.vinculoQuizzes;
  }

  @override
  set vinculoQuizzes(List<VinculoQuizModel> value) {
    _$vinculoQuizzesAtom.reportWrite(value, super.vinculoQuizzes, () {
      super.vinculoQuizzes = value;
    });
  }

  late final _$quizResultsAtom =
      Atom(name: '_VinculoQuizControllerBase.quizResults', context: context);

  @override
  List<QuizResult> get quizResults {
    _$quizResultsAtom.reportRead();
    return super.quizResults;
  }

  @override
  set quizResults(List<QuizResult> value) {
    _$quizResultsAtom.reportWrite(value, super.quizResults, () {
      super.quizResults = value;
    });
  }

  late final _$apelacoesAtom =
      Atom(name: '_VinculoQuizControllerBase.apelacoes', context: context);

  @override
  List<ApelacaoModel> get apelacoes {
    _$apelacoesAtom.reportRead();
    return super.apelacoes;
  }

  @override
  set apelacoes(List<ApelacaoModel> value) {
    _$apelacoesAtom.reportWrite(value, super.apelacoes, () {
      super.apelacoes = value;
    });
  }

  late final _$getAllAsyncAction =
      AsyncAction('_VinculoQuizControllerBase.getAll', context: context);

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  late final _$getResultsOfQuizAsyncAction = AsyncAction(
      '_VinculoQuizControllerBase.getResultsOfQuiz',
      context: context);

  @override
  Future<void> getResultsOfQuiz(VinculoQuizModel quiz) {
    return _$getResultsOfQuizAsyncAction
        .run(() => super.getResultsOfQuiz(quiz));
  }

  late final _$getApelacoesAsyncAction =
      AsyncAction('_VinculoQuizControllerBase.getApelacoes', context: context);

  @override
  Future<void> getApelacoes(VinculoQuizModel quiz) {
    return _$getApelacoesAsyncAction.run(() => super.getApelacoes(quiz));
  }

  late final _$_VinculoQuizControllerBaseActionController =
      ActionController(name: '_VinculoQuizControllerBase', context: context);

  @override
  bool setAnswered(bool value) {
    final _$actionInfo = _$_VinculoQuizControllerBaseActionController
        .startAction(name: '_VinculoQuizControllerBase.setAnswered');
    try {
      return super.setAnswered(value);
    } finally {
      _$_VinculoQuizControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataIni(DateTime? value) {
    final _$actionInfo = _$_VinculoQuizControllerBaseActionController
        .startAction(name: '_VinculoQuizControllerBase.setDataIni');
    try {
      return super.setDataIni(value);
    } finally {
      _$_VinculoQuizControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataFim(DateTime? value) {
    final _$actionInfo = _$_VinculoQuizControllerBaseActionController
        .startAction(name: '_VinculoQuizControllerBase.setDataFim');
    try {
      return super.setDataFim(value);
    } finally {
      _$_VinculoQuizControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
message: ${message},
loading: ${loading},
answered: ${answered},
dataIni: ${dataIni},
dataFim: ${dataFim},
vinculoQuizzes: ${vinculoQuizzes},
quizResults: ${quizResults},
apelacoes: ${apelacoes}
    ''';
  }
}
