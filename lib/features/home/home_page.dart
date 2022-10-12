import 'dart:developer';

import 'package:dashboard_tbl/core/infra/clients/dio_client.dart';
import 'package:dashboard_tbl/features/users/external/user_external.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _counter = 0;

  Future<void> _incrementCounter() async {
    final UserExternal userExternal = UserExternal(DioClient());
    const idCompany = "1566d92f-9119-44d5-830e-9c3f94eb657c";
    final users = await userExternal.getUserByTypeUser(idCompany: idCompany);
    for (final user in users) {
      log(user.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => _incrementCounter(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
