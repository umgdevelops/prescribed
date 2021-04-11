import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSnippet extends StatefulWidget {
  @override
  _MapSnippetState createState() => _MapSnippetState();
}

class _MapSnippetState extends State<MapSnippet> {
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
    return GoogleMap(
      mapType: MapType.normal,
      markers: _createMarker(),
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controllerGoogleMap.complete(controller);
      },
    );
  }
}
