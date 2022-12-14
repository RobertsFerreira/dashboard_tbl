import '../../users/models/user_model.dart';

class GroupDefault {
  final String idClass;
  final String reference;
  final List<UserModel> users;
  final bool? answered;

  GroupDefault({
    required this.idClass,
    required this.reference,
    required this.users,
    this.answered,
  });
}
