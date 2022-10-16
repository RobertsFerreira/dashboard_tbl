// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_cadaster_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GrupoCadasterController on _GrupoCadasterControllerBase, Store {
  Computed<bool>? _$containsLiderComputed;

  @override
  bool get containsLider =>
      (_$containsLiderComputed ??= Computed<bool>(() => super.containsLider,
              name: '_GrupoCadasterControllerBase.containsLider'))
          .value;
  Computed<bool>? _$isValidSaveComputed;

  @override
  bool get isValidSave =>
      (_$isValidSaveComputed ??= Computed<bool>(() => super.isValidSave,
              name: '_GrupoCadasterControllerBase.isValidSave'))
          .value;

  late final _$loadingAtom =
      Atom(name: '_GrupoCadasterControllerBase.loading', context: context);

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

  late final _$referenceAtom =
      Atom(name: '_GrupoCadasterControllerBase.reference', context: context);

  @override
  String get reference {
    _$referenceAtom.reportRead();
    return super.reference;
  }

  @override
  set reference(String value) {
    _$referenceAtom.reportWrite(value, super.reference, () {
      super.reference = value;
    });
  }

  late final _$codeClassAtom =
      Atom(name: '_GrupoCadasterControllerBase.codeClass', context: context);

  @override
  String get codeClass {
    _$codeClassAtom.reportRead();
    return super.codeClass;
  }

  @override
  set codeClass(String value) {
    _$codeClassAtom.reportWrite(value, super.codeClass, () {
      super.codeClass = value;
    });
  }

  late final _$messageAtom =
      Atom(name: '_GrupoCadasterControllerBase.message', context: context);

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

  late final _$usersAtom =
      Atom(name: '_GrupoCadasterControllerBase.users', context: context);

  @override
  List<UserModel> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(List<UserModel> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$usersGroupAtom =
      Atom(name: '_GrupoCadasterControllerBase.usersGroup', context: context);

  @override
  List<UserModel> get usersGroup {
    _$usersGroupAtom.reportRead();
    return super.usersGroup;
  }

  @override
  set usersGroup(List<UserModel> value) {
    _$usersGroupAtom.reportWrite(value, super.usersGroup, () {
      super.usersGroup = value;
    });
  }

  late final _$userLeaderAtom =
      Atom(name: '_GrupoCadasterControllerBase.userLeader', context: context);

  @override
  UserModel? get userLeader {
    _$userLeaderAtom.reportRead();
    return super.userLeader;
  }

  @override
  set userLeader(UserModel? value) {
    _$userLeaderAtom.reportWrite(value, super.userLeader, () {
      super.userLeader = value;
    });
  }

  late final _$_getAllUsersAsyncAction = AsyncAction(
      '_GrupoCadasterControllerBase._getAllUsers',
      context: context);

  @override
  Future<void> _getAllUsers() {
    return _$_getAllUsersAsyncAction.run(() => super._getAllUsers());
  }

  late final _$getAllUsersAsyncAction =
      AsyncAction('_GrupoCadasterControllerBase.getAllUsers', context: context);

  @override
  Future<void> getAllUsers() {
    return _$getAllUsersAsyncAction.run(() => super.getAllUsers());
  }

  late final _$saveGroupAsyncAction =
      AsyncAction('_GrupoCadasterControllerBase.saveGroup', context: context);

  @override
  Future<void> saveGroup() {
    return _$saveGroupAsyncAction.run(() => super.saveGroup());
  }

  late final _$_GrupoCadasterControllerBaseActionController =
      ActionController(name: '_GrupoCadasterControllerBase', context: context);

  @override
  void setUserLeader(int index, UserModel user, bool? value) {
    final _$actionInfo = _$_GrupoCadasterControllerBaseActionController
        .startAction(name: '_GrupoCadasterControllerBase.setUserLeader');
    try {
      return super.setUserLeader(index, user, value);
    } finally {
      _$_GrupoCadasterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReference(String value) {
    final _$actionInfo = _$_GrupoCadasterControllerBaseActionController
        .startAction(name: '_GrupoCadasterControllerBase.setReference');
    try {
      return super.setReference(value);
    } finally {
      _$_GrupoCadasterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCodeClass(String value) {
    final _$actionInfo = _$_GrupoCadasterControllerBaseActionController
        .startAction(name: '_GrupoCadasterControllerBase.setCodeClass');
    try {
      return super.setCodeClass(value);
    } finally {
      _$_GrupoCadasterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addUserGroup(UserModel user) {
    final _$actionInfo = _$_GrupoCadasterControllerBaseActionController
        .startAction(name: '_GrupoCadasterControllerBase.addUserGroup');
    try {
      return super.addUserGroup(user);
    } finally {
      _$_GrupoCadasterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeUserGroup(UserModel user) {
    final _$actionInfo = _$_GrupoCadasterControllerBaseActionController
        .startAction(name: '_GrupoCadasterControllerBase.removeUserGroup');
    try {
      return super.removeUserGroup(user);
    } finally {
      _$_GrupoCadasterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
reference: ${reference},
codeClass: ${codeClass},
message: ${message},
users: ${users},
usersGroup: ${usersGroup},
userLeader: ${userLeader},
containsLider: ${containsLider},
isValidSave: ${isValidSave}
    ''';
  }
}
