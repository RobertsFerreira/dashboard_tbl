import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../models/answer/new_answer_model.dart';

part 'cadaster_question_controller.g.dart';

class CadasterQuestionController = _CadasterQuestionControllerBase
    with _$CadasterQuestionController;

abstract class _CadasterQuestionControllerBase with Store {
  final controllerNumberQuestions = TextEditingController();

  _CadasterQuestionControllerBase() {
    controllerNumberQuestions.text = '0';
  }

  @observable
  int numberQuestions = 0;

  @observable
  List<NewAnswerModel> answers = [];

  @action
  void setDescriptionAnswer(int index, String value) {
    final answer = answers[index];
    answers[index] = answer.copyWith(description: value);
  }

  @action
  void setScoreAnswer(int index, String value) {
    final answer = answers[index];
    final score = int.tryParse(value);
    if (score != null) {
      answers[index] = answer.copyWith(score: score);
    }
  }

  @action
  void setCorrectAnswer(int index, bool? value) {
    final answer = answers[index];
    answers[index] = answer.copyWith(correct: value);
  }

  @action
  void increment() {
    numberQuestions++;
    controllerNumberQuestions.text = numberQuestions.toString();
    final answer = NewAnswerModel.empty();
    answers.add(answer);
  }

  @action
  void decrement() {
    if (numberQuestions > 0) {
      numberQuestions--;
      controllerNumberQuestions.text = numberQuestions.toString();
      answers.removeLast();
    }
  }
}
