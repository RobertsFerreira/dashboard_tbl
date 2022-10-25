import 'package:flutter/material.dart';

import '../controller/quizzes_controller.dart';

class QuizzesPage extends StatefulWidget {
  const QuizzesPage({Key? key}) : super(key: key);

  @override
  State<QuizzesPage> createState() => _QuizzesPageState();
}

class _QuizzesPageState extends State<QuizzesPage> {
  final controller = QuizzesController();

  @override
  void initState() {
    super.initState();
    getQuizzesForDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Container());
  }

  void getQuizzesForDate() async {
    await controller.getAllQuizzes();
  }
}
