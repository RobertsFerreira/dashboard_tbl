import 'package:dashboard_tbl/features/quiz/pages/quiz_students/quiz_question_student_page.dart';
import 'package:dashboard_tbl/utils/extensions/custom_extension_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/components/buttons/custom_button_default.dart';
import '../../../../core/components/date_picker/custom_date_picker.dart';
import '../../../../core/components/dropdown/custom_dropdown.dart';
import '../../controller/quiz_students/controller_quiz_students.dart';
import '../quiz_group/quiz_question_group_page.dart';
import '../quiz_teacher/quiz_result/quiz_result_page.dart';

class QuizStudentsPage extends StatefulWidget {
  const QuizStudentsPage({super.key});

  @override
  State<QuizStudentsPage> createState() => _QuizStudentsPageState();
}

class _QuizStudentsPageState extends State<QuizStudentsPage> {
  final controller = ControllerQuizStudents();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isWidthGreatHeight = width > height;

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
                Wrap(
                  runSpacing: 20,
                  children: [
                    Wrap(
                      runSpacing: 5,
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
                    CustomDropDown(
                      withExpanded: false,
                      text: 'Status do Quiz',
                      onChanged: (value) {
                        if (value != null) {
                          controller.setAnswered(value);
                        }
                      },
                      initValue: false,
                      items: const [
                        DropdownMenuItem(
                          value: true,
                          child: Text('Respondidos'),
                        ),
                        DropdownMenuItem(
                          value: false,
                          child: Text('Não Respondidos'),
                        )
                      ],
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
                    final answered = controller.answered;
                    if (loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (message.isNotEmpty) {
                      return Expanded(
                        child: SingleChildScrollView(
                          child: Text(message),
                        ),
                      );
                    }
                    if (quizzes.isEmpty) {
                      return const Center(
                        child: Text('Nenhum quiz encontrado'),
                      );
                    }
                    controller.message = '';
                    return Expanded(
                      child: ListView.builder(
                        itemCount: quizzes.length,
                        itemBuilder: (context, index) {
                          final quiz = quizzes[index];
                          return Card(
                            child: Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text(quiz.title),
                                    onTap: () {
                                      if (answered) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (ctx) {
                                              return QuizResultPage(
                                                controller: controller,
                                                quiz: quiz,
                                              );
                                            },
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      CustomButtonDefault(
                                        text: 'Responder Sozinho',
                                        width: 150,
                                        onTap: !answered
                                            ? null
                                            : () {
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
                                      const SizedBox(height: 20),
                                      CustomButtonDefault(
                                        text: 'Responder Em grupo',
                                        width: 150,
                                        onTap: !answered
                                            ? null
                                            : () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (ctx) {
                                                      return QuizQuestionGroupPage(
                                                        quiz: quiz,
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
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
          );
        },
      ),
    );
  }
}
