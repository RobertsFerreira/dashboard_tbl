import 'dart:convert';

import 'package:dashboard_tbl/features/types_user/models/types_user_model.dart';
import 'package:map_fields/map_fields.dart';

import 'user_default.dart';

class UserModel extends UserDefault {
  final String id;
  final bool enabled;

  UserModel({
    required super.name,
    required super.cpf,
    required super.birthDate,
    required super.idCompany,
    required super.typesUser,
    required this.id,
    required this.enabled,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cpf': cpf,
      'birth_date': birthDate,
      'id_company': idCompany,
      'types_user': typesUser,
      'enabled': enabled,
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
      enabled: map.getBool('enabled', false),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source));

  @override
  String toString() =>
      'UserModel(id: $id, enabled: $enabled, name: $name, cpf: $cpf, birthDate: $birthDate, idCompany: $idCompany, typesUser: $typesUser)';
}
