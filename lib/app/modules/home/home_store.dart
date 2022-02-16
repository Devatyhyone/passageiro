import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:passageiro/app/modules/home/repository/home_interface.dart';
import 'package:passageiro/app/shared/models/passageiro.dart';
import 'package:passageiro/app/shared/models/voucher.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final HomeInterface _repository;

  HomeStoreBase(this._repository);

  @observable
  Passageiro passageiro = Passageiro(
      id: '',
      email: '',
      nome: '',
      estado: '',
      cidade: '',
      bairro: '',
      logradouro: '',
      numero: '',
      celular: '',
      dataNascimento: null,
      latitudeCorrente: 0.0,
      longitudeCorrente: 0.0,
      sexo: '',
      cpf: '',
      cnpj: '',
      tipoPessoa: '',
      tipoUsuario: '',
      enderecoCompleto: '',
      cep: '',
      url: '',
      carteira: 0,
      metodoPg: [''],
      vouchers: <Voucher>[],
      createdAt: null,
      updatedAt: null,
      bloqueado: false);

  @action
  void setPassageiro(Passageiro value) {
    passageiro = value;
  }

  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) {
    isLoading = value;
  }

  @observable
  ObservableFuture<Either<String, Passageiro?>>? signIn;

  Future<Either<String, Passageiro?>> getUserData(String id) {
    return signIn = _repository.getUserData(id).asObservable();
  }

  @computed
  bool get isLoadingSignIn {
    if (signIn == null) return false;
    return signIn!.status == FutureStatus.pending;
  }
}
