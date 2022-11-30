import 'package:flutter/material.dart';

class AnswerUserComponent extends StatelessWidget {
  final String userName;
  final double scoreAnswered;
  final double scoreValid;
  const AnswerUserComponent({
    super.key,
    required this.userName,
    required this.scoreAnswered,
    required this.scoreValid,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            const Text(
              'Resposta do Aluno: ',
            ),
            const SizedBox(width: 10),
            Text(userName),
            const SizedBox(width: 8),
            // const Spacer(),
            const SizedBox(width: 8),
            const Text(
              'Pontuação respondida:',
            ),
            const SizedBox(width: 8),
            Text(scoreAnswered.toString()),
            const SizedBox(width: 8),
            const Text(' | '),
            const SizedBox(width: 8),
            const Text(
              'Pontuação validada: ',
            ),
            Text(scoreValid.toString()),
          ],
        ),
      ],
    );
  }
}
