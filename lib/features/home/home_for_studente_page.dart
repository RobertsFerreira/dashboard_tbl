import 'package:flutter/material.dart';

class HomePageForStudent extends StatefulWidget {
  const HomePageForStudent({super.key});

  @override
  State<HomePageForStudent> createState() => _HomePageForStudentState();
}

class _HomePageForStudentState extends State<HomePageForStudent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(),
        const SizedBox(width: 20),
        const Divider(),
        const SizedBox(width: 20),
        Container(),
      ],
    );
  }
}
