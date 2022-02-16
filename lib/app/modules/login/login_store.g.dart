// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  Computed<bool>? _$isLoadingSignInComputed;

  @override
  bool get isLoadingSignIn =>
      (_$isLoadingSignInComputed ??= Computed<bool>(() => super.isLoadingSignIn,
              name: '_LoginStoreBase.isLoadingSignIn'))
          .value;

  final _$visibleAtom = Atom(name: '_LoginStoreBase.visible');

  @override
  bool get visible {
    _$visibleAtom.reportRead();
    return super.visible;
  }

  @override
  set visible(bool value) {
    _$visibleAtom.reportWrite(value, super.visible, () {
      super.visible = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_LoginStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$celularAtom = Atom(name: '_LoginStoreBase.celular');

  @override
  String? get celular {
    _$celularAtom.reportRead();
    return super.celular;
  }

  @override
  set celular(String? value) {
    _$celularAtom.reportWrite(value, super.celular, () {
      super.celular = value;
    });
  }

  final _$emailAtom = Atom(name: '_LoginStoreBase.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: '_LoginStoreBase.senha');

  @override
  String? get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String? value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$tokenAtom = Atom(name: '_LoginStoreBase.token');

  @override
  String? get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String? value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$signInAtom = Atom(name: '_LoginStoreBase.signIn');

  @override
  ObservableFuture<Either<String, String?>>? get signIn {
    _$signInAtom.reportRead();
    return super.signIn;
  }

  @override
  set signIn(ObservableFuture<Either<String, String?>>? value) {
    _$signInAtom.reportWrite(value, super.signIn, () {
      super.signIn = value;
    });
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  void setVisible(bool value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setVisible');
    try {
      return super.setVisible(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setisLoading(bool value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setisLoading');
    try {
      return super.setisLoading(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCelular(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setCelular');
    try {
      return super.setCelular(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setToken(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setToken');
    try {
      return super.setToken(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
visible: ${visible},
isLoading: ${isLoading},
celular: ${celular},
email: ${email},
senha: ${senha},
token: ${token},
signIn: ${signIn},
isLoadingSignIn: ${isLoadingSignIn}
    ''';
  }
}
