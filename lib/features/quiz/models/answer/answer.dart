class Answer {
  final int index;
  final int pointSelect;
  final String text;
  final int limitScore;

  Answer({
    required this.index,
    required this.pointSelect,
    required this.text,
    required this.limitScore,
  });

  Answer copyWith({
    int? index,
    int? pointSelect,
    String? text,
    int? limitScore,
  }) {
    return Answer(
      index: index ?? this.index,
      pointSelect: pointSelect ?? this.pointSelect,
      text: text ?? this.text,
      limitScore: limitScore ?? this.limitScore,
    );
  }
}
