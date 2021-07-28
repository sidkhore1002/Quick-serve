import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo_project/constants/globalconstanst.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewLocation extends StatefulWidget {
  @override
  _ViewLocationState createState() => _ViewLocationState();
}

class _ViewLocationState extends State<ViewLocation> {
  final Set<Marker> _markers = {};
  // LatLng _center = LatLng(GlobalConstants.latitude, GlobalConstants.longitude);
  LatLng _lastMapPosition =
      LatLng(GlobalConstants.latitude, GlobalConstants.longitude);

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onAddMarkerButtonPressed();
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        onCameraMove: _onCameraMove,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(GlobalConstants.latitude, GlobalConstants.longitude),
          zoom: 11.0,
        ),
      ),
    );
  }
}
