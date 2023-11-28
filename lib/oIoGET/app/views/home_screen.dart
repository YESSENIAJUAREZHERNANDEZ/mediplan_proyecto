import 'package:flutter/material.dart';
import 'package:flutter_application_1/oIoGET/app/controller/home_controller.dart';
import 'package:appinio_social_share/appinio_social_share.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AppinioSocialShare appinioSocialShare = AppinioSocialShare();
  late HomeController _controller;

   void shareToWhatsApp(BuildContext context, String address) {
    AppinioSocialShare appinioSocialShare = AppinioSocialShare();
    appinioSocialShare.shareToWhatsapp(address);
  }

  @override
  void initState() {
    super.initState();
    _controller = HomeController(
      updateLatitude: (value) {
        setState(() {
          _latitude = value;
        });
      },
      updateLongitude: (value) {
        setState(() {
          _longitude = value;
        });
      },
      updateAddress: (value) {
        setState(() {
          _address = value;
        });
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _latitude = "Getting Latitude..";
  String _longitude = "Getting Longitude..";
  String _address = "Getting Adress..";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "Location",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                _latitude,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                _longitude,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                _address,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                child: Icon(Icons.share),
                onPressed: (){
                 // Share.share(_address);
                 shareToWhatsApp(context, _address); 
                }
              )
            ],
          ),
        ),
      ),
    );
}
}