import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';


class HomeController extends GetxController{
  var latitude = "Getting Latitude..".obs;
  var longitude = "Getting Longitude..".obs;
  var address = "Getting Adress..".obs;
  late StreamSubscription<Position> streamSubscription;

  @override
  void onInit() async {
    super.onInit();
    getLocation();
  }


  @override
  void onReady(){
    super.onReady();
  }


  @override
  void onClose(){
    streamSubscription.cancel();
  }

  getLocation ()async{
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      await Geolocator.openAppSettings();
      return Future.error('Location permissions are denied');
    }
    permission = await Geolocator.checkPermission();
    if(permission== LocationPermission.denied){
      return Future.error('Location permissions are denied');
    }
    if(permission== LocationPermission.deniedForever){
      return Future.error('Location permissions are permantly denied');
    }
    streamSubscription = Geolocator.getPositionStream().listen((Position position){
      latitude.value = "Latitude ${position.latitude.toString()}";
      longitude.value = "Longitude  ${position.longitude.toString()}";
      getAddressFromLatLng(position);
    });
  }
  Future<void> getAddressFromLatLng(Position position) async{
    List<Placemark> placematks =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placematks[0];
    address.value =
    "Address: ${place.street},${place.locality},${place.postalCode},${place.country}";
  }
}