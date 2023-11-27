import 'package:flutter_application_1/oIoGET/app/bindings/home_bindings.dart';
import 'package:flutter_application_1/oIoGET/app/views/home_screen.dart';
import 'package:flutter_application_1/oIoGET/app/ruts/app_routes.dart';
import 'package:get/get.dart';

class AppPages{
  AppPages._();

  static const INITIAL = Routes.HOME;
  static final routes= [
    GetPage(name: Routes.HOME, page:() => HomeView(),binding: HomeBinding()),
  ];
}