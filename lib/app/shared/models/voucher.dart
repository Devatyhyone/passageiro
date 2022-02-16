import 'package:cloud_firestore/cloud_firestore.dart';

class Voucher {
  Voucher({
    required this.numero,
    required this.empresa,
    required this.dataEmissao,
    required this.dataDeslocamento,
    required this.hora,
    required this.origem,
    required this.destino,
    required this.motivo,
    required this.placaUnidade,
    required this.marca,
    required this.valor,
    required this.autorizadoPor,
    required this.passageiro,
  });
  late final String? numero;
  late final String? empresa;
  late final Timestamp? dataEmissao;
  late final Timestamp? dataDeslocamento;
  late final Timestamp? hora;
  late final String? origem;
  late final String? destino;
  late final String? motivo;
  late final String? placaUnidade;
  late final String? marca;
  late final String? valor;
  late final String? autorizadoPor;
  late final String? passageiro;

  Voucher.fromJson(Map<String, dynamic> json) {
    numero = json['numero'] == null ? '' : json['numero'] as String?;
    empresa = json['empresa'] == null ? '' : json['empresa'] as String?;
    dataEmissao = (json['data_emissao'] == null
        ? null
        : json['data_emissao'] as Timestamp?);
    dataDeslocamento = (json['data_deslocamento'] == null
        ? null
        : json['data_deslocamento'] as Timestamp?);
    hora = (json['hora'] == null ? null : json['hora'] as Timestamp?);
    origem = json['origem'] == null ? '' : json['origem'] as String?;
    destino = json['destino'] == null ? '' : json['destino'] as String?;
    motivo = json['motivo'] == null ? '' : json['motivo'] as String?;
    placaUnidade =
        json['placa_unidade'] == null ? '' : json['placa_unidade'] as String?;
    marca = json['marca'] == null ? '' : json['marca'] as String?;
    valor = json['valor'] == null ? '' : json['valor'] as String?;
    autorizadoPor =
        json['autorizado_por'] == null ? '' : json['autorizado_por'] as String?;
    passageiro =
        json['passageiro'] == null ? '' : json['passageiro'] as String?;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['numero'] = numero;
    _data['empresa'] = empresa;
    _data['data_emissao'] = dataEmissao;
    _data['data_deslocamento'] = dataDeslocamento;
    _data['hora'] = hora;
    _data['origem'] = origem;
    _data['destino'] = destino;
    _data['motivo'] = motivo;
    _data['placa_unidade'] = placaUnidade;
    _data['marca'] = marca;
    _data['valor'] = valor;
    _data['autorizado_por'] = autorizadoPor;
    _data['passageiro'] = passageiro;
    return _data;
  }
}
