import 'package:dashboard_tbl/features/types_user/models/types_user_model.dart';

class UserDefault {
  final String name;
  final String cpf;
  final DateTime birthDate;
  final String idCompany;
  final TypesUserModel typeUser;

  UserDefault({
    required this.name,
    required this.cpf,
    required this.birthDate,
    required this.idCompany,
    required this.typeUser,
  });
}
