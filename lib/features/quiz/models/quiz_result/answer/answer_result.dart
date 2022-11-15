import 'package:map_fields/map_fields.dart';

import '../answer_group/answer_group.dart';
import '../answer_user/answer_user.dart';

class AnswerResult {
  final String description;
  final double score;
  final bool correct;
  final List<AnswerGroup> answersGroup;
  final List<AnswerUser> answersUser;

  AnswerResult({
    required this.description,
    required this.score,
    required this.correct,
    required this.answersGroup,
    required this.answersUser,
  });

  factory AnswerResult.fromMap(Map<String, dynamic> map) {
    final mapFields = MapFields.load(map);
    final answersGroupMap =
        mapFields.getList<Map<String, dynamic>>('answer_groups');
    final answersUserMap =
        mapFields.getList<Map<String, dynamic>>('answer_users');

    return AnswerResult(
        description: mapFields.getString('description'),
        score: mapFields.getDouble('score'),
        correct: mapFields.getBool('correct'),
        answersGroup: answersGroupMap
            .map(
              (answerGroup) => AnswerGroup.fromMap(answerGroup),
            )
            .toList(),
        answersUser: answersUserMap
            .map(
              (answerUser) => AnswerUser.fromMap(answerUser),
            )
            .toList());
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'score': score,
      'correct': correct,
      'answer_groups': answersGroup
          .map(
            (answerGroup) => answerGroup.toMap(),
          )
          .toList(),
      'answer_users': answersUser
          .map(
            (answerUser) => answerUser.toMap(),
          )
          .toList(),
    };
  }

  Map<String, double> get pointsUser {
    final pointsUser = <String, double>{};

    final users = answersUser.map((e) => e.userName).toList();

    for (var user in users) {
      final pointsUsers = answersUser
          .where((answer) => answer.userName == user)
          .map((answer) => answer.scoredScore)
          .toList();

      final points = pointsUsers.fold(0.0, (total, value) => total + value);
      pointsUser[user] = points;
    }
    return pointsUser;
  }

  Map<String, double> get pointsGroup {
    final pointsGroup = <String, double>{};

    final groups = answersGroup.map((e) => e.referenceGroup).toList();

    for (var group in groups) {
      final pointsGroups = answersGroup
          .where((answer) => answer.referenceGroup == group)
          .map((answer) => answer.score)
          .toList();
      final points = pointsGroups.fold(0.0, (total, value) => total + value);
      pointsGroup[group] = points;
    }
    return pointsGroup;
  }
}
