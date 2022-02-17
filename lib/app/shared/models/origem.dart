import 'package:cloud_firestore/cloud_firestore.dart';

class Origem {
  Origem({
    required this.logradouro,
    this.numero,
    required this.cidade,
    required this.bairro,
    required this.cep,
    required this.localizacao,
  });
  late final String? logradouro;
  late final String? numero;
  late final String? cidade;
  late final String? bairro;
  late final String? cep;
  late final GeoPoint? localizacao;

  Origem.fromJson(Map<String, dynamic> json) {
    logradouro = json['logradouro'] ?? '';
    numero = json['numero'] ?? '';
    cidade = json['cidade'] ?? '';
    bairro = json['bairro'] ?? '';
    cep = json['cep'] ?? '';
    localizacao =
        (json['localizacao'] == null ? null : json['localizacao'] as GeoPoint?);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['logradouro'] = logradouro;
    _data['numero'] = numero;
    _data['cidade'] = cidade;
    _data['bairro'] = bairro;
    _data['cep'] = cep;
    _data['localizacao'] = localizacao;

    return _data;
  }
}
