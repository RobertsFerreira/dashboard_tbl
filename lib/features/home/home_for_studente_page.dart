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
        children: const [
          CustomDrawerStudent(),
          SizedBox(width: 20),
          VerticalDivider(),
          SizedBox(width: 20),
          // Expanded(
          //     child: Center(
          //   child: CustomButtonDefault(
          //     width: 200,
          //     text: 'Pesquisa de Satisfação',
          //     onTap: () async {
          //       final url = Uri.parse(
          //         'https://docs.google.com/forms/d/e/1FAIpQLScJgbGIhtFDDxbndV-H3ESbWm-oGWmHzxEKmAmTReTFkvtEfQ/viewform?usp=sf_link',
          //       );
          //       await launchUrl(url);
          //     },
          //     icon: Icons.rate_review,
          //   ),
          // )),
        ],
      ),
    );
  }
}
