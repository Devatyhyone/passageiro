import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginInterface {
  Future<Either<String, String>>? loginWithEmail(String email, String senha);
}
