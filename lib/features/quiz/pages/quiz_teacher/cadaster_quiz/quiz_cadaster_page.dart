import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/components/buttons/custom_button_default.dart';
import '../../../controller/quiz_teacher/quizzes_cadaster_controller.dart';
import 'cadaster_question/cadaster_question_page.dart';

class QuizCadasterPage extends StatefulWidget {
  const QuizCadasterPage({super.key});

  @override
  State<QuizCadasterPage> createState() => _QuizCadasterPageState();
}

class _QuizCadasterPageState extends State<QuizCadasterPage> {
  final controller = QuizzesCadasterController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final canPop = controller.canPop;
        return WillPopScope(
          onWillPop: () async {
            if (canPop) {
              return true;
            } else {
              final pop = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Atenção'),
                  content: const Text(
                    'Há dados preenchidos na pagina deseja sair mesmo?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text('Sim'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text('Não'),
                    ),
                  ],
                ),
              );
              if (pop != null) {
                return pop;
              } else {
                return false;
              }
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Quiz Cadaster'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Título',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      textInputAction: TextInputAction.newline,
                      onChanged: controller.setTitleQuiz,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Número de questões',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: controller.setNumberQuestions,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Observer(
                        builder: (_) {
                          final isValidCadaster = controller.isValidCadaster;
                          return CustomButtonDefault(
                            text: 'Proximo',
                            onTap: isValidCadaster
                                ? () async {
                                    controller.createQuiz();
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CadasterQuestionPage(
                                          newQuiz: controller.newQuiz,
                                        ),
                                      ),
                                    );
                                  }
                                : null,
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
