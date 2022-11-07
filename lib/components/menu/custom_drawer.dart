import 'package:dashboard_tbl/features/group/pages/group_page.dart';
import 'package:dashboard_tbl/features/login/page/login_page.dart';
import 'package:flutter/material.dart';

import '../../core/components/buttons/custom_button_default.dart';
import '../../features/quiz/pages/quiz_teacher/quizzes_page.dart';
import '../../features/quiz/pages/quiz_teacher/vinculo_quiz/vinculo_quiz.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.15,
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CustomButtonDefault(
            text: 'Alunos',
            width: 140,
            onTap: null,
            icon: Icons.person,
          ),
          const SizedBox(height: 20),
          CustomButtonDefault(
            text: 'Grupos',
            width: 140,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const GroupPage(),
              ),
            ),
            icon: Icons.group,
          ),
          const SizedBox(height: 20),
          const CustomButtonDefault(
            text: 'Turmas',
            width: 140,
            onTap: null,
            icon: Icons.class_,
          ),
          const SizedBox(height: 20),
          CustomButtonDefault(
            text: 'Quizzes',
            width: 140,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const QuizzesPage(),
              ),
            ),
            icon: Icons.question_mark,
          ),
          const SizedBox(height: 20),
          CustomButtonDefault(
            text: 'Quizzes Ativos',
            width: 140,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const VinculoQuiz(),
              ),
            ),
            icon: Icons.question_mark,
          ),
          const SizedBox(height: 20),
          CustomButtonDefault(
            text: 'Logout',
            width: 140,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const LoginPage(),
              ),
            ),
            icon: Icons.exit_to_app,
          ),
        ],
      ),
    );
  }
}
