import 'dart:convert';

import 'package:dashboard_tbl/features/users/models/user_default.dart';

class NewUserModel extends UserDefault {
  NewUserModel({
    required super.name,
    required super.cpf,
    required super.birthDate,
    required super.idCompany,
    required super.typeUser,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cpf': cpf,
      'birthDate': birthDate,
      'idCompany': idCompany,
      'typeUser': typeUser,
    };
  }

  String toJson() => jsonEncode(toMap());
}
