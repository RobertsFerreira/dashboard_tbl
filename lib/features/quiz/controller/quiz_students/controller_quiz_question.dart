import 'package:dashboard_tbl/features/quiz/external/quiz_student/quiz_student_external.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/infra/clients/dio_client.dart';
import '../../models/answer/answer_model.dart';
import '../../models/answer/answer_student.dart';
import '../../models/question/quiz_question_model.dart';
import '../../models/quiz_model.dart';

part 'controller_quiz_question.g.dart';

class ControllerQuizQuestion = _ControllerQuizQuestionBase
    with _$ControllerQuizQuestion;

abstract class _ControllerQuizQuestionBase with Store {
  final QuizStudentsExternal _quizStudentsExternal =
      QuizStudentsExternal(DioClient());
  final QuizModel quiz;
  _ControllerQuizQuestionBase(this.quiz) {
    _init(quiz);
  }

  @observable
  String message = '';

  @observable
  int currentIndex = 0;

  @observable
  double progress = 0;

  @action
  void setProgress() {
    final progressAnswer =
        answersQuestionsStudents.length / quiz.numberQuestion;
    progress = progressAnswer;
  }

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
    answerStudent = answerStudent;
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
      final indexStudent = answerStudent.indexOf(answer);
      answer = answer.setScoreValide();
      answerStudent[indexStudent] = answer;
    }
    if (index != null) {
      answersQuestionsStudents[index] = answerStudent;
    } else {
      answersQuestionsStudents.add(answerStudent);
    }
    if (answerStudent.any((answer) => answer.pointSelect > 0)) {
      setProgress();
    }
  }

  @action
  Future<void> insertAnswersUSer() async {
    try {
      saveAnswersStudent();
      if (answersQuestionsStudents.isNotEmpty) {
        for (final answerStudent in answersQuestionsStudents) {
          final result =
              await _quizStudentsExternal.insertAnswersUSer(answerStudent);

          if (!result) {
            throw Exception('Erro ao salvar as respostas');
          }
        }
      }
    } catch (e) {
      message = e.toString();
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
