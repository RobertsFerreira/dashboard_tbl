import 'dart:convert';

import 'package:dashboard_tbl/features/quiz/models/question/new_question_model.dart';
import 'package:dashboard_tbl/features/users/models/user_model.dart';
import 'package:dashboard_tbl/utils/hasura/helper_extensions.dart';

import '../../group/models/group_model.dart';
import 'quiz_default_model.dart';

class NewQuizModel extends QuizDefaultModel {
  final List<GroupModel> groups;
  NewQuizModel({
    required super.idClass,
    required super.teacher,
    required super.date,
    required super.numberQuestion,
    required super.idCompany,
    required super.questions,
    required this.groups,
    required super.title,
  });

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
      idClass: idClass ?? this.idClass,
      teacher: teacher ?? this.teacher,
      date: date ?? this.date,
      numberQuestion: numberQuestion ?? this.numberQuestion,
      idCompany: idCompany ?? this.idCompany,
      questions: questions ?? this.questions,
      groups: groups ?? this.groups,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_class': idClass,
      'id_user': teacher.id,
      'date': date.toDateHasura(),
      'number_question': numberQuestion,
      'id_company': idCompany,
      'questions': questions
          .map(
            (e) => (e as NewQuestionModel).toMap(),
          )
          .toList(),
      'groups': groups.map((e) => e.toMap()).toList(),
      'title': title,
    };
  }

  String toJson() => jsonEncode(toMap());
}
