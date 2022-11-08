enum FaseQuizEnum {
  solo('solo', false),
  grupo('grupo', true);

  final String etapa;
  final bool onlyLeaderAnswer;
  const FaseQuizEnum(this.etapa, this.onlyLeaderAnswer);
}
