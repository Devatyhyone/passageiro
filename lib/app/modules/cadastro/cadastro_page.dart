// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:passageiro/app/modules/cadastro/cadastro_store.dart';
import 'package:flutter/material.dart';
import 'package:passageiro/app/shared/core/app_assets.dart';
import 'package:passageiro/app/shared/core/app_colors.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key? key, this.title = 'CadastroPage'}) : super(key: key);
  @override
  CadastroPageState createState() => CadastroPageState();
}

class CadastroPageState extends State<CadastroPage> {
  final CadastroStore store = Modular.get();
  static final initialPosition =
      LatLng(-21.761020932044648, -43.34880030993253);

  PickResult? selectedPlace;
  TextEditingController controllerEndereco = TextEditingController();

  var maskFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var dateFormatter = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var cpfMask = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var cnpjMask = MaskTextInputFormatter(
      mask: '##.###.###/####-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

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

  cadastrar() async {
    if (store.email.isNotEmpty || store.email.contains('@')) {
      if (store.senha.isNotEmpty) {
        if (store.enderecoCompleto.isNotEmpty && store.numero.isNotEmpty) {
          if (store.nome.isNotEmpty) {
            if (store.celular.isNotEmpty) {
              if (store.dataNascimento != null) {
                if (store.sexo.isNotEmpty) {
                  if (store.tipoPessoa.isNotEmpty) {
                    store.setisloading(true);
                    await store
                        .signUpWithEmailAndPassword(
                            email: store.email, password: store.senha)
                        .then((value) => value.fold((l) {
                              store.setisloading(false);
                              _showDialog(l);
                            }, (r) async {
                              store.setisloading(false);
                              log('Cadastrou');
                              await store.registerUserData().then((value) =>
                                  value.fold(
                                      (l) => _showDialog(l),
                                      (r) => Modular.to
                                          .pushReplacementNamed('/home/')));
                            }));
                  } else {
                    _showDialog('Informe o tipo de cadastro');
                  }
                } else {
                  _showDialog('Informe o genero');
                }
              } else {
                _showDialog('Informe sua data de nascimento');
              }
            } else {
              _showDialog('Informe seu celular');
            }
          } else {
            _showDialog('Informe seu nome');
          }
        } else {
          _showDialog('Informe seu endereço completo');
        }
      } else {
        _showDialog('Digite uma senha com pelo menos 6 digitos');
      }
    } else {
      _showDialog('Preencha seu e-mail');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Cadastro',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: AppColors.secondaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
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
                                    borderSide:
                                        BorderSide(color: Colors.green))),
                          );
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: controllerEndereco,
                        maxLines: 2,
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PlacePicker(
                              apiKey: 'AIzaSyCyLjUwQHNXkMl7GECJv4YrjX2HLYY81uQ',
                              hintText: "Pesquisar ...",
                              searchingText: "Por favor aguarde ...",
                              selectText: "Selecionar",
                              outsideOfPickAreaText: "Local fora de área",
                              initialPosition: initialPosition,
                              useCurrentLocation: true,
                              selectInitialPosition: true,
                              usePinPointingSearch: true,
                              usePlaceDetailSearch: true,
                              onPlacePicked: (result) async {
                                selectedPlace = result;

                                Navigator.of(context).pop();
                                final coordinates = Coordinates(
                                    selectedPlace!.geometry!.location.lat,
                                    selectedPlace!.geometry!.location.lng);
                                var addresses = await Geocoder.local
                                    .findAddressesFromCoordinates(coordinates);
                                var first = addresses.first;

                                store.setEstado(first.adminArea!);
                                store.setCidade(first.subAdminArea!);
                                store.setBairro(first.subLocality!);
                                store.setLogradouro(first.thoroughfare!);
                                store.setEnderecoCompleto(
                                    result.formattedAddress.toString());
                                store.setLat(
                                    selectedPlace!.geometry!.location.lat);
                                store.setLong(
                                    selectedPlace!.geometry!.location.lng);
                                store.setCep(first.postalCode.toString());
                                if (first.subThoroughfare != null) {
                                  store.setNumero(
                                      first.subThoroughfare.toString());
                                }

                                setState(() {
                                  controllerEndereco.text =
                                      result.formattedAddress.toString();
                                });
                              },
                            );
                          }));
                        },
                        readOnly: true,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                            labelText: 'Endereço',
                            hintText: 'Endereço',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        onChanged: (value) {
                          store.setNome(value);
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: 'Nome',
                            hintText: 'Digite seu nome',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),

                      SizedBox(height: 20.0),
                      TextFormField(
                        onChanged: (value) {
                          store.setCelular(value);
                        },
                        keyboardType: TextInputType.phone,
                        inputFormatters: [maskFormatter],
                        decoration: InputDecoration(
                            labelText: 'Celular',
                            hintText: 'Digite seu celular com DDD',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        onChanged: (value) {
                          if (value.length == 10) {
                            DateFormat format = DateFormat("dd/MM/yyyy");
                            DateTime data = format.parse(value);
                            store.setDataNascimento(Timestamp.fromDate(data));
                            log(store.dataNascimento!.toDate().toString());
                          }
                          log(value.length.toString());
                        },
                        keyboardType: TextInputType.datetime,
                        inputFormatters: [dateFormatter],
                        decoration: InputDecoration(
                            labelText: 'Data de Nascimento',
                            hintText: 'Digite sua Data de Nascimento',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Selecione o tipo de cadastro',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      SizedBox(height: 5),
                      GroupButton(
                          options: GroupButtonOptions(
                              borderRadius: BorderRadius.circular(8),
                              selectedColor: AppColors.secondaryColor),
                          isRadio: true,
                          buttons: ['Pessoa Física', 'Pessoa Juridica'],
                          onSelected: (i, selected) {
                            if (i == 0) {
                              store.setTipoPessoa('Pessoa Física');
                              store.setTextFieldPfVisible(true);
                              store.setTextFieldPjVisible(false);
                            } else if (i == 1) {
                              store.setTipoPessoa('Pessoa Juridica');
                              store.setTextFieldPfVisible(false);
                              store.setTextFieldPjVisible(true);
                            }
                            log(store.tipoPessoa.toString());
                          }),
                      SizedBox(height: 20.0),
                      Observer(
                        builder: (_) {
                          return Visibility(
                            visible: store.textFieldPfVisible,
                            child: TextFormField(
                              onChanged: (value) {
                                store.setNome(value);
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [cpfMask],
                              decoration: InputDecoration(
                                  labelText: 'CPF',
                                  hintText: 'Digite seu CPF',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                            ),
                          );
                        },
                      ),

                      Observer(
                        builder: (_) {
                          return Visibility(
                            visible: store.textFieldPjVisible,
                            child: TextFormField(
                              onChanged: (value) {
                                store.setNome(value);
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [cnpjMask],
                              decoration: InputDecoration(
                                  labelText: 'CNPJ',
                                  hintText: 'Digite seu CNPJ',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Selecione o genero',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      SizedBox(height: 5),
                      GroupButton(
                          options: GroupButtonOptions(
                              borderRadius: BorderRadius.circular(8),
                              selectedColor: AppColors.secondaryColor),
                          isRadio: true,
                          buttons: ['Masculino', 'Feminino', 'Outro'],
                          onSelected: (i, selected) {
                            if (i == 0) {
                              store.setSexo('Masculino');
                            } else if (i == 1) {
                              store.setSexo('Feminino');
                            } else if (i == 2) {
                              store.setSexo('Outro');
                            }
                            log(store.sexo.toString());
                          }),

                      SizedBox(height: 40.0),
                      SizedBox(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(8.0),
                          shadowColor: Colors.grey,
                          color: AppColors.secondaryColor,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {
                              cadastrar();
                            },
                            child: Observer(
                              builder: (_) {
                                return Center(
                                  child: store.isLoading == false
                                      ? Text(
                                          'Cadastrar',
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
            ],
          ),
        ));
  }
}
