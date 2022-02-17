import 'package:cloud_firestore/cloud_firestore.dart';

class Motorista {
  Motorista({
    required this.endereco,
    required this.tipoPg,
    required this.bloqueado,
    required this.localizacaoAtual,
    required this.createdAt,
    required this.nome,
    required this.unidade,
    required this.saldo,
    required this.url,
    required this.documentos,
    required this.updatedAt,
    required this.genero,
    required this.statusCadastro,
    required this.cpf,
    required this.celular,
    required this.turnos,
    required this.tipoUsuario,
    required this.id,
    required this.sobrenome,
    required this.dataNascimento,
    required this.cnh,
    required this.enderecoCompleto,
    required this.email,
    required this.dadosBancarios,
  });
  late final Endereco? endereco;
  late final String? tipoPg;
  late final bool? bloqueado;
  late final GeoPoint? localizacaoAtual;
  late final Timestamp? createdAt;
  late final String? nome;
  late final String? unidade;
  late final double? saldo;
  late final String? url;
  late final Documentos? documentos;
  late final Timestamp? updatedAt;
  late final String? genero;
  late final String? statusCadastro;
  late final String? cpf;
  late final String? celular;
  late final List<String>? turnos;
  late final String? tipoUsuario;
  late final String? id;
  late final String? sobrenome;
  late final Timestamp? dataNascimento;
  late final String? cnh;
  late final String? enderecoCompleto;
  late final String? email;
  late final DadosBancarios? dadosBancarios;

  Motorista.fromJson(Map<String, dynamic> json) {
    endereco = json['endereco'] == null
        ? Endereco(
            cidade: '',
            estado: '',
            numero: '',
            bairro: '',
            logradouro: '',
            cep: '')
        : Endereco.fromJson(json['endereco']);
    tipoPg = json['tipoPg'] ?? '';
    bloqueado = json['bloqueado'] ?? false;
    localizacaoAtual = json['localizacaoAtual'] ??
        GeoPoint(json['localizacaoAtual']['latitude'],
            json['localizacaoAtual']['longitude']);
    createdAt = json['created_at'] ?? Timestamp.now();
    nome = json['nome'] ?? '';
    unidade = json['unidade'] ?? '';
    saldo = json['saldo'] ?? 0.0;
    url = json['url'] ?? '';
    documentos = json['documentos'] == null
        ? Documentos(
            urlCarteiraTaxistaFrente: '',
            urlCarteiraTaxistaverso: '',
            urlCnhFrente: '',
            urlCnhVerso: '',
            urlPlacaTaxi: '',
          )
        : Documentos.fromJson(json['documentos']);
    updatedAt = json['updated_at'] ?? Timestamp.now();
    genero = json['genero'] ?? '';
    statusCadastro = json['statusCadastro'] ?? '';
    cpf = json['cpf'] ?? '';
    celular = json['celular'] ?? '';
    turnos = json['turnos'] == null
        ? <String>[]
        : List.castFrom<dynamic, String>(json['turnos'] as List);

    tipoUsuario = json['tipoUsuario'] ?? '';
    id = json['id'] ?? '';
    sobrenome = json['sobrenome'] ?? '';
    dataNascimento = (json['dataNascimento'] == null
        ? null
        : json['dataNascimento'] as Timestamp?);
    cnh = json['cnh'] ?? '';
    enderecoCompleto = json['enderecoCompleto'] ?? '';
    email = json['email'] ?? '';
    dadosBancarios = json['dadosBancarios'] == null
        ? DadosBancarios(
            agencia: 'agencia',
            banco: 'banco',
            numeroDaConta: 'numeroDaConta',
            operacao: 'operacao',
            tipoConta: 'tipoConta')
        : DadosBancarios.fromJson(json['dadosBancarios']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['endereco'] = endereco?.toJson();
    _data['tipoPg'] = tipoPg;
    _data['bloqueado'] = bloqueado;
    _data['localizacaoAtual'] = localizacaoAtual;
    _data['created_at'] = createdAt;
    _data['nome'] = nome;
    _data['unidade'] = unidade;
    _data['saldo'] = saldo;
    _data['url'] = url;
    _data['documentos'] = documentos?.toJson();
    _data['updated_at'] = updatedAt;
    _data['genero'] = genero;
    _data['statusCadastro'] = statusCadastro;
    _data['cpf'] = cpf;
    _data['celular'] = celular;
    _data['turnos'] = turnos;
    _data['tipoUsuario'] = tipoUsuario;
    _data['id'] = id;
    _data['sobrenome'] = sobrenome;
    _data['dataNascimento'] = dataNascimento;
    _data['cnh'] = cnh;
    _data['enderecoCompleto'] = enderecoCompleto;
    _data['email'] = email;
    _data['dadosBancarios'] = dadosBancarios?.toJson();
    return _data;
  }
}

class Endereco {
  Endereco({
    required this.cidade,
    required this.estado,
    required this.numero,
    required this.bairro,
    required this.logradouro,
    required this.cep,
  });
  late final String cidade;
  late final String estado;
  late final String numero;
  late final String bairro;
  late final String logradouro;
  late final String cep;

  Endereco.fromJson(Map<String, dynamic> json) {
    cidade = json['cidade'];
    estado = json['estado'];
    numero = json['numero'];
    bairro = json['bairro'];
    logradouro = json['logradouro'];
    cep = json['cep'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cidade'] = cidade;
    _data['estado'] = estado;
    _data['numero'] = numero;
    _data['bairro'] = bairro;
    _data['logradouro'] = logradouro;
    _data['cep'] = cep;
    return _data;
  }
}

class Documentos {
  Documentos({
    required this.urlPlacaTaxi,
    required this.urlCarteiraTaxistaverso,
    required this.urlCnhVerso,
    required this.urlCarteiraTaxistaFrente,
    required this.urlCnhFrente,
  });
  late final String? urlPlacaTaxi;
  late final String? urlCarteiraTaxistaverso;
  late final String? urlCnhVerso;
  late final String? urlCarteiraTaxistaFrente;
  late final String? urlCnhFrente;

  Documentos.fromJson(Map<String, dynamic> json) {
    urlPlacaTaxi = json['urlPlacaTaxi'] ?? '';
    urlCarteiraTaxistaverso = json['urlCarteiraTaxistaverso'] ?? '';
    urlCnhVerso = json['urlCnhVerso'] ?? '';
    urlCarteiraTaxistaFrente = json['urlCarteiraTaxistaFrente'] ?? '';
    urlCnhFrente = json['urlCnhFrente'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['urlPlacaTaxi'] = urlPlacaTaxi;
    _data['urlCarteiraTaxistaverso'] = urlCarteiraTaxistaverso;
    _data['urlCnhVerso'] = urlCnhVerso;
    _data['urlCarteiraTaxistaFrente'] = urlCarteiraTaxistaFrente;
    _data['urlCnhFrente'] = urlCnhFrente;
    return _data;
  }
}

class DadosBancarios {
  DadosBancarios({
    required this.agencia,
    required this.banco,
    required this.numeroDaConta,
    required this.operacao,
    required this.tipoConta,
  });
  late final String agencia;
  late final String banco;
  late final String numeroDaConta;
  late final String operacao;
  late final String tipoConta;

  DadosBancarios.fromJson(Map<String, dynamic> json) {
    agencia = json['agencia'];
    banco = json['banco'];
    numeroDaConta = json['numeroDaConta'];
    operacao = json['operacao'];
    tipoConta = json['tipoConta'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['agencia'] = agencia;
    _data['banco'] = banco;
    _data['numeroDaConta'] = numeroDaConta;
    _data['operacao'] = operacao;
    _data['tipoConta'] = tipoConta;
    return _data;
  }
}
