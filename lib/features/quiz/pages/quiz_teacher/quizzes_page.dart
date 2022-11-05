import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/components/buttons/custom_button_default.dart';
import '../../controller/quizzes_controller.dart';
import 'cadaster_quiz/quiz_cadaster_page.dart';
import 'vinculo_quiz/vinculo_quiz.dart';

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
                        width: 120,
                        icon: Icons.search,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VinculoQuiz(),
                            ),
                          );
                        },
                        text: 'Liberar Quiz',
                      ),
                      const SizedBox(width: 20),
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
                        child: ListTile(
                          title: Text(
                            quiz.title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          subtitle: Text(
                            'Número de questões: ${quiz.numberQuestion}',
                          ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) {
                return const QuizCadasterPage();
              },
            ),
          );
        },
        child: const Icon(Icons.add_to_queue_outlined),
      ),
    );
  }

  void getQuizzesForDate() async {
    await controller.getAllQuizzes();
  }
}
