import '../../users/models/user_model.dart';
import 'question/question_default_model.dart';

class QuizDefaultModel {
  final String idClass;
  final UserModel teacher;
  final DateTime date;
  final int numberQuestion;
  final String idCompany;
  final String title;
  final List<QuestionDefaultModel> questions;

  QuizDefaultModel({
    required this.idClass,
    required this.teacher,
    required this.date,
    required this.numberQuestion,
    required this.idCompany,
    required this.questions,
    required this.title,
  });
}
