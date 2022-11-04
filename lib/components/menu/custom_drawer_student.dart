import 'package:dashboard_tbl/features/login/page/login_page.dart';
import 'package:dashboard_tbl/features/quiz/pages/quiz_students/quiz_students_page.dart';
import 'package:flutter/material.dart';

import '../../core/components/buttons/custom_button_default.dart';
import '../../core/infra/global/user_global.dart';

class CustomDrawerStudent extends StatefulWidget {
  const CustomDrawerStudent({super.key});

  @override
  State<CustomDrawerStudent> createState() => _CustomDrawerStudentState();
}

class _CustomDrawerStudentState extends State<CustomDrawerStudent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.15,
      child: Column(
        children: [
          const SizedBox(height: 20),
          CustomButtonDefault(
            text: 'Quizzes',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const QuizStudentsPage(),
              ),
            ),
            icon: Icons.question_mark,
          ),
          const SizedBox(height: 20),
          CustomButtonDefault(
            text: 'Logout',
            onTap: () {
              UserGlobal.instance.setUser(null);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const LoginPage(),
                ),
              );
            },
            icon: Icons.exit_to_app,
          ),
        ],
      ),
    );
  }
}
