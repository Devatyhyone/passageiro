import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:passageiro/app/modules/login/repository/login_interface.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final LoginInterface _repository;

  @observable
  bool visible = false;

  _LoginStoreBase(this._repository);

  @action
  void setVisible(bool value) {
    visible = value;
  }

  @observable
  bool isLoading = false;

  @action
  void setisLoading(bool value) {
    isLoading = value;
  }

  @observable
  String? celular;

  @action
  void setCelular(String value) {
    celular = value;
    if (celular!.length == 15) {
      signInWithPhone().then(
          (value) => value.fold((l) => print(l), (r) => log(r.toString())));
    }
  }

  @observable
  String? email;

  @action
  void setEmail(String value) {
    email = value;
  }

  @observable
  String? senha;

  @action
  void setSenha(String value) {
    senha = value;
  }

  @observable
  String? token;

  @action
  void setToken(String value) {
    token = value;
  }

  @observable
  ObservableFuture<Either<String, String?>>? signIn;

  Future<Either<String, String?>> signInWithPhone() {
    return signIn = _repository.loginWithEmail(email!, senha!)!.asObservable();
  }

  @computed
  bool get isLoadingSignIn {
    if (signIn == null) return false;
    return signIn!.status == FutureStatus.pending;
  }
}
