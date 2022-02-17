import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:passageiro/app/shared/models/voucher.dart';

class Passageiro {
  Passageiro(
      {required this.id,
      required this.email,
      required this.nome,
      required this.estado,
      required this.cidade,
      required this.bairro,
      required this.logradouro,
      required this.numero,
      required this.celular,
      required this.dataNascimento,
      required this.localizacaoAtual,
      required this.sexo,
      required this.cpf,
      required this.cnpj,
      required this.tipoPessoa,
      required this.tipoUsuario,
      required this.enderecoCompleto,
      required this.cep,
      required this.url,
      required this.carteira,
      required this.metodoPg,
      required this.vouchers,
      required this.createdAt,
      required this.updatedAt,
      required this.bloqueado});
  late final String? id;
  late final String? email;
  late final String? nome;
  late final String? estado;
  late final String? cidade;
  late final String? bairro;
  late final String? logradouro;
  late final String? numero;
  late final String? celular;
  late final Timestamp? dataNascimento;
  late final GeoPoint? localizacaoAtual;
  late final String? sexo;
  late final String? cpf;
  late final String? cnpj;
  late final String? tipoPessoa;
  late final String? tipoUsuario;
  late final String? enderecoCompleto;
  late final String? cep;
  late final String? url;
  late final double? carteira;
  late final List<String>? metodoPg;
  late final List<Voucher>? vouchers;
  late final Timestamp? createdAt;
  late final Timestamp? updatedAt;
  late final bool? bloqueado;

  Passageiro.fromJson(Map<String, dynamic> json) {
    id = json['id'] == null ? '' : json['id'] as String?;
    email = json['email'] == null ? '' : json['email'] as String?;
    nome = json['nome'] == null ? '' : json['nome'] as String?;
    estado = json['estado'] == null ? '' : json['estado'] as String?;
    cidade = json['cidade'] == null ? '' : json['cidade'] as String?;
    bairro = json['bairro'] == null ? '' : json['bairro'] as String?;
    logradouro =
        json['logradouro'] == null ? '' : json['logradouro'] as String?;
    numero = json['numero'] == null ? '' : json['numero'] as String?;
    celular = json['celular'] == null ? '' : json['celular'] as String?;
    dataNascimento = (json['dataNascimento'] == null
        ? null
        : json['dataNascimento'] as Timestamp?);
    localizacaoAtual = (json['localizacaoAtual'] == null
        ? null
        : json['localizacaoAtual'] as GeoPoint?);
    sexo = json['sexo'] == null ? '' : json['sexo'] as String?;
    cpf = json['cpf'] == null ? '' : json['cpf'] as String?;
    cnpj = json['cnpj'] == null ? '' : json['cnpj'] as String?;
    tipoPessoa =
        json['tipoPessoa'] == null ? '' : json['tipoPessoa'] as String?;
    tipoUsuario =
        json['tipoUsuario'] == null ? '' : json['tipoUsuario'] as String?;
    enderecoCompleto = json['enderecoCompleto'] == null
        ? ''
        : json['enderecoCompleto'] as String?;
    cep = json['cep'] == null ? '' : json['cep'] as String?;
    url = json['url'] == null ? '' : json['url'] as String?;
    carteira = json['carteira'] == null ? 0.0 : json['carteira'] as double?;
    vouchers = (json['vouchers'] as List?)
        ?.map((dynamic e) => Voucher.fromJson(e as Map<String, dynamic>))
        .toList();
    metodoPg = json['metodoPg'] == null
        ? <String>[]
        : List.castFrom<dynamic, String>(json['metodoPg'] as List);

    createdAt =
        (json['created_at'] == null ? null : json['created_at'] as Timestamp?);
    updatedAt =
        (json['updated_at'] == null ? null : json['updated_at'] as Timestamp?);
    bloqueado = json['bloqueado'] == null ? false : json['bloqueado'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['nome'] = nome;
    _data['estado'] = estado;
    _data['cidade'] = cidade;
    _data['bairro'] = bairro;
    _data['logradouro'] = logradouro;
    _data['numero'] = numero;
    _data['celular'] = celular;
    _data['dataNascimento'] = dataNascimento;
    _data['localizacaoAtual'] = localizacaoAtual;
    _data['sexo'] = sexo;
    _data['cpf'] = cpf;
    _data['cnpj'] = cnpj;
    _data['tipoPessoa'] = tipoPessoa;
    _data['tipoUsuario'] = tipoUsuario;
    _data['enderecoCompleto'] = enderecoCompleto;
    _data['cep'] = cep;
    _data['url'] = url;
    _data['carteira'] = carteira;
    _data['metodoPg'] = metodoPg;
    _data['vouchers'] = vouchers?.map((e) => e.toJson()).toList();
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['bloqueado'] = bloqueado;
    return _data;
  }
}
