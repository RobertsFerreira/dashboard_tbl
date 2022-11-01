import 'package:dashboard_tbl/core/components/buttons/custom_button_default.dart';
import 'package:dashboard_tbl/core/components/date_picker/custom_date_picker.dart';
import 'package:flutter/material.dart';

class QuizStudentsPage extends StatefulWidget {
  const QuizStudentsPage({super.key});

  @override
  State<QuizStudentsPage> createState() => _QuizStudentsPageState();
}

class _QuizStudentsPageState extends State<QuizStudentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quizzes'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                CustomButtonDefault(
                  text: 'Data 1',
                  onTap: () {
                    customDatePicker(context);
                  },
                ),
                const SizedBox(width: 20),
                CustomButtonDefault(
                  text: 'Data 2',
                  onTap: () {
                    customDatePicker(context);
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
