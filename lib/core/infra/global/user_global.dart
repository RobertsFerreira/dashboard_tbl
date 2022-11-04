import '../../../features/users/models/user_model.dart';

class UserGlobal {
  UserGlobal._();
  static UserGlobal? _instance;

  static UserGlobal get instance {
    _instance ??= UserGlobal._();
    return _instance!;
  }

  UserModel _user = UserModel.empty();

  UserModel get user => _user;

  void setUser(UserModel? user) {
    _user = user ?? UserModel.empty();
  }
}
