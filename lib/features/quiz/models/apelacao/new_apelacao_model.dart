class NewApelacaoModel {
  final String idUser;
  final String idCompany;
  final String idQuiz;
  final String apelacao;
  final String idGroup;

  NewApelacaoModel({
    required this.idUser,
    required this.idCompany,
    required this.idQuiz,
    required this.apelacao,
    required this.idGroup,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_group': idGroup,
      'id_user': idUser,
      'id_company': idCompany,
      'id_quiz': idQuiz,
      'apelacao': apelacao,
    };
  }
}
