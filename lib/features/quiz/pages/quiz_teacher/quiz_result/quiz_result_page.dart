import 'package:dashboard_tbl/features/quiz/models/quiz_result/quiz_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../components/quiz_result_components/answer_title_component.dart';
import '../../../components/quiz_result_components/answer_user_component.dart';

class QuizResultPage extends StatefulWidget {
  final String idQuiz;
  final dynamic controller;
  const QuizResultPage({
    Key? key,
    required this.idQuiz,
    required this.controller,
  }) : super(key: key);

  @override
  State<QuizResultPage> createState() => _QuizResultPageState();
}

class _QuizResultPageState extends State<QuizResultPage> {
  @override
  void initState() {
    super.initState();
    getResults();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
      ),
      body: Observer(
        builder: (_) {
          final loading = controller.loading;
          final quizzes = controller.quizResults;
          final widgetsTotal = quizzes.map((e) => e.totalWidget).toList();
          final widgetGroup = quizzes.map((e) => e.totalGroupWidget).toList();

          if (loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (quizzes.isEmpty) {
            return const Center(
              child: Text('Nenhum resultado encontrado'),
            );
          }
          final QuizResult quizResult = quizzes.first;
          final questions = quizResult.questionsResult;
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ListTile(
                      title: Text(
                        quizResult.title,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        'Número de questões: ${quizResult.questionsResult.length}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: questions.length,
                      itemBuilder: (_, index) {
                        final questionResult = questions[index];
                        final answers = questionResult.answersResult;
                        return Column(
                          children: [
                            Card(
                              child: ExpansionTile(
                                title: Text(
                                  questionResult.description,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: answers.length,
                                    itemBuilder: (_, index) {
                                      final answerResult = answers[index];
                                      final answersUser =
                                          answerResult.answersUser;
                                      final answersGroup =
                                          answerResult.answersGroup;
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            AnswerTitleComponent(
                                              title: answerResult.description,
                                              numberQuestions: index + 1,
                                              isCorrect: answerResult.correct,
                                            ),
                                            Text('-' * 155),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: answersUser.length,
                                              itemBuilder: (_, index) {
                                                final student =
                                                    answersUser[index];
                                                return AnswerUserComponent(
                                                  userName: student.userName,
                                                  scoreAnswered:
                                                      student.scoreAnswered,
                                                  scoreValid:
                                                      student.scoredScore,
                                                );
                                              },
                                            ),
                                            const Divider(),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: answersGroup.length,
                                              itemBuilder: (_, index) {
                                                final group =
                                                    answersGroup[index];
                                                return Row(
                                                  children: [
                                                    const Text('Grupo: '),
                                                    Text(group.referenceGroup),
                                                    const Spacer(),
                                                    const Text(
                                                      'Pontuação Validada: ',
                                                    ),
                                                    Text(
                                                      group.score.toString(),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                            if (index != answers.length - 1)
                                              const Divider(),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                            //
                            const Divider(),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Resultado final por Usuário',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    for (var widget in widgetsTotal) ...widget,
                    const SizedBox(height: 10),
                    const Divider(),
                    const Text(
                      'Resultado final por Grupo',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    for (var widget in widgetGroup) ...widget,
                    const SizedBox(height: 50),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> getResults() async {
    await widget.controller.getResultsOfQuiz(widget.idQuiz);
  }
}
