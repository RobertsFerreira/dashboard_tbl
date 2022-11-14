import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/components/buttons/custom_button_default.dart';
import '../../../../core/infra/clients/dio_client.dart';
import '../../external/quiz_student/quiz_student_external.dart';
import '../../models/answer/answer_model.dart';
import '../../models/answer/answer_student.dart';
import '../../models/question/quiz_question_model.dart';
import '../../models/quiz_model.dart';

part 'quiz_group_controller.g.dart';

class QuizGroupController = _QuizGroupControllerBase with _$QuizGroupController;

abstract class _QuizGroupControllerBase with Store {
  final quizStudent = QuizStudentsExternal(DioClient());

  final QuizModel quiz;

  _QuizGroupControllerBase(this.quiz) {
    _init(quiz);
  }

  @observable
  int _limitScoreAnswer = 0;

  @observable
  int currentIndex = 0;

  @observable
  List<int> remainingScore = [];

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

  @observable
  double progress = 0;

  @observable
  bool needApelacao = false;

  @observable
  String apelacao = '';

  @action
  void setApelacao(String value) => apelacao = value;

  @action
  void setNeedApelacao() => needApelacao = !needApelacao;

  @action
  void _init(QuizModel quiz) {
    questions = quiz.questions.cast<QuestionModel>();
    currentQuestion = questions[currentIndex];
    answers = currentQuestion.answers.cast<AnswerModel>();
    final limits =
        currentQuestion.answers.map((e) => (e).score).toSet().toList();
    if (limits.length > 1) {
      _limitScoreAnswer = 4;
    }
    _limitScoreAnswer = limits.first;
    answerStudent = List.generate(
      currentQuestion.numberAnswer,
      (index) {
        final answer = answers[index];
        List<AnswerStudent> containsAnswer = [];
        if (answersQuestionsStudents.isNotEmpty) {
          for (var answersQ in answersQuestionsStudents) {
            containsAnswer = [
              ...containsAnswer,
              ...answersQ
                  .where(
                    (ans) => ans.id == answer.id,
                  )
                  .toList(),
            ];
          }
        }
        return AnswerStudent(
          id: answer.id,
          idCompany: answer.idCompany,
          idQuestion: answer.idQuestion,
          description: answer.description,
          limitScore: answer.score,
          pointSelect: 0,
          correct: answer.correct,
          index: index,
          showResult: containsAnswer.isNotEmpty
              ? containsAnswer.first.showResult
              : false,
        );
      },
    );
  }

  @computed
  String get questionIndex {
    final numberQuestion = currentIndex + 1;
    return 'Questão $numberQuestion - Pontuação Restante: $_limitScoreAnswer';
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

  @action
  void setProgress() {
    final progressAnswer =
        answersQuestionsStudents.length / quiz.numberQuestion;
    progress = progressAnswer;
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
      final indexStudent = answerStudent.indexOf(answer);
      answer = answer.setScoreValide();
      answerStudent[indexStudent] = answer;
    }
    if (index != null) {
      answersQuestionsStudents[index] = answerStudent;
    } else {
      answersQuestionsStudents.add(answerStudent);
    }
    setProgress();
  }

  @action
  void validateCorrectQuestion(int index) {
    AnswerStudent answer = answerStudent[index];
    answer = answer.copyWith(pointSelect: _limitScoreAnswer);
    answerStudent[index] = answer;
    if (answer.correct) {
      answerStudent =
          answerStudent.map((e) => e.copyWith(showResult: true)).toList();
    } else {
      _limitScoreAnswer -= 1;
      answer = answer.copyWith(showResult: true);
      answerStudent[index] = answer;
    }
    // remainingScore.add(_limitScoreAnswer);
    answerStudent = answerStudent;
  }

  @action
  Future<bool> insertAnswersUSer() async {
    try {
      saveAnswersStudent();
      if (answersQuestionsStudents.isNotEmpty) {
        for (final answerStudent in answersQuestionsStudents) {
          final result = await quizStudent.insertAnswersGroup(
            answerStudent,
            quiz.id,
            quiz.idGroup ?? '',
            quiz.date ?? DateTime.now(),
          );

          if (!result) {
            throw Exception('Erro ao salvar as respostas');
          }
        }
      }
      await asuka.Asuka.showDialog(
        barrierColor: Colors.black.withOpacity(.5),
        barrierDismissible: false,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Sucesso'),
            content: const Text(
              'Respostas salvas com sucesso',
            ),
            actions: [
              CustomButtonDefault(
                text: 'OK',
                onTap: () => Navigator.of(ctx).pop(),
              ),
            ],
          );
        },
      );
      return true;
    } catch (e) {
      asuka.Asuka.showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
      return false;
    }
  }

  @action
  Future<bool> saveApelacao() async {
    try {
      if (apelacao.isNotEmpty) {
        return await quizStudent.insertApelacao(
          apelacao,
          quiz.id,
          quiz.idGroup ?? '',
        );
      } else {
        return false;
      }
    } catch (e) {
      asuka.Asuka.showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
      return false;
    }
  }
}
