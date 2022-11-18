// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../components/answer_card.dart';
import '../../../../components/button_navigator.dart';
import '../../../../components/progress_bar_question.dart';
import '../../../../core/components/buttons/custom_button_default.dart';
import '../../controller/quiz_group/quiz_group_controller.dart';
import '../../models/quiz_model.dart';

class QuizQuestionGroupPage extends StatefulWidget {
  final QuizModel quiz;
  const QuizQuestionGroupPage({super.key, required this.quiz});

  @override
  State<QuizQuestionGroupPage> createState() => _QuizQuestionGroupPageState();
}

class _QuizQuestionGroupPageState extends State<QuizQuestionGroupPage> {
  @override
  Widget build(BuildContext context) {
    final controller = QuizGroupController(widget.quiz);

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
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.currentQuestion.numberAnswer,
                    itemBuilder: (_, index) {
                      final answer = answerStudent[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: AnswerCard(
                          index: answer.index,
                          pointSelect: answer.pointSelect,
                          text: answer.description,
                          limitScore: answer.limitScore + 1,
                          onTap: () =>
                              controller.validateCorrectQuestion(index),
                          trailing: false,
                          correct: answer.correct,
                          showResult: answer.showResult,
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
                      onPressed: (controller.currentIndex + 1) !=
                              controller.quiz.numberQuestion
                          ? () async => controller.saveAnswersStudent()
                          : () async {
                              final result =
                                  await controller.insertAnswersUSer();
                              if (result) {
                                controller.message = '';
                                await showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return AlertDialog(
                                      title: const Text('Sucesso'),
                                      content: const Text(
                                        'Respostas salvas com sucesso',
                                      ),
                                      actions: [
                                        CustomButtonDefault(
                                          text: 'OK',
                                          onTap: () => Navigator.of(ctx).pop(),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                await showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return Observer(
                                      builder: (_) {
                                        final needApelacao =
                                            controller.needApelacao;
                                        final setNeedApelacao =
                                            controller.setNeedApelacao;
                                        return AlertDialog(
                                          title: const Text(
                                            'Deseja fazer apelação',
                                          ),
                                          content: Visibility(
                                            visible: needApelacao,
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'Motivo',
                                                border: OutlineInputBorder(),
                                              ),
                                              maxLines: null,
                                              textInputAction:
                                                  TextInputAction.newline,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              onChanged: controller.setApelacao,
                                            ),
                                          ),
                                          actions: [
                                            Visibility(
                                              visible: !needApelacao,
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(ctx);
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Não'),
                                              ),
                                            ),
                                            Visibility(
                                              visible: !needApelacao,
                                              child: TextButton(
                                                onPressed: setNeedApelacao,
                                                child: const Text('Sim'),
                                              ),
                                            ),
                                            Visibility(
                                              visible: needApelacao,
                                              child: TextButton(
                                                onPressed: () async {
                                                  final result =
                                                      await controller
                                                          .saveApelacao();
                                                  if (result) {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (buildCtx) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                            'Sucesso',
                                                          ),
                                                          content: const Text(
                                                            'Apelação salva com sucesso',
                                                          ),
                                                          actions: [
                                                            CustomButtonDefault(
                                                              text: 'OK',
                                                              onTap: () =>
                                                                  Navigator.pop(
                                                                buildCtx,
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    Navigator.pop(ctx);
                                                    Navigator.pop(context);
                                                  } else {
                                                    showDialog(
                                                      context: context,
                                                      builder: (ctx) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                            'Erro',
                                                          ),
                                                          content: const Text(
                                                            'Erro ao salvar apelação',
                                                          ),
                                                          actions: [
                                                            CustomButtonDefault(
                                                              text: 'OK',
                                                              onTap: () =>
                                                                  Navigator.pop(
                                                                ctx,
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }
                                                },
                                                child: const Text(
                                                  'Salvar Apelação',
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                );
                              } else if (message != '') {
                                await showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return AlertDialog(
                                      title: const Text('Erro'),
                                      content: Text(message),
                                      actions: [
                                        CustomButtonDefault(
                                          text: 'OK',
                                          onTap: () => Navigator.of(ctx).pop(),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
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
