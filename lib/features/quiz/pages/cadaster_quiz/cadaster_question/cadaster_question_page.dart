import 'package:dashboard_tbl/features/quiz/models/new_quiz_model.dart';
import 'package:flutter/material.dart';

class CadasterQuestionPage extends StatefulWidget {
  final NewQuizModel newQuiz;
  const CadasterQuestionPage({
    super.key,
    required this.newQuiz,
  });

  @override
  State<CadasterQuestionPage> createState() => _CadasterQuestionPageState();
}

class _CadasterQuestionPageState extends State<CadasterQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadaster Question'),
      ),
      body: Center(
        child: Text(widget.newQuiz.title),
      ),
    );
  }
}
