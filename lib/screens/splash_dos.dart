import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/googlelogin.dart';
import 'package:flutter_application_1/screens/registro.dart';
import 'package:flutter_application_1/screens/main_screen.dart'; // Importa la página principal
import 'package:firebase_auth/firebase_auth.dart'; // Importa FirebaseAuth
import 'package:shared_preferences/shared_preferences.dart'; // Importa SharedPreferences


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splashdos(),
    );
  }
}

class Splashdos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 78, 157, 196), // Fondo azul
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Medi plan',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,// Color del texto blanco
                ),
              ),
              Text(
                'Su asistente personal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 62, 21, 90),  // Color del texto blanco
                ),
              ),
              SizedBox(height: 10),
              Image.asset(
                'assets/imagenes/inicio.png', // Ruta de la imagen de 50x50
                width: 300,
                height: 300,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Lógica para el botón de inicio de sesión
                  Navigator.push( context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  child: Text('Iniciar sesión con Cuenta', style:TextStyle(color: Colors.black)),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 249, 248, 253),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 7),
              ElevatedButton(
                onPressed: () {
                  // Lógica para el botón de inicio de sesión
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  child: Text('Iniciar sesión con Google'),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 64, 62, 138),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 20),
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No tiene una cuenta? ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 64, 66, 78),
                      fontSize: 12,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Lógica para el registro
                      Navigator.push( context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
                    },
                    child: Text(
                      'Registro',
                      style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                        color: Color.fromARGB(255, 58, 65, 128), // Color del texto blanco
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 37),
              
            ],
          ),
        ),
      ),
    );
  }
}
