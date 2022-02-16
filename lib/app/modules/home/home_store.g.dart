// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<bool>? _$isLoadingSignInComputed;

  @override
  bool get isLoadingSignIn =>
      (_$isLoadingSignInComputed ??= Computed<bool>(() => super.isLoadingSignIn,
              name: 'HomeStoreBase.isLoadingSignIn'))
          .value;

  final _$passageiroAtom = Atom(name: 'HomeStoreBase.passageiro');

  @override
  Passageiro get passageiro {
    _$passageiroAtom.reportRead();
    return super.passageiro;
  }

  @override
  set passageiro(Passageiro value) {
    _$passageiroAtom.reportWrite(value, super.passageiro, () {
      super.passageiro = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'HomeStoreBase.isLoading');

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

  final _$signInAtom = Atom(name: 'HomeStoreBase.signIn');

  @override
  ObservableFuture<Either<String, Passageiro?>>? get signIn {
    _$signInAtom.reportRead();
    return super.signIn;
  }

  @override
  set signIn(ObservableFuture<Either<String, Passageiro?>>? value) {
    _$signInAtom.reportWrite(value, super.signIn, () {
      super.signIn = value;
    });
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void setPassageiro(Passageiro value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setPassageiro');
    try {
      return super.setPassageiro(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
passageiro: ${passageiro},
isLoading: ${isLoading},
signIn: ${signIn},
isLoadingSignIn: ${isLoadingSignIn}
    ''';
  }
}
