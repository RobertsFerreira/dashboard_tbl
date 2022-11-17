import 'package:dashboard_tbl/features/quiz/models/new_quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../../core/components/buttons/custom_button_default.dart';
import '../../../../components/answer_component.dart';
import '../../../../controller/quiz_teacher/cadaster_question_controller.dart';
import '../../quizzes_page.dart';

class CadasterQuestionPage extends StatefulWidget {
  final NewQuizModel newQuiz;
  const CadasterQuestionPage({
    super.key,
    required this.newQuiz,
  });

  @override
  State<CadasterQuestionPage> createState() => _CadasterQuestionPageState();
}

class _CadasterQuestionPageState extends State<CadasterQuestionPage> {
  late NewQuizModel quizModel;
  late CadasterQuestionController controller;

  @override
  Widget build(BuildContext context) {
    quizModel = widget.newQuiz;
    controller = CadasterQuestionController(quiz: quizModel);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Cadastrar Perguntas'),
            Observer(
              builder: (_) {
                final numberQuestion = controller.newQuiz.questions.length;
                return Text(
                  'Nº Perguntas Cadastradas: ($numberQuestion/${quizModel.numberQuestion})',
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      labelText: 'Descrição',
                      border: OutlineInputBorder(),
                    ),
                    controller: controller.controllerDescriptionQuestion,
                    onChanged: controller.setDescriptionQuestion,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: controller.controllerNumberAnswers,
                    decoration: const InputDecoration(
                      labelText: 'Número de Respostas',
                      border: OutlineInputBorder(),
                    ),
                    enabled: false,
                  ),
                ),
                const SizedBox(width: 10),
                CustomButtonDefault(
                  icon: Icons.add,
                  text: '',
                  height: 40,
                  width: 40,
                  onTap: controller.incrementNumberAnswers,
                ),
                const SizedBox(width: 10),
                CustomButtonDefault(
                  icon: Icons.remove,
                  text: '',
                  height: 40,
                  width: 40,
                  onTap: controller.decrementNumberAnswers,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              'Perguntas a Cadastrar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Observer(
                builder: (_) {
                  final numberQuestions = controller.numberAnswers;
                  final answers = controller.answers;
                  return ListView.builder(
                    itemCount: numberQuestions,
                    itemBuilder: (_, index) {
                      final answer = answers[index];
                      final containsCorrectAnswer =
                          controller.containsCorrectAnswer;
                      return Column(
                        children: [
                          AnswerComponent(
                            index: index,
                            valueCheckbox: answer.correct,
                            onChangedDescription: (String value) =>
                                controller.setDescriptionAnswer(index, value),
                            onChangedCorrect:
                                containsCorrectAnswer && !answer.correct
                                    ? null
                                    : (bool? value) => controller
                                        .setCorrectAnswer(index, answer, value),
                            onChangedScore: (String value) =>
                                controller.setScoreAnswer(index, value),
                          ),
                          if (index <= controller.numberAnswers - 1)
                            const SizedBox(height: 10),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              'Perguntas Cadastradas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Observer(
                builder: (_) {
                  final listQuestions = controller.newQuiz.questions;
                  return ListView.builder(
                    itemCount: listQuestions.length,
                    itemBuilder: (_, index) {
                      final question = listQuestions[index];
                      return Column(
                        children: [
                          Card(
                            child: ExpansionTile(
                              title: Text(question.description),
                              subtitle: Text(
                                'Nº Respostas: ${question.answers.length}',
                              ),
                              children: [
                                for (var answer in question.answers)
                                  ListTile(
                                    title: Text(answer.description),
                                    subtitle: Text(
                                        'Pontuação Máxima: ${answer.score}'),
                                  ),
                              ],
                            ),
                          ),
                          if (index <= listQuestions.length - 1)
                            const SizedBox(height: 10),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(
                  builder: (_) {
                    final saveQuestion = controller.saveQuestion;
                    final canSave = controller.canSave;
                    final messageError = controller.messageError;
                    return CustomButtonDefault(
                      onTap: canSave
                          ? saveQuestion
                              ? () async {
                                  controller.messageError = '';
                                  final result = await controller.saveQuiz();
                                  if (result && messageError.isEmpty) {
                                    await showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return AlertDialog(
                                          title: const Text('Sucesso'),
                                          content: const Text(
                                              'Quiz cadastrado com sucesso'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(ctx);
                                              },
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (ctx) {
                                          return const QuizzesPage();
                                        },
                                      ),
                                      (route) => false,
                                    );
                                  } else if (messageError.isNotEmpty) {
                                    await showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return AlertDialog(
                                          title: const Text('Erro'),
                                          content: Text(messageError),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(ctx);
                                              },
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return AlertDialog(
                                          title: const Text('Erro'),
                                          content: const Text(
                                            'Erro ao cadastrar o quiz',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(ctx);
                                              },
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                }
                              : () {
                                  controller.addQuestion();
                                  showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        title: const Text('Sucesso'),
                                        content: const Text(
                                          'Pergunta cadastrada com sucesso!',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop();
                                            },
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                          : null,
                      text: saveQuestion ? 'Salvar' : 'Adicionar',
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
