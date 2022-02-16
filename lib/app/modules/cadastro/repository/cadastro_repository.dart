// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:passageiro/app/modules/cadastro/cadastro_store.dart';
import 'package:passageiro/app/modules/cadastro/repository/cadastro_interface.dart';
import 'package:passageiro/app/shared/models/passageiro.dart';

class CadastroRepository implements CadastroInterface {
  @override
  Future<Either<String, Unit>> registerData(Passageiro passageiro) async {
    try {
      await FirebaseFirestore.instance
          .collection('passageiros')
          .doc(passageiro.id)
          .set(passageiro.toJson());

      print(FirebaseAuth.instance.currentUser!.uid);
      return const Right(unit);
    } catch (e) {
      return const Left('Erro ao cadastrar usuario');
    }
  }

  @override
  Future<Either<String, Unit>> signUpWithEmailAndPassword(
      String email, String senha) async {
    CadastroStore store = Modular.get();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: senha);
      await Future.delayed(Duration(seconds: 2));

      store.setIdUsuario(userCredential.user!.uid);
      return Right(unit);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'operation-not-allowed':
          return Left('Operação não realizada');
        case 'email-already-in-use':
          return Left('Este e-mail ja foi cadastrado em nosso sistema');
        case 'invalid-email':
          return Left('E-mail invalido');
        case 'weak-password':
          return Left('Digite uma senha com ao menos 6 digitos');
        default:
          return Left('Erro desconhecido');
      }
    } catch (error) {
      return Left('Erro desconhecido');
    }
  }
}
