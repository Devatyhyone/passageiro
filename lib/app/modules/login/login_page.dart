// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:passageiro/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:passageiro/app/shared/core/app_assets.dart';
import 'package:passageiro/app/shared/core/app_colors.dart';
import 'package:pinput/pin_put/pin_put.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: AppColors.secondaryColor),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  void checkuser() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Modular.to.pushReplacementNamed('/home/');
      }
    });
  }

  @override
  void initState() {
    checkuser();
    super.initState();
  }

  void _showDialog(String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                AppAssets.logo,
                width: 50,
              ),
              SizedBox(width: 15),
              Text("Segtaxi"),
            ],
          ),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 120.0),
                    child: Center(
                      child: SizedBox(
                          width: 200, child: Image.asset(AppAssets.logo)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onChanged: (value) {
                        store.setEmail(value);
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'E-mail',
                          hintText: 'Digite seu e-mail',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 20.0),
                    Observer(
                      builder: (_) {
                        return TextFormField(
                          obscureText: !store.visible,
                          onChanged: (value) {
                            store.setSenha(value);
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  store.visible == false
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off_outlined,
                                  color: AppColors.primaryBlue,
                                ),
                                onPressed: () {
                                  store.setVisible(!store.visible);
                                },
                              ),
                              labelText: 'Senha',
                              hintText: 'Digite sua senha',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                        );
                      },
                    ),
                    // Observer(
                    //   builder: (_) {
                    //     return Visibility(
                    //       visible: true,
                    //       child: PinPut(
                    //         onChanged: (value) {
                    //           store.setToken(value);
                    //           log(store.token.toString());
                    //         },
                    //         fieldsCount: 6,
                    //         selectedFieldDecoration: _pinPutDecoration,
                    //         followingFieldDecoration:
                    //             _pinPutDecoration.copyWith(
                    //                 borderRadius: BorderRadius.circular(5),
                    //                 border: Border.all(
                    //                     color: AppColors.primaryBlue)),
                    //         submittedFieldDecoration:
                    //             _pinPutDecoration.copyWith(
                    //           borderRadius: BorderRadius.circular(20.0),
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //       labelText: 'SENHA',
                    //       labelStyle: TextStyle(
                    //           fontFamily: 'Montserrat',
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.grey),
                    //       focusedBorder: UnderlineInputBorder(
                    //           borderSide: BorderSide(color: Colors.green))),
                    //   obscureText: true,
                    // ),
                    SizedBox(height: 5.0),
                    Visibility(
                      visible: store.visible,
                      child: Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                          child: Text(
                            'Esqueceu sua senha?',
                            style: TextStyle(
                                color: AppColors.primaryBlue,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(8.0),
                        shadowColor: Colors.grey,
                        color: AppColors.secondaryColor,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            store.setisLoading(true);
                            store.signInWithPhone().then((value) {
                              value.fold((l) {
                                store.setisLoading(false);
                                _showDialog(l);
                              },
                                  (r) => Modular.to
                                      .pushReplacementNamed('/home/'));
                            });
                          },
                          child: Center(
                            child: Observer(
                              builder: (_) {
                                return Center(
                                  child: store.isLoading == false
                                      ? Text(
                                          'LOGIN',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat'),
                                        )
                                      : CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    // Container(
                    //   height: 40.0,
                    //   color: Colors.transparent,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         border: Border.all(
                    //             color: Colors.black,
                    //             style: BorderStyle.solid,
                    //             width: 1.0),
                    //         color: Colors.transparent,
                    //         borderRadius: BorderRadius.circular(20.0)),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: <Widget>[
                    //         // Center(
                    //         //   child:
                    //         //       ImageIcon(AssetImage('assets/facebook.png')),
                    //         // ),
                    //         // SizedBox(width: 10.0),
                    //         // Center(
                    //         //   child: Text('Log in with facebook',
                    //         //       style: TextStyle(
                    //         //           fontWeight: FontWeight.bold,
                    //         //           fontFamily: 'Montserrat')),
                    //         // )
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                )),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Novo na SegTaxi ?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/cadastro/');
                  },
                  child: Text(
                    'Cadastre-se',
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
