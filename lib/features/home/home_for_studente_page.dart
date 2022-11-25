import 'package:dashboard_tbl/components/menu/custom_drawer_student.dart';
import 'package:flutter/material.dart';

class HomePageForStudent extends StatefulWidget {
  const HomePageForStudent({super.key});

  @override
  State<HomePageForStudent> createState() => _HomePageForStudentState();
}

class _HomePageForStudentState extends State<HomePageForStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const CustomDrawerStudent(),
          const SizedBox(width: 20),
          const VerticalDivider(),
          const SizedBox(width: 20),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
