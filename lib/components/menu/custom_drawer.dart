import 'package:dashboard_tbl/features/group/pages/group_page.dart';
import 'package:dashboard_tbl/features/login/page/login_page.dart';
import 'package:flutter/material.dart';

import '../../core/components/buttons/custom_button_default.dart';
import '../../features/quiz/pages/quizzes_page.dart';

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
            onTap: null,
            icon: Icons.person,
          ),
          const SizedBox(height: 20),
          CustomButtonDefault(
            text: 'Grupos',
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
            onTap: null,
            icon: Icons.class_,
          ),
          const SizedBox(height: 20),
          CustomButtonDefault(
            text: 'Quizzes',
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
            text: 'Logout',
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
