// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:passageiro/app/modules/home/repository/home_interface.dart';
import 'package:passageiro/app/shared/core/metodos_pagamento.dart';
import 'package:passageiro/app/shared/core/status_corrida.dart';
import 'package:passageiro/app/shared/models/corrida.dart';
import 'package:passageiro/app/shared/models/destino.dart';
import 'package:passageiro/app/shared/models/origem.dart';
import 'package:passageiro/app/shared/models/passageiro.dart';
import 'package:passageiro/app/shared/models/voucher.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:uuid/uuid.dart';
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
      localizacaoAtual: GeoPoint(0.0, 0.0),
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

  @observable
  String enderecoDestino = '';

  @action
  void setEnderecoDestino(String value) {
    enderecoDestino = value;
  }

  @observable
  Origem origem = Origem(
      logradouro: '',
      cidade: '',
      bairro: '',
      cep: '',
      localizacao: GeoPoint(0.0, 0.0));

  @action
  void setorigem(Origem value) {
    origem = value;
  }

  @observable
  Destino destino = Destino(
    logradouro: '',
    cidade: '',
    bairro: '',
    cep: '',
    localizacao: GeoPoint(0.0, 0.0),
  );

  @action
  void setDestino(Destino value) {
    destino = value;
  }

  @observable
  ObservableFuture<Either<String, Unit>>? corrida;

  @action
  Future<Either<String, Unit>> chamarTaxi() {
    var uuid = Uuid();
    String idCorrida = uuid.v4();

    Corrida newCorrida = Corrida(
        observacao: '',
        motivoCancelamento: '',
        voucher: null,
        origem: origem,
        valorFinal: '15.90',
        tempoPrevisto: '18 minutos',
        metodoPg: MetodosPagamento.DINHEIRO,
        dataCorrida: Timestamp.fromDate(DateTime.now()),
        horaTermino: null,
        id: idCorrida,
        destino: destino,
        passageiro: passageiro,
        avaliacaoCorrida: null,
        veiculo: 'Astra',
        valorMedio: '',
        horaInicio: null,
        duracaoCorrida: null,
        avaliacaoComentario: '',
        distanciaKm: '20 Km',
        idUsuarioCancelamento: null,
        valorMaximo: '',
        motorista: null,
        valorMinimo: '',
        veiculoAdaptado: false,
        status: StatusCorrida.BUSCANDO_MOTORISTA);

    return corrida = _repository.chamarTaxi(newCorrida).asObservable();
  }

  @computed
  bool get isLoadingCorrida {
    if (corrida == null) return false;
    return corrida!.status == FutureStatus.pending;
  }
}
