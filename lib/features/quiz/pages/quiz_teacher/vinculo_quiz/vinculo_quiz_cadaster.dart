import 'package:dashboard_tbl/features/quiz/pages/quiz_teacher/quizzes_page.dart';
import 'package:dashboard_tbl/utils/extensions/custom_extension_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/components/buttons/custom_button_default.dart';
import '../../../../../core/components/date_picker/custom_date_picker.dart';
import '../../../../../core/components/dropdown/custom_dropdown.dart';
import '../../../controller/quiz_teacher/vinculo/vinculo_quiz_cadaster_controller.dart';

class VinculoQuizCadaster extends StatefulWidget {
  const VinculoQuizCadaster({Key? key}) : super(key: key);

  @override
  State<VinculoQuizCadaster> createState() => _VinculoQuizCadasterState();
}

class _VinculoQuizCadasterState extends State<VinculoQuizCadaster> {
  final controller = VinculoQuizCadasterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vinculo Quiz'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  CustomDropDown(
                    initValue: controller.turmas.first.value,
                    text: 'Turmas',
                    items: controller.turmas,
                    onChanged: (String? value) async {
                      controller.setTurma(value);
                      await controller.getGroups();
                    },
                  ),
                  const SizedBox(width: 10),
                  Observer(
                    builder: (_) {
                      final dateQuiz = controller.dateQuiz;
                      return CustomButtonDefault(
                        width: 230,
                        height: 60,
                        icon: Icons.calendar_month,
                        text: 'Data do Quiz: ${dateQuiz.toStringFormatted()}',
                        onTap: () async {
                          final date = await customDatePicker(
                            context,
                            initialDate: dateQuiz,
                          );
                          controller.setDateQuiz(date);
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              Observer(
                builder: (_) {
                  return CustomDropDown(
                    withExpanded: false,
                    text: 'Quiz',
                    items: controller.quizzesDropdown,
                    onChanged: controller.setIdQuiz,
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
          const Divider(),
          const SizedBox(height: 10),
          Observer(
            builder: (_) {
              final groups = controller.groups;
              final loading = controller.loading;
              if (loading) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: groups.length,
                  itemBuilder: (_, index) {
                    final group = groups[index];
                    return Card(
                      child: ListTile(
                        title: Text('Grupo: ${group.reference}'),
                        subtitle: Text('Líder: ${group.userLeader.name}'),
                        onTap: () => controller.addGroup(group, index),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Expanded(
            child: Column(
              children: [
                Text(
                  'Grupos selecionados',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 10),
                Observer(
                  builder: (_) {
                    final groupsQuiz = controller.groupsQuiz;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: groupsQuiz.length,
                        itemBuilder: (_, index) {
                          final group = groupsQuiz[index];
                          return Card(
                            child: ListTile(
                              title: Text('Grupo: ${group.reference}'),
                              subtitle: Text('Líder: ${group.userLeader.name}'),
                              onTap: () => controller.removeGroup(group),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(
                builder: (_) {
                  final isValid = controller.validVinculo;
                  return CustomButtonDefault(
                    text: 'Salvar',
                    onTap: isValid
                        ? () async {
                            await controller.vincularQuiz();
                            if (controller.message.isEmpty) goto();
                          }
                        : null,
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  goto() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const QuizzesPage(),
      ),
      (route) => false,
    );
  }
}
