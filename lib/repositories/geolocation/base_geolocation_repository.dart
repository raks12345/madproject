import 'package:geolocator/geolocator.dart';

abstract class BaseGeolocationrepository {
  Future<Position?> getCurrentLocation() async {
    return null;
  }
}
