import 'package:dashboard_tbl/core/components/buttons/custom_button_default.dart';
import 'package:dashboard_tbl/core/components/date_picker/custom_date_picker.dart';
import 'package:dashboard_tbl/core/components/dropdown/custom_dropdown.dart';
import 'package:dashboard_tbl/features/quiz/controller/quizzes_cadaster_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class QuizCadasterPage extends StatefulWidget {
  const QuizCadasterPage({super.key});

  @override
  State<QuizCadasterPage> createState() => _QuizCadasterPageState();
}

class _QuizCadasterPageState extends State<QuizCadasterPage> {
  final controller = QuizzesCadasterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Cadaster'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    CustomDropDown(
                      text: 'Turmas',
                      items: controller.turmas,
                    ),
                    const SizedBox(width: 10),
                    const CustomDropDown(
                      text: 'Professor',
                      items: [],
                    ),
                    const SizedBox(width: 10),
                    CustomButtonDefault(
                      text: 'Data do Quiz',
                      onTap: () {
                        customDatePicker(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Título',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Número de questões',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 10),
          Observer(
            builder: (_) {
              final groups = controller.groups;
              return Expanded(
                child: ListView.builder(
                  itemCount: groups.length,
                  itemBuilder: (_, index) {
                    final group = groups[index];
                    return ListTile(
                      title: Text(group.reference),
                      trailing: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          controller.addGroup(group);
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomButtonDefault(text: 'Cancelar'),
              SizedBox(width: 10),
              CustomButtonDefault(text: 'Proximo'),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
