import 'package:dartz/dartz.dart';
import 'package:passageiro/app/shared/models/passageiro.dart';

abstract class CadastroInterface {
  Future<Either<String, Unit>> signUpWithEmailAndPassword(
      String email, String senha);
  Future<Either<String, Unit>> registerData(Passageiro passageiro);
}
