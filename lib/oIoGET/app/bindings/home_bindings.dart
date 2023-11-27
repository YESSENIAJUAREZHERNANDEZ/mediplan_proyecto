import 'package:get/get.dart';
import 'package:flutter_application_1/oIoGET/app/controller/home_controller.dart';
class HomeBinding extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<HomeController>(() => HomeController());
  }
}
