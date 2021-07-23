import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';

import 'package:latlong2/latlong.dart' as latLng;
import 'package:latlong2/latlong.dart';

class ViewLocation extends StatefulWidget {
  @override
  _ViewLocationState createState() => _ViewLocationState();
}

class _ViewLocationState extends State<ViewLocation> {
  MapController controller = new MapController();

  var latitudedata;
  var longitudedata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  getCurrentLocation() async {
    //final geoposition= await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    final geoPosition = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      latitudedata = geoPosition.latitude;
      longitudedata = geoPosition.longitude;
    });
  }

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
      body: FlutterMap(
        mapController: controller,
        options: new MapOptions(
            center: LatLng(latitudedata, longitudedata), minZoom: 5.0),
        layers: [
          new TileLayerOptions(
              urlTemplate: "https//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
        ],
      ),
    );
  }
}

class Geolocator {
  getCurrentPosition({desiredAccuracy}) {}
}
