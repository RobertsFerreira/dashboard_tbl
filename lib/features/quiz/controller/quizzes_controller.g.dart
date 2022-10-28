// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizzes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuizzesController on _QuizzesControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_QuizzesControllerBase.loading', context: context);

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
      Atom(name: '_QuizzesControllerBase.message', context: context);

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

  late final _$quizzesAtom =
      Atom(name: '_QuizzesControllerBase.quizzes', context: context);

  @override
  List<QuizModel> get quizzes {
    _$quizzesAtom.reportRead();
    return super.quizzes;
  }

  @override
  set quizzes(List<QuizModel> value) {
    _$quizzesAtom.reportWrite(value, super.quizzes, () {
      super.quizzes = value;
    });
  }

  late final _$dataInicialAtom =
      Atom(name: '_QuizzesControllerBase.dataInicial', context: context);

  @override
  DateTime get dataInicial {
    _$dataInicialAtom.reportRead();
    return super.dataInicial;
  }

  @override
  set dataInicial(DateTime value) {
    _$dataInicialAtom.reportWrite(value, super.dataInicial, () {
      super.dataInicial = value;
    });
  }

  late final _$dataFinalAtom =
      Atom(name: '_QuizzesControllerBase.dataFinal', context: context);

  @override
  DateTime get dataFinal {
    _$dataFinalAtom.reportRead();
    return super.dataFinal;
  }

  @override
  set dataFinal(DateTime value) {
    _$dataFinalAtom.reportWrite(value, super.dataFinal, () {
      super.dataFinal = value;
    });
  }

  late final _$idClassAtom =
      Atom(name: '_QuizzesControllerBase.idClass', context: context);

  @override
  String get idClass {
    _$idClassAtom.reportRead();
    return super.idClass;
  }

  @override
  set idClass(String value) {
    _$idClassAtom.reportWrite(value, super.idClass, () {
      super.idClass = value;
    });
  }

  late final _$idCompanyAtom =
      Atom(name: '_QuizzesControllerBase.idCompany', context: context);

  @override
  String get idCompany {
    _$idCompanyAtom.reportRead();
    return super.idCompany;
  }

  @override
  set idCompany(String value) {
    _$idCompanyAtom.reportWrite(value, super.idCompany, () {
      super.idCompany = value;
    });
  }

  late final _$getAllQuizzesAsyncAction =
      AsyncAction('_QuizzesControllerBase.getAllQuizzes', context: context);

  @override
  Future<void> getAllQuizzes() {
    return _$getAllQuizzesAsyncAction.run(() => super.getAllQuizzes());
  }

  late final _$_QuizzesControllerBaseActionController =
      ActionController(name: '_QuizzesControllerBase', context: context);

  @override
  void setDataInicial(DateTime? date) {
    final _$actionInfo = _$_QuizzesControllerBaseActionController.startAction(
        name: '_QuizzesControllerBase.setDataInicial');
    try {
      return super.setDataInicial(date);
    } finally {
      _$_QuizzesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataFinal(DateTime? date) {
    final _$actionInfo = _$_QuizzesControllerBaseActionController.startAction(
        name: '_QuizzesControllerBase.setDataFinal');
    try {
      return super.setDataFinal(date);
    } finally {
      _$_QuizzesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
message: ${message},
quizzes: ${quizzes},
dataInicial: ${dataInicial},
dataFinal: ${dataFinal},
idClass: ${idClass},
idCompany: ${idCompany}
    ''';
  }
}
