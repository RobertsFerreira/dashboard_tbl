// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vinculo_quiz_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VinculoQuizController on _VinculoQuizControllerBase, Store {
  late final _$dataIniAtom =
      Atom(name: '_VinculoQuizControllerBase.dataIni', context: context);

  @override
  DateTime get dataIni {
    _$dataIniAtom.reportRead();
    return super.dataIni;
  }

  @override
  set dataIni(DateTime value) {
    _$dataIniAtom.reportWrite(value, super.dataIni, () {
      super.dataIni = value;
    });
  }

  late final _$dataFimAtom =
      Atom(name: '_VinculoQuizControllerBase.dataFim', context: context);

  @override
  DateTime get dataFim {
    _$dataFimAtom.reportRead();
    return super.dataFim;
  }

  @override
  set dataFim(DateTime value) {
    _$dataFimAtom.reportWrite(value, super.dataFim, () {
      super.dataFim = value;
    });
  }

  late final _$_VinculoQuizControllerBaseActionController =
      ActionController(name: '_VinculoQuizControllerBase', context: context);

  @override
  void setDataIni(DateTime? value) {
    final _$actionInfo = _$_VinculoQuizControllerBaseActionController
        .startAction(name: '_VinculoQuizControllerBase.setDataIni');
    try {
      return super.setDataIni(value);
    } finally {
      _$_VinculoQuizControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataFim(DateTime? value) {
    final _$actionInfo = _$_VinculoQuizControllerBaseActionController
        .startAction(name: '_VinculoQuizControllerBase.setDataFim');
    try {
      return super.setDataFim(value);
    } finally {
      _$_VinculoQuizControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dataIni: ${dataIni},
dataFim: ${dataFim}
    ''';
  }
}
