class AnswerStudent {
  final String id;
  final String idCompany;
  final String idQuestion;
  final String description;
  final bool correct;
  final int limitScore;
  final int index;
  final int pointSelect;
  final int scoreValid;

  AnswerStudent({
    required this.id,
    required this.idCompany,
    required this.idQuestion,
    required this.description,
    required this.correct,
    required this.limitScore,
    required this.index,
    required this.pointSelect,
    this.scoreValid = 0,
  });

  AnswerStudent copyWith({
    String? id,
    String? idCompany,
    String? idQuestion,
    String? description,
    bool? correct,
    int? limitScore,
    int? index,
    int? pointSelect,
    int? scoreValid,
  }) {
    return AnswerStudent(
      id: id ?? this.id,
      idCompany: idCompany ?? this.idCompany,
      idQuestion: idQuestion ?? this.idQuestion,
      description: description ?? this.description,
      correct: correct ?? this.correct,
      limitScore: limitScore ?? this.limitScore,
      index: index ?? this.index,
      pointSelect: pointSelect ?? this.pointSelect,
      scoreValid: scoreValid ?? this.scoreValid,
    );
  }

  AnswerStudent setScoreValide() {
    if (correct) {
      return copyWith(scoreValid: pointSelect);
    }
    return this;
  }
}
