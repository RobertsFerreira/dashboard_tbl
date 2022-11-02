import 'package:dashboard_tbl/features/quiz/models/quiz_model.dart';
import 'package:flutter/material.dart';

import '../../../../components/button_navigator.dart';
import '../../../../components/progress_bar_question.dart';
import '../../../../components/question_card.dart';
import '../../models/answer/answer.dart';

class QuizQuestionStudentPage extends StatefulWidget {
  final QuizModel quiz;
  const QuizQuestionStudentPage({super.key, required this.quiz});

  @override
  State<QuizQuestionStudentPage> createState() =>
      _QuizQuestionStudentPageState();
}

class _QuizQuestionStudentPageState extends State<QuizQuestionStudentPage> {
  double progress = 0;

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final quiz = widget.quiz;
    final questions = quiz.questions;
    final question = questions[currentIndex];
    final answers = question.answers;

    List<Answer> answerCustom = List.generate(
      question.numberAnswer,
      (index) => Answer(
        index: index,
        pointSelect: 0,
        limitScore: answers[index].score,
        text: answers[index].description,
      ),
    );

    void setSelectPoint(int? value, int index) {
      if (value != null) {
        Answer answer = answerCustom[index];
        setState(() {
          answer = answer.copyWith(pointSelect: value);
          answerCustom[index] = answer;
        });
      }
    }

    List<Widget> answersWidget = List.generate(
      question.numberAnswer,
      (index) {
        final answer = answerCustom[index];
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: QuestionCard(
            index: answer.index,
            pointSelect: answer.pointSelect,
            text: answer.text,
            limitScore: answer.limitScore + 1,
            onChanged: (value) => setSelectPoint(value, index),
          ),
        );
      },
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                index,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                padding: const EdgeInsets.all(0),
                alignment: Alignment.centerRight,
                icon: const Icon(Icons.close),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
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
          ),
          const SizedBox(height: 30),
          Text(question.description),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: answers.length,
              itemBuilder: (_, index) {
                final answerWidget = answersWidget[index];
                return answerWidget;
              },
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonNavigator(
                text: 'Anterior',
                onPressed: () {
                  setState(() {
                    if (progress > 0) {
                      final percent = (currentIndex) / quiz.numberQuestion;
                      progress -= percent;
                      progress = double.parse(
                        progress.toStringAsFixed(2),
                      );
                    }
                    if (currentIndex > 0) {
                      currentIndex--;
                    }
                  });
                },
              ),
              ButtonNavigator(
                text: 'Próximo',
                onPressed: () {
                  setState(() {
                    if (progress < 1) {
                      final percent = (currentIndex + 1) / quiz.numberQuestion;
                      progress += percent;
                      progress = double.parse(
                        progress.toStringAsFixed(2),
                      );
                    }
                    if (currentIndex < questions.length - 1) {
                      currentIndex++;
                    }
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  String get index {
    final index = ((progress * 10).round()) + 1;
    if (progress < .9) {
      return 'Questão $index';
    } else {
      return 'Questão ${index - 1}';
    }
  }
}
