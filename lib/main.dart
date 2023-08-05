import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/splash_dos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/screens/main_screen.dart'; // Import the MainScreen widget
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoggedIn();
  }

  // Method to check if the user is logged in or not
  Future<void> checkLoggedIn() async {
    final preferences = await SharedPreferences.getInstance();
    isLoggedIn = preferences.getBool('isUserLoggedIn') ?? false;

    // Update the state to trigger a rebuild after retrieving the login status
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Check if the login status is retrieved before building the UI
    if (isLoggedIn == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medi plan',
      // Show MainScreen if the user is logged in, otherwise show Splashdos
      home: isLoggedIn ? MainScreen() : Splashdos(),
      
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
          bodyText2: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFF5F5FFF),
          ),
        ),
      ), 
    );
  }
}

