// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:passageiro/app/modules/profile/repository/profile_interface.dart';
import 'package:passageiro/app/shared/models/passageiro.dart';
import 'package:passageiro/app/shared/models/voucher.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {
  final ProfileInterface _repository;

  _ProfileStoreBase(this._repository);

  @observable
  Passageiro usuario = Passageiro(
      id: '',
      email: '',
      nome: ' ',
      estado: '',
      cidade: '',
      bairro: '',
      logradouro: '',
      numero: '',
      celular: '',
      dataNascimento: Timestamp.fromDate(DateTime.now()),
      sexo: '',
      cpf: '',
      cnpj: '',
      tipoPessoa: '',
      tipoUsuario: '',
      enderecoCompleto: '',
      cep: '',
      url: '',
      carteira: 0.0,
      metodoPg: <String>[],
      vouchers: <Voucher>[],
      createdAt: Timestamp.fromDate(DateTime.now()),
      updatedAt: Timestamp.fromDate(DateTime.now()),
      bloqueado: false,
      localizacaoAtual: GeoPoint(0.0, 0.0));

  @action
  void setUser(Passageiro value) {
    usuario = value;
  }

  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) {
    isLoading = value;
  }

  @observable
  bool expanded = false;

  @action
  void setExpanded(bool value) {
    expanded = value;
  }

  @observable
  ObservableFuture<Either<String, Passageiro?>>? getData;

  Future<Either<String, Passageiro?>> getUserData(String id) {
    return getData = _repository.getUserData(id).asObservable();
  }

  @computed
  bool get isLoadingSignIn {
    if (getData == null) return false;
    return getData!.status == FutureStatus.pending;
  }

  @observable
  String nome = '';

  @action
  void setNome(String value) {
    nome = value;
  }

  @observable
  String estado = '';

  @action
  void setEstado(String value) {
    estado = value;
  }

  @observable
  String cidade = '';

  @action
  void setCidade(String value) {
    cidade = value;
  }

  @observable
  String bairro = '';

  @action
  void setBairro(String value) {
    bairro = value;
  }

  @observable
  String logradouro = '';

  @action
  void setLogradouro(String value) {
    logradouro = value;
  }

  @observable
  String numero = '';

  @action
  void setNumero(String value) {
    numero = value;
  }

  @observable
  String celular = '';

  @action
  void setCelular(String value) {
    celular = value;
  }

  @observable
  Timestamp? dataNascimento;

  @action
  void setDataNascimento(Timestamp value) {
    dataNascimento = value;
  }

  @observable
  String sexo = '';

  @action
  void setSexo(String value) {
    sexo = value;
  }

  @observable
  String enderecoCompleto = '';

  @action
  void setEnderecoCompleto(String value) {
    enderecoCompleto = value;
  }

  @observable
  String cep = '';

  @action
  void setCep(String value) {
    cep = value;
  }

  @observable
  double? longitudeCorrente;

  @action
  void setLong(double value) {
    longitudeCorrente = value;
  }

  @observable
  double? latitudeCorrente;

  @action
  void setLat(double value) {
    latitudeCorrente = value;
  }

  @observable
  String resultUpdateMessage = 'Dados atualizados com sucesso';

  @action
  void setMessage(String value) {
    resultUpdateMessage = value;
  }

  @action
  Future<void> updateData() async {
    Passageiro updatedUser = Passageiro(
        id: usuario.id,
        email: usuario.email,
        nome: nome.isEmpty ? usuario.nome : nome,
        estado: estado.isEmpty ? usuario.estado : estado,
        cidade: cidade.isEmpty ? usuario.cidade : cidade,
        bairro: bairro.isEmpty ? usuario.bairro : bairro,
        logradouro: logradouro.isEmpty ? usuario.logradouro : logradouro,
        numero: numero.isEmpty ? usuario.numero : numero,
        celular: celular.isEmpty ? usuario.celular : celular,
        dataNascimento: dataNascimento ?? usuario.dataNascimento,
        sexo: usuario.sexo,
        cpf: usuario.cpf,
        cnpj: usuario.cnpj,
        tipoPessoa: usuario.tipoPessoa,
        tipoUsuario: usuario.tipoUsuario,
        enderecoCompleto: enderecoCompleto.isEmpty
            ? usuario.enderecoCompleto
            : enderecoCompleto,
        cep: cep.isEmpty ? usuario.cep : cep,
        url: usuario.url,
        carteira: usuario.carteira,
        metodoPg: usuario.metodoPg,
        vouchers: usuario.vouchers,
        createdAt: usuario.createdAt,
        updatedAt: Timestamp.fromDate(DateTime.now()),
        bloqueado: usuario.bloqueado,
        localizacaoAtual: GeoPoint(latitudeCorrente!, longitudeCorrente!));
    await FirebaseFirestore.instance
        .collection('passageiros')
        .doc(usuario.id)
        .update(updatedUser.toJson())
        .then((value) {
      getUserData(usuario.id!).then((value) =>
          value.fold((l) => setMessage('Erro ao atualizar dados'), (r) {
            setUser(r!);
            setMessage('Dados atualizados com sucesso');
          }));
    });
  }
}
