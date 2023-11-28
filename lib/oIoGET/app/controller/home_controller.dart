import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HomeController {
  late StreamSubscription<Position> streamSubscription;
  late Function(String) updateLatitude;
  late Function(String) updateLongitude;
  late Function(String) updateAddress;

  HomeController(
      {required this.updateLatitude,
      required this.updateLongitude,
      required this.updateAddress}) {
    getLocation();
  }

  void getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openAppSettings();
      throw Exception('Location permissions are denied');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Location permissions are denied');
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }
    streamSubscription = Geolocator.getPositionStream().listen((Position position) {
      updateLatitude("Latitude ${position.latitude.toString()}");
      updateLongitude("Longitude  ${position.longitude.toString()}");
      getAddressFromLatLng(position);
    });
  }

  Future<void> getAddressFromLatLng(Position position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    updateAddress(
        "Address: ${place.street},${place.locality},${place.postalCode},${place.country}");
  }

  void dispose() {
    streamSubscription.cancel();
  }
}
