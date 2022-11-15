import 'package:flutter/material.dart';
import 'package:map_fields/map_fields.dart';

import 'question/question_result.dart';

class QuizResult {
  final String title;
  final List<QuestionResult> questionsResult;

  QuizResult({
    required this.title,
    required this.questionsResult,
  });

  factory QuizResult.fromMap(Map<String, dynamic> map) {
    final mapFields = MapFields.load(map);
    final questionsResultMap =
        mapFields.getList<Map<String, dynamic>>('questions');

    return QuizResult(
      title: mapFields.getString('title'),
      questionsResult: questionsResultMap
          .map(
            (questionResult) => QuestionResult.fromMap(questionResult),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questionsResult
          .map(
            (question) => question.toMap(),
          )
          .toList(),
    };
  }

  Map<String, double> get _totalPointsUser {
    Map<String, double> mapsTotalUsers = <String, double>{};

    for (var question in questionsResult) {
      final pointsUserOfQuestion = question.pointsUserOfQuestion;
      final keys = pointsUserOfQuestion.keys.toList();
      for (var key in keys) {
        double points = 0;
        points += pointsUserOfQuestion[key]!;
        final total = mapsTotalUsers[key] ?? 0;
        mapsTotalUsers[key] = (total + points);
      }
    }
    return mapsTotalUsers;
  }

  Map<String, double> get _totalPointsGroups {
    Map<String, double> mapsTotalGroups = <String, double>{};

    for (var question in questionsResult) {
      final pointsGroupOfQuestion = question.pointsGroupOfQuestion;
      final keys = pointsGroupOfQuestion.keys.toList();
      for (var key in keys) {
        double points = 0;
        points += pointsGroupOfQuestion[key]!;
        final total = mapsTotalGroups[key] ?? 0;
        mapsTotalGroups[key] = (total + points);
      }
    }
    return mapsTotalGroups;
  }

  List<Widget> get totalWidget {
    List<Widget> listTotal = [];
    for (var key in _totalPointsUser.keys) {
      listTotal.add(
        Text(
          'Aluno: $key -- Total: ${_totalPointsUser[key]} pontos',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return listTotal;
  }

  List<Widget> get totalGroupWidget {
    List<Widget> listTotal = [];
    for (var key in _totalPointsGroups.keys) {
      listTotal.add(
        Text(
          'Grupo: $key -- Total: ${_totalPointsGroups[key]} pontos',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return listTotal;
  }
}
