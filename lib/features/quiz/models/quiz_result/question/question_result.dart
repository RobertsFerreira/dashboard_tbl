import 'package:map_fields/map_fields.dart';

import '../answer/answer_result.dart';

class QuestionResult {
  final String description;
  final List<AnswerResult> answersResult;

  QuestionResult({
    required this.description,
    required this.answersResult,
  });

  factory QuestionResult.fromMap(Map<String, dynamic> map) {
    final mapFields = MapFields.load(map);
    final answersResultMap = mapFields.getList<Map<String, dynamic>>('answers');

    return QuestionResult(
      description: mapFields.getString('description'),
      answersResult: answersResultMap
          .map((answer) => AnswerResult.fromMap(answer))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'answers': answersResult
          .map(
            (answer) => answer.toMap(),
          )
          .toList(),
    };
  }

  Map<String, double> get pointsUserOfQuestion {
    final mapAnswersUser = answersResult
        .map(
          (answer) => answer.pointsUser,
        )
        .toList();

    Map<String, double> pointsMap = <String, double>{};

    for (var answer in mapAnswersUser) {
      final keys = answer.keys.toList();
      for (var key in keys) {
        double points = 0;
        points += answer[key]!;
        final total = pointsMap[key] ?? 0;
        pointsMap[key] = (total + points);
      }
    }

    return pointsMap;
  }

  Map<String, double> get pointsGroupOfQuestion {
    final mapAnswersGroup = answersResult
        .map(
          (answer) => answer.pointsGroup,
        )
        .toList();

    Map<String, double> pointsMap = <String, double>{};

    for (var answer in mapAnswersGroup) {
      final keys = answer.keys.toList();
      for (var key in keys) {
        double points = 0;
        points += answer[key]!;
        final total = pointsMap[key] ?? 0;
        pointsMap[key] = (total + points);
      }
    }

    return pointsMap;
  }
}
