import 'package:flutter/material.dart';
//import 'package:flutter_application_1/screens/formulario.dart';
//import 'package:flutter_application_1/screens/formulario2.dart';
//import 'package:flutter_application_1/screens/camara.dart';
//import 'package:flutter_application_1/screens/alarma.dart';
//import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/screens/splash_screen.dart';
//import 'package:flutter_application_1/screens/camara.dart';
//import 'package:flutter_application_1/screens/splash_screen.dart';
//import 'package:flutter_application_1/screens/recordatorios.dart';
//import 'package:flutter_application_1/screens/seguimiento.dart';
//import 'package:flutter_application_1/screens/signup.dart';
//import 'package:flutter_application_1/screens/loginapp.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medi plan',
      home: SplashScreen(),
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color:Color(0XFF030047),
          ),
          headline2: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color:Color.fromARGB(255, 255, 255, 255),
          ),
          headline5: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color:Color.fromARGB(255, 189, 12, 145),
          ),
          headline3: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          headline4: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Color(0XFF030047),
          ),
          bodyText1: TextStyle(
            fontSize: 25.0,
            color: Color(0XFFB7B7D2),
          ),
          bodyText2: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFF5F5FFF),
          ),
          subtitle1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: Color(0XFFB7B7D2),
          ),
        ),
      ), 
    );
  }
}
