import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';

import 'group/pages/group_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: Asuka.builder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: GroupPage(),
    );
  }
}
