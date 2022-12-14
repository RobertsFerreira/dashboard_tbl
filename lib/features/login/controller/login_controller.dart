import 'package:dashboard_tbl/features/login/models/login_model.dart';
import 'package:dashboard_tbl/features/users/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:map_fields/map_fields.dart';
import 'package:mobx/mobx.dart';

import '../../../core/infra/clients/dio_client.dart';
import '../../../core/infra/global/user_global.dart';
import '../external/login_external.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final loginExternal = LoginExternal(httpClient: DioClient());

  @observable
  UserModel userLogged = UserModel.empty();

  @action
  void setUserLogged(UserModel user) {
    userLogged = user;
  }

  @observable
  bool loading = false;

  @observable
  String error = '';

  @observable
  LoginModel loginModel = LoginModel.empty();

  @observable
  bool obscurePassword = true;

  @action
  void setObscurePassword() => obscurePassword = !obscurePassword;

  @action
  void setCpf(String cpf) {
    loginModel = loginModel.copyWith(cpf: cpf);
  }

  @action
  void setPassword(String password) {
    loginModel = loginModel.copyWith(password: password);
  }

  @action
  Future<void> login() async {
    loading = true;
    error = '';
    try {
      if (loginModel.validLogin) {
        final user = await loginExternal.login(loginModel);
        UserGlobal.instance.setUser(user);
      } else {
        error = 'CPF ou senha inválidos';
      }
    } catch (e) {
      if (e is DioError) {
        final data = e.response?.data;
        if (data == null) {
          error = e.message;
        } else {
          final maps = MapFields.load(data);
          error = maps.getString('message');
        }
      } else {
        error = e.toString();
      }
    } finally {
      loading = false;
    }
  }
}
