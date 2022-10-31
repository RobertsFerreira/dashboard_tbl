// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginControllerBase, Store {
  late final _$userLoggedAtom =
      Atom(name: '_LoginControllerBase.userLogged', context: context);

  @override
  UserModel get userLogged {
    _$userLoggedAtom.reportRead();
    return super.userLogged;
  }

  @override
  set userLogged(UserModel value) {
    _$userLoggedAtom.reportWrite(value, super.userLogged, () {
      super.userLogged = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_LoginControllerBase.loading', context: context);

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

  late final _$errorAtom =
      Atom(name: '_LoginControllerBase.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$loginModelAtom =
      Atom(name: '_LoginControllerBase.loginModel', context: context);

  @override
  LoginModel get loginModel {
    _$loginModelAtom.reportRead();
    return super.loginModel;
  }

  @override
  set loginModel(LoginModel value) {
    _$loginModelAtom.reportWrite(value, super.loginModel, () {
      super.loginModel = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginControllerBase.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase', context: context);

  @override
  void setUserLogged(UserModel user) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setUserLogged');
    try {
      return super.setUserLogged(user);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String cpf) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setCpf');
    try {
      return super.setCpf(cpf);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String password) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userLogged: ${userLogged},
loading: ${loading},
error: ${error},
loginModel: ${loginModel}
    ''';
  }
}
