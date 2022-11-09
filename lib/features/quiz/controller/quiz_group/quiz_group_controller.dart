import 'package:mobx/mobx.dart';

import '../../models/answer/answer_model.dart';
import '../../models/answer/answer_student.dart';
import '../../models/question/quiz_question_model.dart';
import '../../models/quiz_model.dart';

part 'quiz_group_controller.g.dart';

class QuizGroupController = _QuizGroupControllerBase with _$QuizGroupController;

abstract class _QuizGroupControllerBase with Store {
  final QuizModel quiz;

  _QuizGroupControllerBase(this.quiz);

  Map<int, bool> showResults = {};

  @observable
  int _limitScoreAnswer = 0;

  @observable
  int currentIndex = 0;

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
    for (var answer in answers) {
      final index = answers.indexOf(answer);
      showResults[index] = false;
    }
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

  @computed
  String get questionIndex {
    final numberQuestion = currentIndex + 1;
    return 'Questão $numberQuestion';
  }

  @action
  void nextQuestion() {
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
  }

  @action
  void validateCorrectQuestion(int index) {
    AnswerStudent answer = answerStudent[index];
    answer = answer.copyWith(pointSelect: _limitScoreAnswer);
    answerStudent[index] = answer;
    _limitScoreAnswer = -1;
    showResults[index] = true;
  }
}
