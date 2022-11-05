import 'package:dashboard_tbl/utils/extensions/custom_extension_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/components/buttons/custom_button_default.dart';
import '../../../../../core/components/date_picker/custom_date_picker.dart';
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
                        builder: (context) => const VinculoQuiz(),
                      ),
                    );
                  },
                  text: 'Liberar Quiz',
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
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
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
