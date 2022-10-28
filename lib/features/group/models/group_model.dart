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
    final usersMap = map.getList<Map<String, dynamic>>('users_groups', []);
    final userMap = map.getMap<String, dynamic>('user_leader');
    final user = UserModel.fromMap(userMap);
    final userLeader = user.copyWith(isLeaderGroup: true);
    List<UserModel> users = usersMap.map((e) => UserModel.fromMap(e)).toList();
    final index = users.indexWhere((element) => element.id == user.id);
    users[index] = users[index].copyWith(isLeaderGroup: true);
    return GroupModel(
      id: map.getString('id'),
      idClass: map.getString('id_class'),
      reference: map.getString('reference'),
      userLeader: userLeader,
      users: users,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_class': idClass,
      'reference': reference,
      'user': userLeader.toMap(),
      'users_groups': users.map((e) => e.toMap()).toList(),
    };
  }

  Map<String, dynamic> toUpdate() {
    return {
      'id': id,
      'id_class': idClass,
      'reference': reference,
      'id_user_leader': userLeader.id,
    };
  }

  factory GroupModel.fromJson(String source) =>
      GroupModel.fromMap(jsonDecode(source));

  // String toJson() => jsonEncode(toMap());
}
