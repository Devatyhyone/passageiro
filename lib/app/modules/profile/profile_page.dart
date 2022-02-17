// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_widget/expansion_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:passageiro/app/modules/profile/profile_store.dart';
import 'package:flutter/material.dart';
import 'package:passageiro/app/shared/core/app_assets.dart';
import 'package:passageiro/app/shared/core/app_colors.dart';
import 'package:passageiro/app/shared/models/passageiro.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key? key, this.title = 'ProfilePage'}) : super(key: key);
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final ProfileStore store = Modular.get();
  final tileKey = GlobalKey<ExpansionWidgetState>();
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
          content: Observer(
            builder: (_) {
              return Text(msg);
            },
          ),
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
  void initState() {
    store.getUserData(FirebaseAuth.instance.currentUser!.uid).then(
        (value) => value.fold((l) => _showDialog(l), (r) => store.setUser(r!)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: store.getUserData(FirebaseAuth.instance.currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.data == null) {
            return Container(
              color: Colors.white,
              child: Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryBlue)),
            );
          } else {
            return Observer(
              builder: (_) {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    elevation: 1,
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.secondaryColor,
                      ),
                      onPressed: () {
                        Modular.to.pop(context);
                      },
                    ),
                    actions: [
                      IconButton(
                        // ignore: prefer_const_constructors
                        icon: Icon(
                          Icons.account_balance_wallet_rounded,
                          color: AppColors.secondaryColor,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  body: Container(
                    padding: EdgeInsets.only(left: 16, top: 25, right: 16),
                    child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: ListView(
                        children: [
                          Text(
                            "Editar Perfil",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 4,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor),
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            offset: Offset(0, 10))
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            store.usuario.url!,
                                          ))),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 4,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                          color: AppColors.secondaryColor,
                                        ),
                                        child: IconButton(
                                          onPressed: () async {
                                            final picker = ImagePicker();
                                            try {
                                              final pickedFile =
                                                  await picker.pickImage(
                                                      source:
                                                          ImageSource.camera);
                                              if (pickedFile != null) {
                                                await firebase_storage
                                                    .FirebaseStorage.instance
                                                    .ref(store.usuario.id! +
                                                        '/uploads/profile.png')
                                                    .putFile(
                                                        File(pickedFile.path));
                                                String downloadURL =
                                                    await firebase_storage
                                                        .FirebaseStorage
                                                        .instance
                                                        .ref(store.usuario.id! +
                                                            '/uploads/profile.png')
                                                        .getDownloadURL();
                                                log(downloadURL);
                                                FirebaseFirestore.instance
                                                    .collection('passageiros')
                                                    .doc(store.usuario.id)
                                                    .update(
                                                        {'url': downloadURL});
                                                await store
                                                    .getUserData(
                                                        store.usuario.id!)
                                                    .then((value) => value.fold(
                                                        (l) => null,
                                                        (r) =>
                                                            store.setUser(r!)));
                                              } else {
                                                // showToast(msg: "Upload canceled by user");
                                              }
                                            } catch (error) {}
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                        ))),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 35.0),
                            child: TextFormField(
                              onChanged: (value) {
                                store.setNome(value);
                              },
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 3),
                                  labelText: 'Nome',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  hintText: store.usuario.nome,
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 35.0),
                            child: TextFormField(
                              readOnly: true,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 3),
                                  labelText: 'E-mail',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  hintText: store.usuario.email,
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 35.0),
                            child: TextFormField(
                              onChanged: (value) {
                                store.setCelular(value);
                              },
                              keyboardType: TextInputType.phone,
                              inputFormatters: [maskFormatter],
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 3),
                                  labelText: 'Celular',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  hintText: store.usuario.celular,
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 35.0),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 10) {
                                  DateFormat format = DateFormat("dd/MM/yyyy");
                                  DateTime data = format.parse(value);
                                  store.setDataNascimento(
                                      Timestamp.fromDate(data));
                                }
                              },
                              keyboardType: TextInputType.datetime,
                              inputFormatters: [dateFormatter],
                              decoration: InputDecoration(
                                  labelText: 'Data de Nascimento',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  hintText: DateFormat('dd/MM/yyyy').format(
                                      DateTime.parse(store
                                          .usuario.dataNascimento!
                                          .toDate()
                                          .toString())),
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 35.0),
                            child: Card(
                              child: ExpansionWidget(
                                  initiallyExpanded: false,
                                  titleBuilder: (double animationValue, _,
                                      bool isExpaned, toogleFunction) {
                                    return InkWell(
                                      onTap: () =>
                                          toogleFunction(animated: true),
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(child: Text('Endereço')),
                                            Transform.rotate(
                                              angle:
                                                  math.pi * animationValue / 2,
                                              child: Icon(Icons.arrow_right,
                                                  size: 40),
                                              alignment: Alignment.center,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  content: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(20),
                                    child: TextFormField(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return PlacePicker(
                                            apiKey:
                                                'AIzaSyCyLjUwQHNXkMl7GECJv4YrjX2HLYY81uQ',
                                            hintText: "Pesquisar ...",
                                            searchingText:
                                                "Por favor aguarde ...",
                                            selectText: "Selecionar",
                                            outsideOfPickAreaText:
                                                "Local fora de área",
                                            initialPosition: initialPosition,
                                            useCurrentLocation: true,
                                            selectInitialPosition: true,
                                            usePinPointingSearch: true,
                                            usePlaceDetailSearch: true,
                                            onPlacePicked: (result) async {
                                              selectedPlace = result;

                                              Navigator.of(context).pop();
                                              final coordinates = Coordinates(
                                                  selectedPlace!
                                                      .geometry!.location.lat,
                                                  selectedPlace!
                                                      .geometry!.location.lng);
                                              var addresses = await Geocoder
                                                  .local
                                                  .findAddressesFromCoordinates(
                                                      coordinates);
                                              var first = addresses.first;

                                              store.setEstado(first.adminArea!);
                                              store.setCidade(
                                                  first.subAdminArea!);
                                              store.setBairro(
                                                  first.subLocality!);
                                              store.setLogradouro(
                                                  first.thoroughfare!);
                                              store.setEnderecoCompleto(result
                                                  .formattedAddress
                                                  .toString());
                                              store.setLat(selectedPlace!
                                                  .geometry!.location.lat);
                                              store.setLong(selectedPlace!
                                                  .geometry!.location.lng);
                                              store.setCep(
                                                  first.postalCode.toString());
                                              if (first.subThoroughfare !=
                                                  null) {
                                                store.setNumero(first
                                                    .subThoroughfare
                                                    .toString());
                                              }
                                              setState(() {
                                                controllerEndereco.text = result
                                                    .formattedAddress
                                                    .toString();
                                              });
                                            },
                                          );
                                        }));
                                      },
                                      maxLines: 2,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(bottom: 3),
                                          labelText: 'Endereço',
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          hintText:
                                              store.usuario.enderecoCompleto,
                                          hintStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          )),
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OutlineButton(
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {},
                                child: Text("Cancelar",
                                    style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 2.2,
                                        color: Colors.black)),
                              ),
                              RaisedButton(
                                onPressed: () async {
                                  await store.updateData().then((value) {
                                    _showDialog(store.resultUpdateMessage);
                                    log(store.resultUpdateMessage);
                                  });
                                },
                                color: AppColors.secondaryColor,
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  "SALVAR",
                                  style: TextStyle(
                                      fontSize: 14,
                                      letterSpacing: 2.2,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        });
  }
}

Widget buildTextField(String labelText, String hintText) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 35.0),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.remove_red_eye,
              color: AppColors.secondaryColor,
            ),
          ),
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
    ),
  );
}
