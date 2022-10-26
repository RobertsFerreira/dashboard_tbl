import 'package:dashboard_tbl/utils/hasura/helper_extensions.dart';
import 'package:map_fields/map_fields.dart';

import '../../users/models/user_model.dart';
import 'question/quiz_question_model.dart';
import 'quiz_default_model.dart';

class QuizModel extends QuizDefaultModel {
  final String id;

  QuizModel({
    required this.id,
    required super.idClass,
    required super.teacher,
    required super.date,
    required super.numberQuestion,
    required super.idCompany,
    required super.questions,
    required super.title,
  });

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    final mapFields = MapFields.load(map);
    final user = mapFields.getMap<String, dynamic>('user');
    final questionsMap = mapFields.getList<Map<String, dynamic>>('questions');
    return QuizModel(
      id: mapFields.getString('id'),
      idClass: mapFields.getString('id_class'),
      teacher: UserModel.fromMap(user),
      date: mapFields.getDateTime('date'),
      numberQuestion: mapFields.getInt('number_question'),
      idCompany: mapFields.getString('id_company'),
      questions: questionsMap.map((e) => QuestionModel.fromMap(e)).toList(),
      title: mapFields.getString('title'),
    );
  }

  Map<String, dynamic> toUpdate() {
    return {
      'id': id,
      'id_class': idClass,
      'id_user': teacher.id,
      'date': date.toDateHasura(),
      'number_question': numberQuestion,
      'id_company': idCompany,
      'title': title,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_class': idClass,
      'id_user': teacher.toMap(),
      'date': date.toDateHasura(),
      'number_question': numberQuestion,
      'id_company': idCompany,
      'questions': questions.map((e) => (e as QuestionModel).toMap()).toList(),
      'title': title,
    };
  }
}
