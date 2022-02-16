// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroStore on _CadastroStoreBase, Store {
  Computed<bool>? _$isLoadingSignUpComputed;

  @override
  bool get isLoadingSignUp =>
      (_$isLoadingSignUpComputed ??= Computed<bool>(() => super.isLoadingSignUp,
              name: '_CadastroStoreBase.isLoadingSignUp'))
          .value;
  Computed<bool>? _$isLoadingRegisterDataComputed;

  @override
  bool get isLoadingRegisterData => (_$isLoadingRegisterDataComputed ??=
          Computed<bool>(() => super.isLoadingRegisterData,
              name: '_CadastroStoreBase.isLoadingRegisterData'))
      .value;

  final _$emailAtom = Atom(name: '_CadastroStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$visibleAtom = Atom(name: '_CadastroStoreBase.visible');

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

  final _$textFieldPfVisibleAtom =
      Atom(name: '_CadastroStoreBase.textFieldPfVisible');

  @override
  bool get textFieldPfVisible {
    _$textFieldPfVisibleAtom.reportRead();
    return super.textFieldPfVisible;
  }

  @override
  set textFieldPfVisible(bool value) {
    _$textFieldPfVisibleAtom.reportWrite(value, super.textFieldPfVisible, () {
      super.textFieldPfVisible = value;
    });
  }

  final _$textFieldPjVisibleAtom =
      Atom(name: '_CadastroStoreBase.textFieldPjVisible');

  @override
  bool get textFieldPjVisible {
    _$textFieldPjVisibleAtom.reportRead();
    return super.textFieldPjVisible;
  }

  @override
  set textFieldPjVisible(bool value) {
    _$textFieldPjVisibleAtom.reportWrite(value, super.textFieldPjVisible, () {
      super.textFieldPjVisible = value;
    });
  }

  final _$senhaAtom = Atom(name: '_CadastroStoreBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$nomeAtom = Atom(name: '_CadastroStoreBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$estadoAtom = Atom(name: '_CadastroStoreBase.estado');

  @override
  String get estado {
    _$estadoAtom.reportRead();
    return super.estado;
  }

  @override
  set estado(String value) {
    _$estadoAtom.reportWrite(value, super.estado, () {
      super.estado = value;
    });
  }

  final _$cidadeAtom = Atom(name: '_CadastroStoreBase.cidade');

  @override
  String get cidade {
    _$cidadeAtom.reportRead();
    return super.cidade;
  }

  @override
  set cidade(String value) {
    _$cidadeAtom.reportWrite(value, super.cidade, () {
      super.cidade = value;
    });
  }

  final _$bairroAtom = Atom(name: '_CadastroStoreBase.bairro');

  @override
  String get bairro {
    _$bairroAtom.reportRead();
    return super.bairro;
  }

  @override
  set bairro(String value) {
    _$bairroAtom.reportWrite(value, super.bairro, () {
      super.bairro = value;
    });
  }

  final _$logradouroAtom = Atom(name: '_CadastroStoreBase.logradouro');

  @override
  String get logradouro {
    _$logradouroAtom.reportRead();
    return super.logradouro;
  }

  @override
  set logradouro(String value) {
    _$logradouroAtom.reportWrite(value, super.logradouro, () {
      super.logradouro = value;
    });
  }

  final _$numeroAtom = Atom(name: '_CadastroStoreBase.numero');

  @override
  String get numero {
    _$numeroAtom.reportRead();
    return super.numero;
  }

  @override
  set numero(String value) {
    _$numeroAtom.reportWrite(value, super.numero, () {
      super.numero = value;
    });
  }

  final _$celularAtom = Atom(name: '_CadastroStoreBase.celular');

  @override
  String get celular {
    _$celularAtom.reportRead();
    return super.celular;
  }

  @override
  set celular(String value) {
    _$celularAtom.reportWrite(value, super.celular, () {
      super.celular = value;
    });
  }

  final _$dataNascimentoAtom = Atom(name: '_CadastroStoreBase.dataNascimento');

  @override
  Timestamp? get dataNascimento {
    _$dataNascimentoAtom.reportRead();
    return super.dataNascimento;
  }

  @override
  set dataNascimento(Timestamp? value) {
    _$dataNascimentoAtom.reportWrite(value, super.dataNascimento, () {
      super.dataNascimento = value;
    });
  }

  final _$latitudeCorrenteAtom =
      Atom(name: '_CadastroStoreBase.latitudeCorrente');

  @override
  double? get latitudeCorrente {
    _$latitudeCorrenteAtom.reportRead();
    return super.latitudeCorrente;
  }

  @override
  set latitudeCorrente(double? value) {
    _$latitudeCorrenteAtom.reportWrite(value, super.latitudeCorrente, () {
      super.latitudeCorrente = value;
    });
  }

  final _$longitudeCorrenteAtom =
      Atom(name: '_CadastroStoreBase.longitudeCorrente');

  @override
  double? get longitudeCorrente {
    _$longitudeCorrenteAtom.reportRead();
    return super.longitudeCorrente;
  }

  @override
  set longitudeCorrente(double? value) {
    _$longitudeCorrenteAtom.reportWrite(value, super.longitudeCorrente, () {
      super.longitudeCorrente = value;
    });
  }

  final _$sexoAtom = Atom(name: '_CadastroStoreBase.sexo');

  @override
  String get sexo {
    _$sexoAtom.reportRead();
    return super.sexo;
  }

  @override
  set sexo(String value) {
    _$sexoAtom.reportWrite(value, super.sexo, () {
      super.sexo = value;
    });
  }

  final _$cpfAtom = Atom(name: '_CadastroStoreBase.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$cnpjAtom = Atom(name: '_CadastroStoreBase.cnpj');

  @override
  String get cnpj {
    _$cnpjAtom.reportRead();
    return super.cnpj;
  }

  @override
  set cnpj(String value) {
    _$cnpjAtom.reportWrite(value, super.cnpj, () {
      super.cnpj = value;
    });
  }

  final _$tipoPessoaAtom = Atom(name: '_CadastroStoreBase.tipoPessoa');

  @override
  String get tipoPessoa {
    _$tipoPessoaAtom.reportRead();
    return super.tipoPessoa;
  }

  @override
  set tipoPessoa(String value) {
    _$tipoPessoaAtom.reportWrite(value, super.tipoPessoa, () {
      super.tipoPessoa = value;
    });
  }

  final _$enderecoCompletoAtom =
      Atom(name: '_CadastroStoreBase.enderecoCompleto');

  @override
  String get enderecoCompleto {
    _$enderecoCompletoAtom.reportRead();
    return super.enderecoCompleto;
  }

  @override
  set enderecoCompleto(String value) {
    _$enderecoCompletoAtom.reportWrite(value, super.enderecoCompleto, () {
      super.enderecoCompleto = value;
    });
  }

  final _$cepAtom = Atom(name: '_CadastroStoreBase.cep');

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  final _$idUsuarioAtom = Atom(name: '_CadastroStoreBase.idUsuario');

  @override
  String? get idUsuario {
    _$idUsuarioAtom.reportRead();
    return super.idUsuario;
  }

  @override
  set idUsuario(String? value) {
    _$idUsuarioAtom.reportWrite(value, super.idUsuario, () {
      super.idUsuario = value;
    });
  }

  final _$signUpAtom = Atom(name: '_CadastroStoreBase.signUp');

  @override
  ObservableFuture<Either<String, Unit>>? get signUp {
    _$signUpAtom.reportRead();
    return super.signUp;
  }

  @override
  set signUp(ObservableFuture<Either<String, Unit>>? value) {
    _$signUpAtom.reportWrite(value, super.signUp, () {
      super.signUp = value;
    });
  }

  final _$registerDataAtom = Atom(name: '_CadastroStoreBase.registerData');

  @override
  ObservableFuture<Either<String, Unit>>? get registerData {
    _$registerDataAtom.reportRead();
    return super.registerData;
  }

  @override
  set registerData(ObservableFuture<Either<String, Unit>>? value) {
    _$registerDataAtom.reportWrite(value, super.registerData, () {
      super.registerData = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CadastroStoreBase.isLoading');

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

  final _$_CadastroStoreBaseActionController =
      ActionController(name: '_CadastroStoreBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVisible(bool value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setVisible');
    try {
      return super.setVisible(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTextFieldPfVisible(bool value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setTextFieldPfVisible');
    try {
      return super.setTextFieldPfVisible(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTextFieldPjVisible(bool value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setTextFieldPjVisible');
    try {
      return super.setTextFieldPjVisible(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome(String value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEstado(String value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setEstado');
    try {
      return super.setEstado(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCidade(String value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setCidade');
    try {
      return super.setCidade(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBairro(String value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setBairro');
    try {
      return super.setBairro(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLogradouro(String value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setLogradouro');
    try {
      return super.setLogradouro(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumero(String value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setNumero');
    try {
      return super.setNumero(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCelular(String value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setCelular');
    try {
      return super.setCelular(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataNascimento(Timestamp value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setDataNascimento');
    try {
      return super.setDataNascimento(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLat(double value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setLat');
    try {
      return super.setLat(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLong(double value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setLong');
    try {
      return super.setLong(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSexo(String value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setSexo');
    try {
      return super.setSexo(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCnpj(String value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setCnpj');
    try {
      return super.setCnpj(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTipoPessoa(String value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setTipoPessoa');
    try {
      return super.setTipoPessoa(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEnderecoCompleto(String value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setEnderecoCompleto');
    try {
      return super.setEnderecoCompleto(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCep(String value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setCep');
    try {
      return super.setCep(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdUsuario(String value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setIdUsuario');
    try {
      return super.setIdUsuario(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<Either<String, Unit>> signUpWithEmailAndPassword(
      {required String email, required String password}) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.signUpWithEmailAndPassword');
    try {
      return super.signUpWithEmailAndPassword(email: email, password: password);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<Either<String, Unit>> registerUserData() {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.registerUserData');
    try {
      return super.registerUserData();
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setisloading(bool value) {
    final _$actionInfo = _$_CadastroStoreBaseActionController.startAction(
        name: '_CadastroStoreBase.setisloading');
    try {
      return super.setisloading(value);
    } finally {
      _$_CadastroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
visible: ${visible},
textFieldPfVisible: ${textFieldPfVisible},
textFieldPjVisible: ${textFieldPjVisible},
senha: ${senha},
nome: ${nome},
estado: ${estado},
cidade: ${cidade},
bairro: ${bairro},
logradouro: ${logradouro},
numero: ${numero},
celular: ${celular},
dataNascimento: ${dataNascimento},
latitudeCorrente: ${latitudeCorrente},
longitudeCorrente: ${longitudeCorrente},
sexo: ${sexo},
cpf: ${cpf},
cnpj: ${cnpj},
tipoPessoa: ${tipoPessoa},
enderecoCompleto: ${enderecoCompleto},
cep: ${cep},
idUsuario: ${idUsuario},
signUp: ${signUp},
registerData: ${registerData},
isLoading: ${isLoading},
isLoadingSignUp: ${isLoadingSignUp},
isLoadingRegisterData: ${isLoadingRegisterData}
    ''';
  }
}
