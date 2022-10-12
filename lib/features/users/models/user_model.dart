import 'user_default.dart';

class UserModel extends UserDefault {
  final String id;
  final bool enabled;

  UserModel({
    required super.name,
    required super.cpf,
    required super.birthDate,
    required super.idCompany,
    required super.typeUser,
    required this.id,
    required this.enabled,
  });
}
