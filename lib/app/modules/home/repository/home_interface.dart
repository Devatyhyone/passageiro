import 'package:dartz/dartz.dart';
import 'package:passageiro/app/shared/models/corrida.dart';
import 'package:passageiro/app/shared/models/passageiro.dart';

abstract class HomeInterface {
  Future<Either<String, Passageiro?>> getUserData(String id);
  Future<Either<String, Unit>> chamarTaxi(Corrida empresa);
}
