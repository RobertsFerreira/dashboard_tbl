import 'dart:convert';

import 'package:map_fields/map_fields.dart';

import 'answer_default_model.dart';

class NewAnswerModel extends AnswerDefaultModel {
  NewAnswerModel({
    required super.idCompany,
    required super.idQuestion,
    required super.description,
    required super.correct,
    required super.score,
  });

  //copyWith
  NewAnswerModel copyWith({
    String? idCompany,
    String? idQuestion,
    String? description,
    bool? correct,
    int? score,
  }) {
    return NewAnswerModel(
      idCompany: idCompany ?? this.idCompany,
      idQuestion: idQuestion ?? this.idQuestion,
      description: description ?? this.description,
      correct: correct ?? this.correct,
      score: score ?? this.score,
    );
  }

  factory NewAnswerModel.fromMap(Map<String, dynamic> map) {
    final mapFields = MapFields.load(map);
    return NewAnswerModel(
      idCompany: mapFields.getString('id_company', ''),
      idQuestion: mapFields.getString('id_question', ''),
      description: mapFields.getString('description', ''),
      correct: mapFields.getBool('correct', false),
      score: mapFields.getInt('score', -1),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_company': idCompany,
      'id_question': idQuestion,
      'description': description,
      'correct': correct,
      'score': score,
    };
  }

  factory NewAnswerModel.fromJson(String source) =>
      NewAnswerModel.fromMap(jsonDecode(source));

  String toJson() => jsonEncode(toMap());
}
