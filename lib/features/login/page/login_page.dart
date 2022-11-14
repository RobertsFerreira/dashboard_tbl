import 'package:asuka/asuka.dart';
import 'package:dashboard_tbl/features/home/home_for_studente_page.dart';
import 'package:dashboard_tbl/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
      body: Observer(
        builder: (_) {
          final loading = controller.loading;
          if (loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
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
                  child: Observer(
                    builder: (_) {
                      final obscurePassword = controller.obscurePassword;
                      return TextFormField(
                        onChanged: controller.setPassword,
                        obscureText: obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: controller.setObscurePassword,
                          ),
                        ),
                      );
                    },
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
          );
        },
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
    } else if (userLogged.typesUser.name == 'aluno') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (ctx) {
          return const HomePageForStudent();
        }),
        (route) => false,
      );
    } else {
      AsukaSnackbar.alert(messaError).show();
    }
  }
}
