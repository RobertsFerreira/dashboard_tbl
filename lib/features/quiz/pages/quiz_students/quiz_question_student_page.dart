import 'package:dashboard_tbl/features/quiz/models/quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../components/answer_card.dart';
import '../../../../components/button_navigator.dart';
import '../../../../components/progress_bar_question.dart';
import '../../../../core/components/buttons/custom_button_default.dart';
import '../../controller/quiz_students/controller_quiz_question.dart';
import '../../models/answer/answer_student.dart';

class QuizQuestionStudentPage extends StatefulWidget {
  final QuizModel quiz;
  const QuizQuestionStudentPage({super.key, required this.quiz});

  @override
  State<QuizQuestionStudentPage> createState() =>
      _QuizQuestionStudentPageState();
}

class _QuizQuestionStudentPageState extends State<QuizQuestionStudentPage> {
  @override
  Widget build(BuildContext context) {
    final controller = ControllerQuizQuestion(widget.quiz);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Observer(
                  builder: (_) {
                    return Text(
                      controller.questionIndex,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  },
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.centerRight,
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            Observer(
              builder: (_) {
                final progress = controller.progress;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ProgressBarQuestion(
                        percent: progress,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${progress * 100}%',
                    )
                  ],
                );
              },
            ),
            const SizedBox(height: 30),
            Observer(
              builder: (_) {
                final question = controller.currentQuestion;
                return Text(question.description);
              },
            ),
            const SizedBox(height: 15),
            Observer(
              builder: (_) {
                final answerStudent = controller.answerStudent;
                final numberAnswer = controller.currentQuestion.numberAnswer;
                return Expanded(
                  child: ListView.builder(
                    itemCount: numberAnswer,
                    itemBuilder: (_, index) {
                      AnswerStudent answer = answerStudent[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: AnswerCard(
                          index: answer.index,
                          pointSelect: answer.pointSelect,
                          text: answer.description,
                          limitScore: answer.limitScore + 1,
                          controller: TextEditingController(
                            text: answer.pointSelect.toString(),
                          ),
                          onChanged: (value) =>
                              controller.setSelectPoint(value, index),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            Observer(
              builder: (_) {
                final message = controller.message;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonNavigator(
                      text: 'Anterior',
                      onPressed: (controller.currentIndex) == 0
                          ? null
                          : controller.previousQuestion,
                    ),
                    ButtonNavigator(
                      text: 'Próximo',
                      onPressed: (controller.currentIndex + 1) ==
                              controller.quiz.numberQuestion
                          ? null
                          : controller.nextQuestion,
                    ),
                    ButtonNavigator(
                      text: 'Salvar',
                      onPressed: (controller.currentIndex + 1) ==
                              controller.quiz.numberQuestion
                          ? () async {
                              await controller.insertAnswersUSer();
                              if (message.isNotEmpty) {
                                await showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: const Text('Atenção'),
                                    content: Text(message),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                                controller.message = '';
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return AlertDialog(
                                      title: const Text('Sucesso'),
                                      content: const Text(
                                        'Respostas salvas com sucesso, esperando todos do grupo terminarem',
                                      ),
                                      actions: [
                                        CustomButtonDefault(
                                          text: 'OK',
                                          onTap: () {
                                            Navigator.of(ctx).pop();
                                            Navigator.pop(context);
                                            // Navigator.push(
                                            //   ctx,
                                            //   MaterialPageRoute(
                                            //     builder: (ctx) {
                                            //       return QuizQuestionGroupPage(
                                            //         quiz: controller.quiz,
                                            //       );
                                            //     },
                                            //   ),
                                            // );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                          : controller.saveAnswersStudent,
                      //testar essa função amanhã
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
