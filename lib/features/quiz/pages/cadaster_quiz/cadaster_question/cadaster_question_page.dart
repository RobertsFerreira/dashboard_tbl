import 'package:dashboard_tbl/features/quiz/models/new_quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/components/buttons/custom_button_default.dart';
import '../../../components/answer_component.dart';
import '../../../controller/cadaster_question_controller.dart';

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
                final numberQuestion = controller.quiz.questions.length;
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
                    decoration: const InputDecoration(
                      labelText: 'Descrição',
                      border: OutlineInputBorder(),
                    ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(
                  builder: (_) {
                    final saveQuestion = controller.saveQuestion;
                    final canSave = controller.canSave;
                    return CustomButtonDefault(
                      onTap: canSave
                          ? saveQuestion
                              ? () => controller.saveQuiz()
                              : () => controller.addQuestion()
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
