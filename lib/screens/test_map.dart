import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Set<Marker> _createMarker() {
    return [
      Marker(
        markerId: MarkerId('Clinic'),
        position: LatLng(37.42796133580664, -122.085749655962),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: 'Clinic'),
      ),
    ].toSet();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 360,
          width: 108,
          child: GoogleMap(
            mapType: MapType.normal,
            markers: _createMarker(),
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
            },
          ),
        ),
      ),
    );
  }
}
