import 'dart:developer';

import 'package:dashboard_tbl/features/quiz/components/answer_component.dart';
import 'package:dashboard_tbl/features/quiz/models/new_quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/components/buttons/custom_button_default.dart';
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
  final controller = CadasterQuestionController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadaster Question'),
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
                    onChanged: null,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: controller.controllerNumberQuestions,
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
                  onTap: controller.increment,
                ),
                const SizedBox(width: 10),
                CustomButtonDefault(
                  icon: Icons.remove,
                  text: '',
                  height: 40,
                  width: 40,
                  onTap: controller.decrement,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Expanded(
              child: Observer(
                builder: (_) {
                  return ListView.builder(
                    itemCount: controller.numberQuestions,
                    itemBuilder: (_, index) {
                      final answer = controller.answers[index];
                      log(answer.correct.toString());
                      return Column(
                        children: [
                          AnswerComponent(
                            index: index,
                            valueCheckbox: answer.correct,
                            onChangedDescription: (String value) =>
                                controller.setDescriptionAnswer(index, value),
                            onChangedCorrect: (bool? value) =>
                                controller.setCorrectAnswer(index, value),
                            onChangedScore: (String value) =>
                                controller.setScoreAnswer(index, value),
                          ),
                          if (index <= controller.numberQuestions - 1)
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
                CustomButtonDefault(
                  onTap: () {},
                  text: 'Salvar',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
