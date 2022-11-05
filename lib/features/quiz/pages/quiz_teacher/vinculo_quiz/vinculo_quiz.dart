import 'package:dashboard_tbl/utils/extensions/custom_extension_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/components/buttons/custom_button_default.dart';
import '../../../../../core/components/date_picker/custom_date_picker.dart';
import '../../../../../core/components/dropdown/custom_dropdown.dart';
import '../../../controller/vinculo_quiz_controller.dart';

class VinculoQuiz extends StatefulWidget {
  const VinculoQuiz({Key? key}) : super(key: key);

  @override
  State<VinculoQuiz> createState() => _VinculoQuizState();
}

class _VinculoQuizState extends State<VinculoQuiz> {
  final controller = VinculoQuizController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vinculo Quiz'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CustomDropDown(
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
                const SizedBox(height: 10),
                Observer(
                  builder: (_) {
                    final quizDropDown = controller.quizzesDropdown;
                    return CustomDropDown(
                      text: 'Quiz',
                      items: quizDropDown,
                      onChanged: (String? value) async {
                        controller.setIdQuiz(value);
                      },
                    );
                  },
                ),
              ],
            ),
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
                  // final isValidCadaster = controller.isValidCadaster;
                  return const CustomButtonDefault(
                    text: 'Proximo',
                    // onTap: isValidCadaster
                    //     ? () async {
                    //         controller.createQuiz();
                    //         Navigator.pushAndRemoveUntil(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (_) => CadasterQuestionPage(
                    //               newQuiz: controller.newQuiz,
                    //             ),
                    //           ),
                    //           (route) => false,
                    //         );
                    //       }
                    //     : null,
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
}
