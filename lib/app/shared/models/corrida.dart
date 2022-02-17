import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:passageiro/app/shared/models/motorista.dart';
import 'package:passageiro/app/shared/models/passageiro.dart';
import 'package:passageiro/app/shared/models/voucher.dart';

import 'destino.dart';
import 'origem.dart';

class Corrida {
  Corrida({
    required this.observacao,
    required this.motivoCancelamento,
    required this.voucher,
    required this.origem,
    required this.valorFinal,
    required this.tempoPrevisto,
    required this.metodoPg,
    required this.dataCorrida,
    required this.horaTermino,
    required this.id,
    required this.destino,
    required this.passageiro,
    required this.avaliacaoCorrida,
    required this.veiculo,
    required this.valorMedio,
    required this.horaInicio,
    required this.duracaoCorrida,
    required this.avaliacaoComentario,
    required this.distanciaKm,
    required this.idUsuarioCancelamento,
    required this.valorMaximo,
    required this.motorista,
    required this.valorMinimo,
    required this.veiculoAdaptado,
    required this.status,
  });
  late final String? observacao;
  late final String? motivoCancelamento;
  late final Voucher? voucher;
  late final Origem? origem;
  late final String? valorFinal;
  late final String? tempoPrevisto;
  late final String? metodoPg;
  late final Timestamp? dataCorrida;
  late final Timestamp? horaTermino;
  late final String? id;
  late final Destino? destino;
  late final Passageiro? passageiro;
  late final double? avaliacaoCorrida;
  late final String? veiculo;
  late final String? valorMedio;
  late final Timestamp? horaInicio;
  late final String? duracaoCorrida;
  late final String? avaliacaoComentario;
  late final String? distanciaKm;
  late final String? idUsuarioCancelamento;
  late final String? valorMaximo;
  late final Motorista? motorista;
  late final String? valorMinimo;
  late final bool? veiculoAdaptado;
  late final String? status;

  Corrida.fromJson(Map<String, dynamic> json) {
    observacao = json['observacao'] ?? '';
    motivoCancelamento = json['motivoCancelamento'] ?? '';
    voucher =
        json['voucher'] == null ? null : Voucher.fromJson(json['voucher']);
    origem = json['origem'] == null ? null : Origem.fromJson(json['origem']);
    valorFinal = json['valor_final'] ?? '';
    tempoPrevisto = json['tempo_previsto'] ?? "";
    metodoPg = json['metodo_pg'] ?? '';
    dataCorrida = json['dataCorrida'] ?? Timestamp.now();
    horaTermino = json['hora_termino'] ?? Timestamp.now();
    id = json['id'] ?? '';
    destino =
        json['destino'] == null ? null : Destino.fromJson(json['destino']);
    passageiro = json['passageiro'] == null
        ? null
        : Passageiro.fromJson(json['passageiro']);
    avaliacaoCorrida = json['avaliacao_corrida'] ?? '';
    veiculo = json['veiculo'] ?? '';
    valorMedio = json['valor_medio'] ?? '';
    horaInicio = json['hora_inicio'] ?? '';
    duracaoCorrida = json['duracao_corrida'] ?? '';
    avaliacaoComentario = json['avaliacao_comentario'] ?? '';
    distanciaKm = json['distancia_km'] ?? '';
    idUsuarioCancelamento = json['id_usuario_cancelamento'] ?? '';
    valorMaximo = json['valor_maximo'] ?? '';
    motorista = json['motorista'] ?? '';
    valorMinimo = json['valor_minimo'] ?? '';
    veiculoAdaptado = json['veiculo_adaptado'] ?? false;
    status = json['status'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['observacao'] = observacao;
    _data['motivoCancelamento'] = motivoCancelamento;
    _data['voucher'] = voucher?.toJson();
    _data['origem'] = origem?.toJson();
    _data['valor_final'] = valorFinal;
    _data['tempo_previsto'] = tempoPrevisto;
    _data['metodo_pg'] = metodoPg;
    _data['dataCorrida'] = dataCorrida;
    _data['hora_termino'] = horaTermino;
    _data['id'] = id;
    _data['destino'] = destino?.toJson();
    _data['passageiro'] = passageiro?.toJson();
    _data['avaliacao_corrida'] = avaliacaoCorrida;
    _data['veiculo'] = veiculo;
    _data['valor_medio'] = valorMedio;
    _data['hora_inicio'] = horaInicio;
    _data['duracao_corrida'] = duracaoCorrida;
    _data['avaliacao_comentario'] = avaliacaoComentario;
    _data['distancia_km'] = distanciaKm;
    _data['id_usuario_cancelamento'] = idUsuarioCancelamento;
    _data['valor_maximo'] = valorMaximo;
    _data['motorista'] = motorista?.toJson();
    _data['valor_minimo'] = valorMinimo;
    _data['veiculo_adaptado'] = veiculoAdaptado;
    _data['status'] = status;
    return _data;
  }
}
