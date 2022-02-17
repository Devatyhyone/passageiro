import 'package:dartz/dartz.dart';
import 'package:passageiro/app/shared/models/passageiro.dart';

abstract class ProfileInterface {
  Future<Either<String, Passageiro?>> getUserData(String id);
}
