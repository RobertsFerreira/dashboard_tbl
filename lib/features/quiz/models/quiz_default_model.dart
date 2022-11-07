import '../../users/models/user_model.dart';
import 'question/question_default_model.dart';

class QuizDefaultModel {
  final UserModel teacher;
  final int numberQuestion;
  final String idCompany;
  final String title;
  final List<QuestionDefaultModel> questions;

  QuizDefaultModel({
    required this.teacher,
    required this.numberQuestion,
    required this.idCompany,
    required this.questions,
    required this.title,
  });
}
