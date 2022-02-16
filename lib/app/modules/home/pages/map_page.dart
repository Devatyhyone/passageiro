// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final String title;
  const MapPage({Key? key, this.title = 'MapPage'}) : super(key: key);
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition initialPosition = CameraPosition(
    target: LatLng(-21.7718148, -43.3269455),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
