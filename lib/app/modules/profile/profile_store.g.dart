// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStoreBase, Store {
  Computed<bool>? _$isLoadingSignInComputed;

  @override
  bool get isLoadingSignIn =>
      (_$isLoadingSignInComputed ??= Computed<bool>(() => super.isLoadingSignIn,
              name: '_ProfileStoreBase.isLoadingSignIn'))
          .value;

  final _$usuarioAtom = Atom(name: '_ProfileStoreBase.usuario');

  @override
  Passageiro get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(Passageiro value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ProfileStoreBase.isLoading');

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

  final _$getDataAtom = Atom(name: '_ProfileStoreBase.getData');

  @override
  ObservableFuture<Either<String, Passageiro?>>? get getData {
    _$getDataAtom.reportRead();
    return super.getData;
  }

  @override
  set getData(ObservableFuture<Either<String, Passageiro?>>? value) {
    _$getDataAtom.reportWrite(value, super.getData, () {
      super.getData = value;
    });
  }

  final _$_ProfileStoreBaseActionController =
      ActionController(name: '_ProfileStoreBase');

  @override
  void setUser(Passageiro value) {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction(
        name: '_ProfileStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction(
        name: '_ProfileStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
isLoading: ${isLoading},
getData: ${getData},
isLoadingSignIn: ${isLoadingSignIn}
    ''';
  }
}
