import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class gmap extends StatelessWidget {
  final double lat;
  final double lng;

  const gmap({Key? key, required this.lat, required this.lng})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
            target: LatLng(
              lat,
              lng,
            ),
            zoom: 10),
      ),
    );
  }
}
