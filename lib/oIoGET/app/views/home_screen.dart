import 'package:flutter/material.dart';
import 'package:flutter_application_1/oIoGET/app/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController>{
  @override
  Widget build (BuildContext) {
    return Scaffold (
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
                color: Colors.white
              ),
              const SizedBox(
                height: 4,
              ),
              const Text (
                "Location",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() => Text(
                controller.latitude.value,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )),
              const SizedBox(
                height: 10,
              ),
              Obx(() => Text(
                controller.longitude.value,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )),
              const SizedBox(
                height: 10,
              ),
              Obx(() => Text(
                controller.address.value,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )),

            ],
          )
        )
      )
    );
  }
}