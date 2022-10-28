import '../answer/answer_default_model.dart';

class QuestionDefaultModel {
  final String idCompany;
  final String description;
  final int numberAnswer;
  final List<AnswerDefaultModel> answers;

  QuestionDefaultModel({
    required this.idCompany,
    required this.description,
    required this.numberAnswer,
    required this.answers,
  });
}
