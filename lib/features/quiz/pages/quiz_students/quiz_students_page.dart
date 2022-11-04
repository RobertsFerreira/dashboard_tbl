import 'package:dashboard_tbl/utils/extensions/custom_extension_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/components/buttons/custom_button_default.dart';
import '../../../../core/components/date_picker/custom_date_picker.dart';
import '../../controller/quiz_students/controller_quiz_students.dart';
import 'quiz_question_student_page.dart';

class QuizStudentsPage extends StatefulWidget {
  const QuizStudentsPage({super.key});

  @override
  State<QuizStudentsPage> createState() => _QuizStudentsPageState();
}

class _QuizStudentsPageState extends State<QuizStudentsPage> {
  @override
  Widget build(BuildContext context) {
    final controller = ControllerQuizStudents();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzes'),
      ),
      body: Observer(
        builder: (_) {
          final dataIni = controller.from;
          final dataFim = controller.to;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    CustomButtonDefault(
                      text: 'Data: ${dataIni.toStringFormatted()}',
                      onTap: () async {
                        final date = await customDatePicker(context);
                        if (date != null) {
                          controller.setFrom(date);
                        }
                      },
                    ),
                    const SizedBox(width: 20),
                    CustomButtonDefault(
                      text: 'Data: ${dataFim.toStringFormatted()}',
                      onTap: () async {
                        final date = await customDatePicker(context);
                        if (date != null) {
                          controller.setTo(date);
                        }
                      },
                    ),
                    const SizedBox(width: 20),
                    CustomButtonDefault(
                      text: 'Buscar',
                      onTap: () async {
                        await controller.getAllQuizzes();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                Observer(
                  builder: (_) {
                    final loading = controller.loading;
                    final message = controller.message;
                    final quizzes = controller.quizzes;
                    if (loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (message.isNotEmpty) {
                      return SingleChildScrollView(
                        child: Center(
                          child: Text(message),
                        ),
                      );
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemCount: quizzes.length,
                        itemBuilder: (context, index) {
                          final quiz = quizzes[index];
                          return Card(
                            child: ListTile(
                              title: Text(quiz.title),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) {
                                      return QuizQuestionStudentPage(
                                        quiz: quiz,
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}