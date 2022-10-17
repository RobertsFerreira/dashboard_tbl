import 'dart:convert';

import 'package:map_fields/map_fields.dart';

import '../../users/models/user_model.dart';
import 'group_default.dart';

class GroupModel extends GroupDefault {
  final String id;
  final UserModel userLeader;

  GroupModel({
    required this.id,
    required super.idClass,
    required super.reference,
    required this.userLeader,
    required super.users,
  });

  factory GroupModel.fromMap(Map<String, dynamic> json) {
    final map = MapFields.load(json);
    final usersMap = map.getList<Map<String, dynamic>>('users', []);
    final user = json['user'] ?? {};
    return GroupModel(
      id: map.getString('id', ''),
      idClass: map.getString('id_class', ''),
      reference: map.getString('reference', ''),
      userLeader: UserModel.fromMap(user),
      users: usersMap.map((e) => UserModel.fromMap(e)).toList(),
    );
  }

  Map<String, dynamic> toUpdate() {
    return {
      'id': id,
      'id_class': idClass,
      'reference': reference,
      'id_user_leader': userLeader.id,
      'users': users.map((e) => e.toMap()).toList(),
    };
  }

  factory GroupModel.fromJson(String source) =>
      GroupModel.fromMap(jsonDecode(source));

  // String toJson() => jsonEncode(toMap());
}
