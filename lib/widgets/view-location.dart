import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewLocation extends StatefulWidget {
  var latitude;
  var longitude;

  ViewLocation(this.latitude, this.longitude);
  @override
  _ViewLocationState createState() => _ViewLocationState(latitude, longitude);
}

class _ViewLocationState extends State<ViewLocation> {
  var latitude;
  var longitude;

  _ViewLocationState(this.latitude, this.longitude);
  Completer<GoogleMapController> _controller = Completer();

  // static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 11.0,
        ),
      ),
    );
  }
}
