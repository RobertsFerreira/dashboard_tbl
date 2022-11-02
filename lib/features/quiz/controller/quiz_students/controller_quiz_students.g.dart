// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_quiz_students.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerQuizStudents on _ControllerQuizStudentsBase, Store {
  late final _$loadingAtom =
      Atom(name: '_ControllerQuizStudentsBase.loading', context: context);

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
      Atom(name: '_ControllerQuizStudentsBase.message', context: context);

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

  late final _$fromAtom =
      Atom(name: '_ControllerQuizStudentsBase.from', context: context);

  @override
  DateTime get from {
    _$fromAtom.reportRead();
    return super.from;
  }

  @override
  set from(DateTime value) {
    _$fromAtom.reportWrite(value, super.from, () {
      super.from = value;
    });
  }

  late final _$toAtom =
      Atom(name: '_ControllerQuizStudentsBase.to', context: context);

  @override
  DateTime get to {
    _$toAtom.reportRead();
    return super.to;
  }

  @override
  set to(DateTime value) {
    _$toAtom.reportWrite(value, super.to, () {
      super.to = value;
    });
  }

  late final _$quizzesAtom =
      Atom(name: '_ControllerQuizStudentsBase.quizzes', context: context);

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

  late final _$getAllQuizzesAsyncAction = AsyncAction(
      '_ControllerQuizStudentsBase.getAllQuizzes',
      context: context);

  @override
  Future<void> getAllQuizzes() {
    return _$getAllQuizzesAsyncAction.run(() => super.getAllQuizzes());
  }

  late final _$_ControllerQuizStudentsBaseActionController =
      ActionController(name: '_ControllerQuizStudentsBase', context: context);

  @override
  void setFrom(DateTime value) {
    final _$actionInfo = _$_ControllerQuizStudentsBaseActionController
        .startAction(name: '_ControllerQuizStudentsBase.setFrom');
    try {
      return super.setFrom(value);
    } finally {
      _$_ControllerQuizStudentsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTo(DateTime value) {
    final _$actionInfo = _$_ControllerQuizStudentsBaseActionController
        .startAction(name: '_ControllerQuizStudentsBase.setTo');
    try {
      return super.setTo(value);
    } finally {
      _$_ControllerQuizStudentsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
message: ${message},
from: ${from},
to: ${to},
quizzes: ${quizzes}
    ''';
  }
}
