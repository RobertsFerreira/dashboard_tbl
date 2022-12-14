import 'dart:convert';

import 'package:dashboard_tbl/features/types_user/models/types_user_model.dart';
import 'package:map_fields/map_fields.dart';

import 'user_default.dart';

class UserModel extends UserDefault {
  final String id;
  final bool active;
  final bool isLeaderGroup;

  UserModel({
    required super.name,
    required super.cpf,
    required super.birthDate,
    required super.idCompany,
    required super.typesUser,
    required this.id,
    required this.active,
    this.isLeaderGroup = false,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? cpf,
    DateTime? birthDate,
    String? idCompany,
    TypesUserModel? typesUser,
    bool? active,
    bool? isLeaderGroup,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? super.name,
      cpf: cpf ?? super.cpf,
      birthDate: birthDate ?? super.birthDate,
      idCompany: idCompany ?? super.idCompany,
      typesUser: typesUser ?? super.typesUser,
      active: active ?? this.active,
      isLeaderGroup: isLeaderGroup ?? this.isLeaderGroup,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cpf': cpf,
      'birth_date': birthDate.toIso8601String(),
      'id_company': idCompany,
      'types_user': typesUser,
      'active': active,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    final map = MapFields.load(json);
    final typesUser = (json['types_user'] ?? {});
    return UserModel(
      id: map.getString('id', ''),
      name: map.getString('name', ''),
      cpf: map.getString('cpf', ''),
      birthDate: map.getDateTime('birth_date', DateTime.now()),
      idCompany: map.getString('id_company', ''),
      typesUser: TypesUserModel.fromMap(typesUser),
      active: map.getBool('active', false),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source));

  @override
  String toString() =>
      'UserModel(id: $id, active: $active, name: $name, cpf: $cpf, birthDate: $birthDate, idCompany: $idCompany, typesUser: $typesUser)';

  factory UserModel.empty() {
    return UserModel(
      id: '',
      name: '',
      cpf: '',
      birthDate: DateTime.now(),
      idCompany: '',
      typesUser: TypesUserModel.empty(),
      active: false,
    );
  }
}
