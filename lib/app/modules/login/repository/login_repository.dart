// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/src/providers/phone_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:passageiro/app/modules/login/repository/login_interface.dart';

class LoginRepository implements LoginInterface {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Future<Either<String, String>>? loginWithEmail(
      String email, String senha) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String errormsg = '';
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: senha);
      await auth.currentUser!.reload();

      return Right(auth.currentUser!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errormsg = 'Usuario nao encontrado';
      } else if (e.code == 'wrong-password') {
        errormsg = 'Senha incorreta';
      }
    }
    return Left(errormsg);
  }
}
