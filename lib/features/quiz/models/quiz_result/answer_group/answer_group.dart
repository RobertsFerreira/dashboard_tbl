import 'package:map_fields/map_fields.dart';

class AnswerGroup {
  final double score;
  final String referenceGroup;

  AnswerGroup({
    required this.score,
    required this.referenceGroup,
  });

  factory AnswerGroup.fromMap(Map<String, dynamic> map) {
    final mapFields = MapFields.load(map);

    return AnswerGroup(
      score: mapFields.getDouble('score'),
      referenceGroup: mapFields.getString('group'),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'score': score,
      'group': referenceGroup,
    };
  }
}
