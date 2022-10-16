import '../../users/models/user_model.dart';

class GroupDefault {
  final String idClass;
  final String reference;
  final String idUserLeader;
  final List<UserModel> users;

  GroupDefault({
    required this.idClass,
    required this.reference,
    required this.idUserLeader,
    required this.users,
  });
}
