import 'dart:developer';

import 'package:dashboard_tbl/core/infra/clients/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../external/quiz_external.dart';
import '../../models/answer/new_answer_model.dart';
import '../../models/new_quiz_model.dart';
import '../../models/question/new_question_model.dart';

part 'cadaster_question_controller.g.dart';

class CadasterQuestionController = _CadasterQuestionControllerBase
    with _$CadasterQuestionController;

abstract class _CadasterQuestionControllerBase with Store {
  final quizService = QuizExternal(DioClient());
  final NewQuizModel quiz;

  _CadasterQuestionControllerBase({required this.quiz}) {
    setQuiz(quiz);
    controllerNumberAnswers.text = '0';
    controllerDescriptionQuestion.text = '';
  }

  final controllerNumberAnswers = TextEditingController();
  final controllerDescriptionQuestion = TextEditingController();

  @observable
  late NewQuizModel newQuiz = quiz;

  @action
  void setQuiz(NewQuizModel value) {
    newQuiz = quiz;
  }

  @observable
  bool loading = false;

  @observable
  String messageError = '';

  @observable
  int numberAnswers = 0;

  @observable
  List<NewAnswerModel> answers = [];

  @observable
  String descriptionQuestion = '';

  @action
  void setDescriptionQuestion(String value) => descriptionQuestion = value;

  @action
  void setDescriptionAnswer(int index, String value) {
    answers[index] = answers[index].copyWith(description: value);
    answers = answers;
  }

  @action
  void setScoreAnswer(int index, String value) {
    final answer = answers[index];
    final score = int.tryParse(value);
    if (score != null) {
      answers[index] = answer.copyWith(score: score);
      answers = answers;
    }
  }

  @action
  void setCorrectAnswer(int index, NewAnswerModel answer, bool? value) {
    answers[index] = answer.copyWith(correct: value);
    answers = answers;
  }

  @computed
  bool get containsCorrectAnswer =>
      answers.any((answer) => answer.correct == true);

  @computed
  bool get saveQuestion {
    return newQuiz.questions.length + 1 == quiz.numberQuestion ||
        newQuiz.questions.length + 1 == quiz.numberQuestion + 1;
  }

  @computed
  bool get canSave {
    return newQuiz.questions.length == quiz.numberQuestion ||
        (descriptionQuestion.isNotEmpty &&
            numberAnswers > 0 &&
            containsCorrectAnswer &&
            answers.every((answer) => answer.score == 4));
  }

  @action
  void addQuestion() {
    final newQuestion = NewQuestionModel(
      idCompany: quiz.idCompany,
      description: descriptionQuestion,
      numberAnswer: numberAnswers,
      answers: answers,
    );
    newQuiz.questions.add(newQuestion);
    newQuiz = newQuiz.copyWith(
      questions: newQuiz.questions.cast<NewQuestionModel>(),
    );
    clearFields();
  }

  @action
  void incrementNumberAnswers() {
    numberAnswers++;
    controllerNumberAnswers.text = numberAnswers.toString();
    final answer =
        NewAnswerModel.empty().copyWith(idCompany: quiz.idCompany, score: 4);
    answers.add(answer);
  }

  @action
  void decrementNumberAnswers() {
    if (numberAnswers > 0) {
      numberAnswers--;
      controllerNumberAnswers.text = numberAnswers.toString();
      answers.removeLast();
    }
  }

  Future<bool> saveQuiz() async {
    loading = true;
    messageError = '';
    try {
      if (newQuiz.questions.length < quiz.numberQuestion) addQuestion();
      final result = await quizService.insertQuiz(quiz);
      return result;
    } catch (e) {
      messageError = e.toString();
      log(e.toString());
      return false;
    } finally {
      loading = false;
    }
  }

  void clearFields() {
    numberAnswers = 0;
    controllerNumberAnswers.text = '0';
    answers = [];
    descriptionQuestion = '';
    controllerDescriptionQuestion.text = '';
  }
}
