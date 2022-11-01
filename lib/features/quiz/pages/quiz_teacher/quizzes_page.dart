import 'package:dashboard_tbl/core/components/date_picker/custom_date_picker.dart';
import 'package:dashboard_tbl/utils/extensions/custom_extension_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/components/buttons/custom_button_default.dart';
import '../../controller/quizzes_controller.dart';
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
                  const Text('Quizzes da Turma 1'),
                  Observer(
                    builder: (_) {
                      final dataInicial = controller.dataInicial;
                      final dataFinal = controller.dataFinal;
                      return Row(
                        children: [
                          CustomButtonDefault(
                            width: 150,
                            icon: Icons.calendar_month,
                            onTap: () async {
                              final date = await customDatePicker(context);
                              controller.setDataInicial(date);
                            },
                            text: dataInicial.toStringFormatted(),
                          ),
                          const SizedBox(width: 10),
                          CustomButtonDefault(
                            width: 150,
                            icon: Icons.calendar_month,
                            onTap: () async {
                              final date = await customDatePicker(context);
                              controller.setDataFinal(date);
                            },
                            text: dataFinal.toStringFormatted(),
                          ),
                          const SizedBox(width: 10),
                          CustomButtonDefault(
                            width: 120,
                            icon: Icons.search,
                            onTap: controller.getAllQuizzes,
                            text: 'Buscar',
                          ),
                        ],
                      );
                    },
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
                return Expanded(
                  child: ListView.builder(
                    itemCount: quizzes.length,
                    itemBuilder: (_, index) {
                      final quiz = quizzes[index];
                      return Card(
                        child: ListTile(
                          title: Text(
                            '${quiz.title} - Professor Aplicador: ${quiz.teacher.name}',
                          ),
                          subtitle: Text(
                            'Número de questões: ${quiz.numberQuestion}',
                          ),
                          trailing: Text(
                            'Data: ${quiz.date.toStringFormatted()}',
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
