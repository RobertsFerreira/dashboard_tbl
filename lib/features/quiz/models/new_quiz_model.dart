import 'dart:convert';

import 'package:dashboard_tbl/features/quiz/models/question/new_question_model.dart';
import 'package:dashboard_tbl/features/users/models/user_model.dart';

import '../../group/models/group_model.dart';
import 'quiz_default_model.dart';

class NewQuizModel extends QuizDefaultModel {
  NewQuizModel({
    required super.teacher,
    required super.numberQuestion,
    required super.idCompany,
    required super.questions,
    required super.title,
  });

  bool get isValidQuestions {
    return questions.length == numberQuestion &&
        questions.isNotEmpty &&
        questions.every(
          (question) => (question as NewQuestionModel).isValidQuestion,
        );
  }

  NewQuizModel copyWith({
    String? idClass,
    UserModel? teacher,
    DateTime? date,
    int? numberQuestion,
    String? idCompany,
    List<NewQuestionModel>? questions,
    List<GroupModel>? groups,
    String? title,
  }) {
    return NewQuizModel(
      teacher: teacher ?? this.teacher,
      numberQuestion: numberQuestion ?? this.numberQuestion,
      idCompany: idCompany ?? this.idCompany,
      questions: questions ?? this.questions,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': teacher.toMap(),
      'number_question': numberQuestion,
      'id_company': idCompany,
      'questions': questions
          .map(
            (e) => (e as NewQuestionModel).toMap(),
          )
          .toList(),
      'title': title,
    };
  }

  String toJson() => jsonEncode(toMap());
}
