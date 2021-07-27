import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewLocation extends StatefulWidget {
  @override
  _ViewLocationState createState() => _ViewLocationState();
}

class _ViewLocationState extends State<ViewLocation> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  // MapController controller = new MapController();

  // var latitudedata;
  // var longitudedata;
  // late Position _currentPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getCurrentLocation()
  }

  // _getCurrentLocation() {
  //   Geolocator()
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
  //       .then((Position position) {
  //     setState(() {
  //       _currentPosition = position;
  //       // latitudedata = _currentPosition.latitude;
  //       // longitudedata = _currentPosition.longitude;
  //     });
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }

  // getCurrentLocation() async {
  //   //final geoposition= await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  //   final geoPosition = await Geolocator()
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  //   setState(() {
  //     latitudedata = geoPosition.latitude;
  //     longitudedata = geoPosition.longitude;
  //   });
  // }

  // getPermission() async {
  //   final GeolocationResult result =
  //       await Geolocation.requestLocationPermission(
  //           permission: const LocationPermission(
  //               android: LocationPermissionAndroid.fine,
  //               ios: LocationPermissionIOS.always));
  //   return result;
  // }

  // getLocation() {
  //   return getPermission().then((result) async {
  //     if (result.isSuccessful) {
  //       final Coords =
  //           await Geolocation.currentLocation(accuracy: LocationAccuracy.best);
  //     }
  //   });
  // }

  // buildMap() {
  //   getLocation().then((response) {
  //     if (response.isSuccessful) {
  //       response.listen((value) {
  //         controller.move(
  //             new latLng.LatLng(
  //                 value.location.latitude, value.location.longitude),
  //             15.0);
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
