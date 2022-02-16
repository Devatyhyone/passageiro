// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:passageiro/app/modules/home/home_store.dart';
import 'package:geolocator/geolocator.dart';
import 'package:passageiro/app/shared/core/app_assets.dart';

class MapPage extends StatefulWidget {
  final String title;
  const MapPage({Key? key, this.title = 'MapPage'}) : super(key: key);
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  final HomeStore store = Modular.get();
  CameraPosition initialPosition = CameraPosition(
    target: LatLng(-21.76096612587557, -43.348585732645596),
    zoom: 14.4746,
  );
  Set<Marker> _marcadores = {};

  _adicionarListenerLocalizacao() {
    Geolocator.getPositionStream().listen((Position position) {
      _exibirMarcadorPassageiro(position);

      initialPosition = CameraPosition(
          target: LatLng(position.latitude, position.longitude), zoom: 16);

      _movimentarCamera(initialPosition);
    });
  }

  _recuperaUltimaLocalizacaoConhecida() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position? position = await Geolocator.getLastKnownPosition();

    setState(() {
      if (position != null) {
        _exibirMarcadorPassageiro(position);

        initialPosition = CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 19);

        _movimentarCamera(initialPosition);
      } else {
        log('Posiçao nula');
      }
    });
  }

  _movimentarCamera(CameraPosition cameraPosition) async {
    GoogleMapController googleMapController = await _controller.future;
    googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  _exibirMarcadorPassageiro(Position local) async {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;

    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: pixelRatio),
            AppAssets.passageiroIcon)
        .then((BitmapDescriptor icone) {
      Marker marcadorPassageiro = Marker(
          markerId: MarkerId("marcador-passageiro"),
          position: LatLng(local.latitude, local.longitude),
          infoWindow: InfoWindow(title: "Localização atual"),
          icon: icone);

      setState(() {
        _marcadores.add(marcadorPassageiro);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _recuperaUltimaLocalizacaoConhecida();
    _adicionarListenerLocalizacao();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: true,
        // myLocationEnabled: true,
        initialCameraPosition: initialPosition,
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        markers: _marcadores,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
