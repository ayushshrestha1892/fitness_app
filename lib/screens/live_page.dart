import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMapPage extends StatefulWidget {
  const MyMapPage({Key? key}) : super(key: key);

  @override
  State<MyMapPage> createState() => _MyMapPageState();
}

class _MyMapPageState extends State<MyMapPage> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Center();
    // return GoogleMap(
    //   initialCameraPosition: initialCameraPosition,
    //   markers: markers,
    //   zoomControlsEnabled: false,
    //   mapType: MapType.normal,
    //   onMapCreated: (GoogleMapController controller) {
    //     googleMapController = controller;
    //   },
    // );
  }
}
