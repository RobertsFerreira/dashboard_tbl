class NewApelacaoModel {
  final String idUser;
  final String idCompany;
  final String idQuiz;
  final String apelacao;

  NewApelacaoModel({
    required this.idUser,
    required this.idCompany,
    required this.idQuiz,
    required this.apelacao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_group': '',
      'id_user': idUser,
      'id_company': idCompany,
      'id_quiz': idQuiz,
      'apelacao': apelacao,
    };
  }
}
