import 'package:dashboard_tbl/features/quiz/pages/quiz_teacher/vinculo_quiz/vinculo_quiz_cadaster.dart';
import 'package:dashboard_tbl/utils/extensions/custom_extension_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/components/buttons/custom_button_default.dart';
import '../../../../../core/components/date_picker/custom_date_picker.dart';
import '../../../../../core/components/dropdown/custom_dropdown.dart';
import '../../../controller/quiz_teacher/vinculo/vinculo_quiz_controller.dart';

class VinculoQuiz extends StatefulWidget {
  const VinculoQuiz({super.key});

  @override
  State<VinculoQuiz> createState() => _VinculoQuizState();
}

class _VinculoQuizState extends State<VinculoQuiz> {
  final controller = VinculoQuizController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzes Liberados'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonDefault(
                  width: 140,
                  icon: Icons.search,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VinculoQuizCadaster(),
                      ),
                    );
                  },
                  text: 'Liberar Quiz',
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 300,
                      child: CustomDropDown<bool>(
                        withExpanded: false,
                        initValue: false,
                        onChanged: (value) {
                          if (value != null) {
                            controller.setAnswered(value);
                          }
                        },
                        text: 'Status Quiz',
                        items: const [
                          DropdownMenuItem(
                            value: true,
                            child: Text('Respondidos'),
                          ),
                          DropdownMenuItem(
                            value: false,
                            child: Text('Não Respondidos'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Observer(
                      builder: (_) {
                        final dataIni = controller.dataIni;
                        return CustomButtonDefault(
                          icon: Icons.calendar_month,
                          text: dataIni.toStringFormatted(),
                          onTap: () async {
                            final date = await customDatePicker(
                              context,
                              initialDate: dataIni,
                            );
                            controller.setDataIni(date);
                          },
                        );
                      },
                    ),
                    const SizedBox(width: 5),
                    Observer(
                      builder: (_) {
                        final dataFim = controller.dataFim;
                        return CustomButtonDefault(
                          icon: Icons.calendar_month,
                          text: dataFim.toStringFormatted(),
                          onTap: () async {
                            final date = await customDatePicker(
                              context,
                              initialDate: dataFim,
                            );
                            controller.setDataFim(date);
                          },
                        );
                      },
                    ),
                    const SizedBox(width: 5),
                    CustomButtonDefault(
                      icon: Icons.search,
                      text: 'Buscar',
                      onTap: controller.getAll,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            Observer(
              builder: (_) {
                final loading = controller.loading;
                final vinculoQuizzes = controller.vinculoQuizzes;
                if (loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (vinculoQuizzes.isEmpty) {
                  return const Center(
                    child: Text(
                      'Nenhum quiz liberado',
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: vinculoQuizzes.length,
                    itemBuilder: (context, index) {
                      final vinculoQuiz = vinculoQuizzes[index];
                      return Card(
                        child: ExpansionTile(
                          title: Text('Quiz: ${vinculoQuiz.title}'),
                          trailing: Text(
                            'Data: ${vinculoQuiz.date.toStringFormatted()}',
                          ),
                          children: [
                            for (final group in vinculoQuiz.groups)
                              ListTile(
                                title: Text('Grupo: ${group.reference}'),
                                trailing: Text('Lider: ${group.nameLeader}'),
                                onTap: () {},
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
