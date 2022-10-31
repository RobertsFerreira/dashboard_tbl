class LoginModel {
  final String cpf;
  final String password;

  LoginModel({
    required this.cpf,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'password': password,
    };
  }

  factory LoginModel.empty() {
    return LoginModel(
      cpf: '',
      password: '',
    );
  }

  LoginModel copyWith({
    String? cpf,
    String? password,
  }) {
    return LoginModel(
      cpf: cpf ?? this.cpf,
      password: password ?? this.password,
    );
  }

  bool get validLogin => cpf.isNotEmpty && password.isNotEmpty;
}
