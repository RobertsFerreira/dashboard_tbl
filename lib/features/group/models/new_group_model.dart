import 'dart:convert';

import 'package:map_fields/map_fields.dart';

import '../../users/models/user_model.dart';
import 'group_default.dart';

class NewGroupModel extends GroupDefault {
  NewGroupModel({
    required super.idClass,
    required super.reference,
    required super.idUserLeader,
    required super.users,
  });

  factory NewGroupModel.fromMap(Map<String, dynamic> json) {
    final map = MapFields.load(json);
    final usersMap = map.getList<Map<String, dynamic>>('users', []);
    return NewGroupModel(
      idClass: map.getString('id_class', ''),
      reference: map.getString('reference', ''),
      idUserLeader: map.getString('id_user_leader', ''),
      users: usersMap.map((e) => UserModel.fromMap(e)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_class': idClass,
      'reference': reference,
      'id_user_leader': idUserLeader,
      'users': users.map((e) => e.toMap()).toList(),
    };
  }

  factory NewGroupModel.fromJson(String source) =>
      NewGroupModel.fromMap(jsonDecode(source));

  String toJson() => jsonEncode(toMap());
}
