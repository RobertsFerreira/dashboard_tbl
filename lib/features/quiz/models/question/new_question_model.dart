import 'package:map_fields/map_fields.dart';

import '../answer/new_answer_model.dart';
import 'question_default_model.dart';

class NewQuestionModel extends QuestionDefaultModel {
  NewQuestionModel({
    required super.idCompany,
    required super.description,
    required super.numberAnswer,
    required super.answers,
  });

  NewQuestionModel copyWith({
    String? idCompany,
    String? description,
    int? numberAnswer,
    List<NewAnswerModel>? answers,
  }) {
    return NewQuestionModel(
      idCompany: idCompany ?? this.idCompany,
      description: description ?? this.description,
      numberAnswer: numberAnswer ?? this.numberAnswer,
      answers: answers ?? this.answers,
    );
  }

  factory NewQuestionModel.fromMap(Map<String, dynamic> map) {
    final mapFields = MapFields.load(map);
    final listAnswers = mapFields.getList('answers', []);
    return NewQuestionModel(
      idCompany: mapFields.getString('id_company', ''),
      description: mapFields.getString('description', ''),
      numberAnswer: mapFields.getInt('number_answer', -1),
      answers: listAnswers.map((e) => NewAnswerModel.fromMap(e)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_company': idCompany,
      'description': description,
      'number_answer': numberAnswer,
    };
  }
}
