import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:dashboard_tbl/features/home/home_page.dart';
import 'package:flutter/material.dart';

import '../../../core/infra/global/user_global.dart';
import '../../users/models/user_model.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              child: TextFormField(
                onChanged: controller.setCpf,
                decoration: const InputDecoration(
                  labelText: 'CPF',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 400,
              child: TextFormField(
                onChanged: controller.setPassword,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await controller.login();
                final userLogged = UserGlobal.instance.user;
                goto(userLogged, controller.error);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void goto(UserModel userLogged, String messaError) {
    if (userLogged.typesUser.name == 'professor') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (ctx) {
          return const HomePage();
        }),
        (route) => false,
      );
    } else {
      AsukaSnackbar.alert(messaError).show();
    }
  }
}
