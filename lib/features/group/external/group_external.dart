import 'package:map_fields/map_fields.dart';

import '../../../core/interfaces/clients/client_http.dart';
import '../models/group_model.dart';
import '../models/new_group_model.dart';

class GroupExternal {
  final ClientHttp _client;
  GroupExternal(this._client);

  Future<List<GroupModel>> getAllGroups(String idClass) async {
    try {
      final response = await _client.get('/groups/$idClass');
      if (response.statusCode == 200) {
        final map = MapFields.load(response.data);
        final listGroups = map.getList<Map<String, dynamic>>('groups', []);
        return listGroups.map((e) => GroupModel.fromMap(e)).toList();
      } else {
        final status = response.statusCode;
        final message = response.data;
        if (status == 204) {
          return [];
        }
        throw Exception(
          'Erro ao buscar grupos -- Status: $status -- Message: $message',
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> insertGroupsCab(NewGroupModel group) async {
    try {
      final json = group.toJson();
      final response = await _client.post('/groups', body: json);
      if (response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
