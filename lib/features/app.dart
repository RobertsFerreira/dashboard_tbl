import 'package:asuka/asuka.dart';
import 'package:dashboard_tbl/features/group/pages/group_cadaster_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: Asuka.builder,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GroupCadasterPage(),
    );
  }
}
