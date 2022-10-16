import 'dart:convert';

import 'package:map_fields/map_fields.dart';

import '../../users/models/user_model.dart';
import 'group_default.dart';

class GroupModel extends GroupDefault {
  final String id;

  GroupModel({
    required this.id,
    required super.idClass,
    required super.reference,
    required super.idUserLeader,
    required super.users,
  });

  factory GroupModel.fromMap(Map<String, dynamic> json) {
    final map = MapFields.load(json);
    final usersMap = map.getList<Map<String, dynamic>>('users', []);
    return GroupModel(
      id: map.getString('id', ''),
      idClass: map.getString('id_class', ''),
      reference: map.getString('reference', ''),
      idUserLeader: map.getString('id_user_leader', ''),
      users: usersMap.map((e) => UserModel.fromMap(e)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_class': idClass,
      'reference': reference,
      'id_user_leader': idUserLeader,
      'users': users.map((e) => e.toMap()).toList(),
    };
  }

  factory GroupModel.fromJson(String source) =>
      GroupModel.fromMap(jsonDecode(source));

  String toJson() => jsonEncode(toMap());
}
