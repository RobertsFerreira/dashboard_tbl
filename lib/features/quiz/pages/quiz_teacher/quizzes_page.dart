import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/components/buttons/custom_button_default.dart';
import '../../controller/quiz_teacher/quizzes_controller.dart';
import '../../models/question/question_default_model.dart';
import '../../models/quiz_model.dart';
import 'cadaster_quiz/quiz_cadaster_page.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzes'),
      ),
      body: SizedBox(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quizzes',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Row(
                    children: [
                      CustomButtonDefault(
                        width: 140,
                        icon: Icons.add_to_queue_outlined,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) {
                                return const QuizCadasterPage();
                              },
                            ),
                          );
                        },
                        text: 'Cadastrar Quiz',
                      ),
                      const SizedBox(width: 10),
                      CustomButtonDefault(
                        width: 120,
                        icon: Icons.search,
                        onTap: controller.getAllQuizzes,
                        text: 'Buscar',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            Observer(
              builder: (_) {
                final loading = controller.loading;
                final quizzes = controller.quizzes;
                final messageError = controller.message;
                if (loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (messageError.isNotEmpty) {
                  return Center(
                    child: Expanded(
                      child: Text(
                        messageError,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                }
                if (quizzes.isEmpty) {
                  return const Center(
                    child: Text('Nenhum quiz encontrado'),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: quizzes.length,
                    itemBuilder: (_, index) {
                      final quiz = quizzes[index];
                      return Card(
                        child: ExpansionTile(
                          title: Text(quiz.title),
                          subtitle: Text(
                            'Número de questões: ${quiz.numberQuestion}',
                          ),
                          children: [
                            for (final question in quiz.questions)
                              ListTile(
                                title: Text(titleQuestion(quiz, question)),
                                subtitle: Text(
                                  'Número de Respostas: ${question.numberAnswer}',
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void getQuizzesForDate() async {
    await controller.getAllQuizzes();
  }

  String titleQuestion(QuizModel quiz, QuestionDefaultModel question) {
    return '${quiz.questions.indexWhere((q) => q.description == question.description) + 1} - ${question.description}';
  }
}
