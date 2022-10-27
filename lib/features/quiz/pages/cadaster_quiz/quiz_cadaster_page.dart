import 'package:dashboard_tbl/features/quiz/controller/quizzes_cadaster_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/components/buttons/custom_button_default.dart';
import '../../../../core/components/date_picker/custom_date_picker.dart';
import '../../../../core/components/dropdown/custom_dropdown.dart';
import 'cadaster_question/cadaster_question_page.dart';

class QuizCadasterPage extends StatefulWidget {
  const QuizCadasterPage({super.key});

  @override
  State<QuizCadasterPage> createState() => _QuizCadasterPageState();
}

class _QuizCadasterPageState extends State<QuizCadasterPage> {
  final controller = QuizzesCadasterController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final canPop = controller.canPop;
        return WillPopScope(
          onWillPop: () async {
            if (canPop) {
              return true;
            } else {
              final pop = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Atenção'),
                  content: const Text(
                    'Há dados preenchidos na pagina deseja sair mesmo?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text('Sim'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text('Não'),
                    ),
                  ],
                ),
              );
              if (pop != null) {
                return pop;
              } else {
                return false;
              }
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Quiz Cadaster'),
            ),
            body: Column(
              children: [
                Column(
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
                        CustomDropDown(
                          text: 'Professor',
                          items: [
                            DropdownMenuItem(
                              value: controller.user.id,
                              child: Text(controller.user.name),
                            ),
                          ],
                          onChanged: controller.setProfessor,
                        ),
                        const SizedBox(width: 10),
                        CustomButtonDefault(
                          text: 'Data do Quiz',
                          onTap: () async {
                            final date = await customDatePicker(context);
                            controller.setDateQuiz(date);
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
                              onChanged: controller.setTitleQuiz,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Número de questões',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: controller.setNumberQuestions,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
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
                            title: Text('Grupo: ${group.reference}'),
                            subtitle: Text('Líder: ${group.userLeader.name}'),
                            onTap: () => controller.removeGroup(group),
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
                  children: [
                    Observer(
                      builder: (_) {
                        return CustomButtonDefault(
                          text: 'Proximo',
                          onTap: () async {
                            controller.createQuiz();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CadasterQuestionPage(
                                  newQuiz: controller.newQuiz,
                                ),
                              ),
                              (route) => false,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
