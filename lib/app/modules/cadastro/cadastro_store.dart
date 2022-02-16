import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:passageiro/app/modules/cadastro/repository/cadastro_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:passageiro/app/shared/models/passageiro.dart';
import 'package:passageiro/app/shared/models/voucher.dart';

part 'cadastro_store.g.dart';

class CadastroStore = _CadastroStoreBase with _$CadastroStore;

abstract class _CadastroStoreBase with Store {
  final CadastroInterface _repository;

  _CadastroStoreBase(this._repository);

  @observable
  String email = '';

  @action
  void setEmail(String value) {
    email = value;
  }

  @observable
  bool visible = false;

  @action
  void setVisible(bool value) {
    visible = value;
  }

  @observable
  bool textFieldPfVisible = false;

  @action
  void setTextFieldPfVisible(bool value) {
    textFieldPfVisible = value;
  }

  @observable
  bool textFieldPjVisible = false;

  @action
  void setTextFieldPjVisible(bool value) {
    textFieldPjVisible = value;
  }

  @observable
  String senha = '';

  @action
  void setSenha(String value) {
    senha = value;
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
  double? latitudeCorrente;

  @action
  void setLat(double value) {
    latitudeCorrente = value;
  }

  @observable
  double? longitudeCorrente;

  @action
  void setLong(double value) {
    longitudeCorrente = value;
  }

  @observable
  String sexo = '';

  @action
  void setSexo(String value) {
    sexo = value;
  }

  @observable
  String cpf = '';

  @action
  void setCpf(String value) {
    cpf = value;
  }

  @observable
  String cnpj = '';

  @action
  void setCnpj(String value) {
    cnpj = value;
  }

  @observable
  String tipoPessoa = '';

  @action
  void setTipoPessoa(String value) {
    tipoPessoa = value;
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
  String? idUsuario;

  @action
  void setIdUsuario(String value) {
    idUsuario = value;
  }

  @observable
  ObservableFuture<Either<String, Unit>>? signUp;

  @action
  Future<Either<String, Unit>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return signUp =
        _repository.signUpWithEmailAndPassword(email, password).asObservable();
  }

  @computed
  bool get isLoadingSignUp {
    if (signUp == null) return false;
    return signUp!.status == FutureStatus.pending;
  }

  @observable
  ObservableFuture<Either<String, Unit>>? registerData;

  @action
  Future<Either<String, Unit>> registerUserData() {
    Passageiro passageiro = Passageiro(
        id: idUsuario,
        email: email,
        nome: nome,
        estado: estado,
        cidade: cidade,
        bairro: bairro,
        logradouro: logradouro,
        numero: numero,
        celular: celular,
        dataNascimento: dataNascimento,
        latitudeCorrente: latitudeCorrente,
        longitudeCorrente: longitudeCorrente,
        sexo: sexo,
        cpf: cpf,
        cnpj: cnpj,
        tipoPessoa: tipoPessoa,
        tipoUsuario: 'Passageiro',
        enderecoCompleto: enderecoCompleto,
        cep: cep,
        url:
            'https://cdn3.iconfinder.com/data/icons/vector-icons-6/96/256-512.png',
        carteira: 0.0,
        metodoPg: [],
        vouchers: <Voucher>[],
        createdAt: Timestamp.fromDate(DateTime.now()),
        updatedAt: Timestamp.fromDate(DateTime.now()),
        bloqueado: false);

    return registerData = _repository.registerData(passageiro).asObservable();
  }

  @computed
  bool get isLoadingRegisterData {
    if (registerData == null) return false;
    return registerData!.status == FutureStatus.pending;
  }

  @observable
  bool isLoading = false;

  @action
  void setisloading(bool value) {
    isLoading = value;
  }
}
