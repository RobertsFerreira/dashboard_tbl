import '../../../core/interfaces/clients/client_http.dart';
import '../models/new_group_model.dart';

class GroupExternal {
  final ClientHttp _client;
  GroupExternal(this._client);

  Future<bool> insertGroupsCab(NewGroupModel group) async {
    try {
      final json = group.toJson();
      final response = await _client.post('/group', body: json);
      if (response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
