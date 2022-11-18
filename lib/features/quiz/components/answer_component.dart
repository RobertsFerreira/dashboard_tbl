import 'package:flutter/material.dart';

class AnswerComponent extends StatelessWidget {
  final int index;
  final bool? valueCheckbox;
  final void Function(String)? onChangedDescription;
  final void Function(bool?)? onChangedCorrect;
  final void Function(String)? onChangedScore;
  const AnswerComponent({
    super.key,
    required this.index,
    this.onChangedDescription,
    this.onChangedCorrect,
    this.onChangedScore,
    this.valueCheckbox = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            enabled: false,
            decoration: InputDecoration(
              labelText: 'Resposta ${index + 1}',
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: const InputDecoration(
              labelText: 'Descrição',
              border: OutlineInputBorder(),
            ),
            onChanged: onChangedDescription,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Pontuação Máxima',
              border: OutlineInputBorder(),
            ),
            onChanged: onChangedScore,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CheckboxListTile(
            title: const Text('Resposta Correta'),
            value: valueCheckbox,
            onChanged: onChangedCorrect,
          ),
        ),
      ],
    );
  }
}
