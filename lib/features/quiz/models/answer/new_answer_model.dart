import 'dart:convert';

import 'package:map_fields/map_fields.dart';

import 'answer_default_model.dart';

class NewAnswerModel extends AnswerDefaultModel {
  NewAnswerModel({
    required super.idCompany,
    required super.description,
    required super.correct,
    required super.score,
  });

  bool get isValidAnswer {
    return idCompany.isEmpty && description.isNotEmpty && score >= 0;
  }

  //copyWith
  NewAnswerModel copyWith({
    String? idCompany,
    String? description,
    bool? correct,
    int? score,
  }) {
    return NewAnswerModel(
      idCompany: idCompany ?? this.idCompany,
      description: description ?? this.description,
      correct: correct ?? this.correct,
      score: score ?? this.score,
    );
  }

  factory NewAnswerModel.fromMap(Map<String, dynamic> map) {
    final mapFields = MapFields.load(map);
    return NewAnswerModel(
      idCompany: mapFields.getString('id_company', ''),
      description: mapFields.getString('description', ''),
      correct: mapFields.getBool('correct', false),
      score: mapFields.getInt('score', -1),
    );
  }

  factory NewAnswerModel.empty() {
    return NewAnswerModel(
      idCompany: '',
      description: '',
      correct: false,
      score: -1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_company': idCompany,
      'description': description,
      'correct': correct,
      'score': score,
    };
  }

  factory NewAnswerModel.fromJson(String source) =>
      NewAnswerModel.fromMap(jsonDecode(source));

  String toJson() => jsonEncode(toMap());
}
