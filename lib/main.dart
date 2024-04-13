import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() {
  runApp(const MapScreen());
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  static const _initialCameraPosition = CameraPosition(
//    target: LatLng(24.79505849588884, 120.99224060444382),
    target: LatLng(24.7975722, 120.9799402),
    zoom: 18,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GoogleMap(
          onMapCreated: (controller) {
            mapController = controller;
            _getCurrentPosition();
          },
          initialCameraPosition: _initialCameraPosition,
        ),
      ),
    );
  }

  void _getCurrentPosition() async {
    final Location location = Location();
    LocationData locationData = await location.getLocation();
    print(locationData.latitude);
    print(locationData.longitude);
  }
}
