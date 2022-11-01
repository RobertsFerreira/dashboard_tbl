import 'dart:convert';

import 'package:dashboard_tbl/features/login/models/login_model.dart';
import 'package:dashboard_tbl/features/users/models/user_model.dart';
import 'package:map_fields/map_fields.dart';

import '../../../core/interfaces/clients/client_http.dart';

class LoginExternal {
  final ClientHttp httpClient;

  LoginExternal({required this.httpClient});

  Future<UserModel> login(LoginModel loginModel) async {
    try {
      final body = jsonEncode(loginModel.toMap());

      final response = await httpClient.post(
        '/login',
        body: body,
      );

      if (response.statusCode == 200) {
        final map = MapFields.load(response.data);
        final userMap = map.getMap<String, dynamic>('user');
        final user = UserModel.fromMap(userMap);
        return user;
      } else {
        throw Exception('Erro ao realizar login');
      }
    } catch (e) {
      rethrow;
    }
  }
}
