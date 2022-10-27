// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadaster_question_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CadasterQuestionController on _CadasterQuestionControllerBase, Store {
  late final _$numberQuestionsAtom = Atom(
      name: '_CadasterQuestionControllerBase.numberQuestions',
      context: context);

  @override
  int get numberQuestions {
    _$numberQuestionsAtom.reportRead();
    return super.numberQuestions;
  }

  @override
  set numberQuestions(int value) {
    _$numberQuestionsAtom.reportWrite(value, super.numberQuestions, () {
      super.numberQuestions = value;
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

  late final _$_CadasterQuestionControllerBaseActionController =
      ActionController(
          name: '_CadasterQuestionControllerBase', context: context);

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
  void setCorrectAnswer(int index, bool? value) {
    final _$actionInfo = _$_CadasterQuestionControllerBaseActionController
        .startAction(name: '_CadasterQuestionControllerBase.setCorrectAnswer');
    try {
      return super.setCorrectAnswer(index, value);
    } finally {
      _$_CadasterQuestionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo = _$_CadasterQuestionControllerBaseActionController
        .startAction(name: '_CadasterQuestionControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CadasterQuestionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_CadasterQuestionControllerBaseActionController
        .startAction(name: '_CadasterQuestionControllerBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$_CadasterQuestionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
numberQuestions: ${numberQuestions},
answers: ${answers}
    ''';
  }
}
