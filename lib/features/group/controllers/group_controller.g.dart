// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GroupController on _GroupControllerBase, Store {
  late final _$groupsAtom =
      Atom(name: '_GroupControllerBase.groups', context: context);

  @override
  List<GroupModel> get groups {
    _$groupsAtom.reportRead();
    return super.groups;
  }

  @override
  set groups(List<GroupModel> value) {
    _$groupsAtom.reportWrite(value, super.groups, () {
      super.groups = value;
    });
  }

  late final _$turmaAtom =
      Atom(name: '_GroupControllerBase.turma', context: context);

  @override
  String get turma {
    _$turmaAtom.reportRead();
    return super.turma;
  }

  @override
  set turma(String value) {
    _$turmaAtom.reportWrite(value, super.turma, () {
      super.turma = value;
    });
  }

  late final _$messageAtom =
      Atom(name: '_GroupControllerBase.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_GroupControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$turmasAtom =
      Atom(name: '_GroupControllerBase.turmas', context: context);

  @override
  List<DropdownMenuItem<String>> get turmas {
    _$turmasAtom.reportRead();
    return super.turmas;
  }

  @override
  set turmas(List<DropdownMenuItem<String>> value) {
    _$turmasAtom.reportWrite(value, super.turmas, () {
      super.turmas = value;
    });
  }

  late final _$anosAtom =
      Atom(name: '_GroupControllerBase.anos', context: context);

  @override
  List<DropdownMenuItem<String>> get anos {
    _$anosAtom.reportRead();
    return super.anos;
  }

  @override
  set anos(List<DropdownMenuItem<String>> value) {
    _$anosAtom.reportWrite(value, super.anos, () {
      super.anos = value;
    });
  }

  late final _$getGroupsAsyncAction =
      AsyncAction('_GroupControllerBase.getGroups', context: context);

  @override
  Future<void> getGroups() {
    return _$getGroupsAsyncAction.run(() => super.getGroups());
  }

  late final _$_GroupControllerBaseActionController =
      ActionController(name: '_GroupControllerBase', context: context);

  @override
  void setTurma(String value) {
    final _$actionInfo = _$_GroupControllerBaseActionController.startAction(
        name: '_GroupControllerBase.setTurma');
    try {
      return super.setTurma(value);
    } finally {
      _$_GroupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
groups: ${groups},
turma: ${turma},
message: ${message},
loading: ${loading},
turmas: ${turmas},
anos: ${anos}
    ''';
  }
}
