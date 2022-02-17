// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:passageiro/app/modules/home/pages/map_page.dart';
import 'package:passageiro/app/shared/core/app_colors.dart';
import 'package:passageiro/app/shared/models/destino.dart';
import 'package:passageiro/app/shared/models/origem.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final _advancedDrawerController = AdvancedDrawerController();
  static final initialPosition =
      LatLng(-21.761020932044648, -43.34880030993253);

  PickResult? selectedPlace;
  TextEditingController controllerOrigem = TextEditingController();
  TextEditingController controllerDestino = TextEditingController();

  void checkuser() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        store
            .getUserData(user.uid)
            .then((value) => value.fold((l) => print(l), (r) {
                  store.setPassageiro(r!);
                }));
      }
    });
  }

  @override
  void initState() {
    checkuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: AppColors.primaryBlue,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.secondaryColor,
          title: Observer(
            builder: (_) {
              return Text(store.passageiro.nome!);
            },
          ),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: Container(
            child: Stack(children: [
          MapPage(),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white),
                  child: TextFormField(
                    controller: controllerOrigem,
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
                            Origem localOrigem = Origem(
                                logradouro: first.thoroughfare!,
                                cidade: first.subAdminArea!,
                                bairro: first.subLocality!,
                                cep: first.postalCode,
                                numero: first.subThoroughfare ??
                                    first.subThoroughfare,
                                localizacao: GeoPoint(
                                    selectedPlace!.geometry!.location.lat,
                                    selectedPlace!.geometry!.location.lng));
                            setState(() {
                              controllerOrigem.text =
                                  result.formattedAddress.toString();
                              store.setorigem(localOrigem);
                            });
                          },
                        );
                      }));
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(Icons.location_on, color: Colors.green),
                        ),
                        hintText: 'Local de origem'),
                  ),
                ),
              )),
          Positioned(
              top: 55,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white),
                  child: TextFormField(
                    controller: controllerDestino,
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
                            Destino localDestino = Destino(
                                logradouro: first.thoroughfare!,
                                cidade: first.subAdminArea!,
                                bairro: first.subLocality!,
                                cep: first.postalCode,
                                numero: first.subThoroughfare ??
                                    first.subThoroughfare,
                                localizacao: GeoPoint(
                                  selectedPlace!.geometry!.location.lat,
                                  selectedPlace!.geometry!.location.lng,
                                ));
                            setState(() {
                              controllerDestino.text =
                                  result.formattedAddress.toString();
                              store.setDestino(localDestino);
                            });
                          },
                        );
                      }));
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(Icons.local_taxi, color: Colors.green),
                        ),
                        hintText: 'Destino'),
                  ),
                ),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: RaisedButton(
                  child: Text(
                    'Chamar Taxi',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                  color: AppColors.primaryBlack,
                  onPressed: () async {
                    await store
                        .chamarTaxi()
                        .then((value) => value.fold((l) => log(l), (r) {
                              //   Navigator.pop(context);
                            }));
                  },
                ),
              ))
        ])),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://cdn3.iconfinder.com/data/icons/vector-icons-6/96/256-512.png',
                ),
              ),
              ListTile(
                onTap: () {
                  _advancedDrawerController.hideDrawer();
                },
                leading: Icon(Icons.drive_eta),
                title: Text('Chamar Corrida'),
              ),
              ListTile(
                onTap: () {
                  Modular.to.pushNamed('/profile/');
                },
                leading: Icon(Icons.account_circle_rounded),
                title: Text('Perfil'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.favorite),
                title: Text('Locais Favoritos'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.travel_explore),
                title: Text('Viagens/Corridas'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.notifications),
                title: Text('Notificações'),
              ),
              ListTile(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Modular.to.pushReplacementNamed('/login/');
                  //hh
                },
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
              Spacer(),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text('Termos de serviço | Politica de privacidade'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
