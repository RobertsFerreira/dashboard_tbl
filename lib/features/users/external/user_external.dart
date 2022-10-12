import 'package:map_fields/map_fields.dart';

import '../../../core/interfaces/clients/client_http.dart';
import '../models/user_model.dart';

class UserExternal {
  final ClientHttp client;

  UserExternal(this.client);

  Future<List<UserModel>> getUserByTypeUser({
    required String idCompany,
    String? typeUser,
  }) async {
    List<UserModel> users = [];
    try {
      final response = await client.get(
        '/user/$idCompany',
      );
      if (response.statusCode == 200) {
        final data = response.data;
        final map = MapFields.load(data);
        final listUsers = map.getList<Map<String, dynamic>>('users', []);
        users = listUsers.map((e) => UserModel.fromMap(e)).toList();
      } else if (response.statusCode == 204) {
        users = [];
      }
      return users;
    } catch (e) {
      rethrow;
    }
  }
}
