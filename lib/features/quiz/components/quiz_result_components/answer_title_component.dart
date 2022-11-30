import 'package:flutter/material.dart';

class AnswerTitleComponent extends StatelessWidget {
  final String title;
  final int numberQuestions;
  final bool isCorrect;
  const AnswerTitleComponent({
    super.key,
    required this.title,
    required this.numberQuestions,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Tooltip(
            message: title,
            child: Text(
              'Resposta $numberQuestions: $title',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
        // const Spacer(),
        const Text(
          'Resposta Correta: ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Icon(
          isCorrect ? Icons.check_circle : Icons.cancel,
          color: isCorrect ? Colors.green : Colors.red,
        ),
      ],
    );
  }
}
