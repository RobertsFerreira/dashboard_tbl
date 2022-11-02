import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../models/answer/answer_model.dart';
import '../../models/answer/answer_student.dart';
import '../../models/question/quiz_question_model.dart';
import '../../models/quiz_model.dart';

part 'controller_quiz_question.g.dart';

class ControllerQuizQuestion = _ControllerQuizQuestionBase
    with _$ControllerQuizQuestion;

abstract class _ControllerQuizQuestionBase with Store {
  final QuizModel quiz;
  _ControllerQuizQuestionBase(this.quiz) {
    _init(quiz);
  }

  @observable
  int currentIndex = 0;

  @observable
  double progress = 0;

  @action
  void setProgress(double value) => progress = value;

  @action
  void setCurrentIndex(int value) => currentIndex = value;

  @observable
  List<QuestionModel> questions = [];

  @observable
  QuestionModel currentQuestion = QuestionModel.empty();

  @observable
  List<AnswerModel> answers = [];

  @observable
  List<AnswerStudent> answerStudent = [];

  @observable
  List<List<AnswerStudent>> answersQuestionsStudents = [];

  @action
  void _init(QuizModel quiz) {
    questions = quiz.questions.cast<QuestionModel>();
    currentQuestion = questions[currentIndex];
    answers = currentQuestion.answers.cast<AnswerModel>();
    answerStudent = List.generate(
      currentQuestion.numberAnswer,
      (index) {
        final answer = answers[index];
        return AnswerStudent(
          id: answer.id,
          idCompany: answer.idCompany,
          idQuestion: answer.idQuestion,
          description: answer.description,
          limitScore: answer.score,
          pointSelect: 0,
          correct: answer.correct,
          index: index,
        );
      },
    );
  }

  @action
  void setSelectPoint(int? value, int index) {
    if (value != null) {
      AnswerStudent answer = answerStudent[index];
      answer = answer.copyWith(pointSelect: value);
      answerStudent[index] = answer;
    }
  }

  @computed
  String get questionIndex {
    final numberQuestion = currentIndex + 1;
    return 'Questão $numberQuestion';
  }

  @action
  String indexProgress(double progress) {
    final index = ((progress * 10).round()) + 1;
    if (progress < .9) {
      return 'Questão $index';
    } else {
      return 'Questão ${index - 1}';
    }
  }

  @action
  void saveAnswersStudent() {
    int? index;
    for (var answers in answersQuestionsStudents) {
      for (var answer in answers) {
        if (answerStudent.where((a) => a.id == answer.id).isNotEmpty) {
          index = answersQuestionsStudents.indexOf(answers);
        }
      }
    }
    for (var answer in answerStudent) {
      final index = answerStudent.indexOf(answer);
      answer = answer.setScoreValide();
      answerStudent[index] = answer;
    }
    if (index != null) {
      answersQuestionsStudents[index] = answerStudent;
    } else {
      answersQuestionsStudents.add(answerStudent);
    }
  }

  @action
  void nextQuestion() {
    saveAnswersStudent();
    if (quiz.numberQuestion > currentIndex + 1) {
      currentIndex++;
      _init(quiz);
    }
  }

  @action
  void previousQuestion() {
    if (currentIndex > 0) {
      currentIndex--;
      _init(quiz);
    }
  }
}
