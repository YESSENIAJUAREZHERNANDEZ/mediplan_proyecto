import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loginapp.dart';
import 'package:flutter_application_1/screens/splash_dos.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Dispositivos(),
    );
  }
}

class Dispositivos extends StatelessWidget {
  void _signOut(BuildContext context) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('isUserLoggedIn'); // Eliminar el estado de inicio de sesión
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Splashdos(), // Redirigir a la página de inicio de sesión
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 227, 248), // Fondo azul
appBar: AppBar(
  elevation: 0,
  backgroundColor: Colors.transparent,
  leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black), // Custom back button icon
    onPressed: () {
      // Navigate back to the previous screen manually
      Navigator.pop(context);
    },
  ),
  title: Row(
    children: [
      IconButton(
        icon: Image.asset('assets/iconos/icono2.png'),
        onPressed: () {},
      ),
      SizedBox(width: 8),
      Text(
        'Medi plan',
        style: TextStyle(
          color: Color.fromARGB(255, 48, 24, 49),
          fontSize: 16,
        ),
      ),
    ],
  ),
),
  endDrawer: Drawer(
    child: ListView(
      children: [
        DrawerHeader(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/imagenes/campo2.png'),
      fit: BoxFit.cover,
    ),
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Medi plan',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Text(
        'Configuración',
        style: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 48, 24, 49),
        ),
      ),
    ],
  ),
),

        ListTile(
          title: Text('Información de la cuenta',
          style: TextStyle( color: Color.fromARGB(255, 48, 24, 49), fontSize: 16,
           ),),
          onTap: () {
            // Acción para la opción 1
            Navigator.push( context,
                  MaterialPageRoute(builder: (context) => LoginScreen() ),
                );
          },
        ),
        ListTile(
          title: Text(
            'Cerrar sesión',
            style: TextStyle(color: Color.fromARGB(255, 48, 24, 49), fontSize: 16),
          ),
          onTap: () {
            // Llamar a la función para cerrar sesión
            
          },
        ),
        ListTile(
          title: Text('',
          style: TextStyle( color: Color.fromARGB(255, 48, 24, 49), fontSize: 16,
           ),),
          onTap: () {
            // Acción para la opción 3
          },
        ),
      ],
    ),
  ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sus dosis al alcance',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(height: 6), 
            Text(
              '___',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey, // Cambiar el color de letra a gris
              ),
              textAlign: TextAlign.left, // Alinear el texto a la izquierda
            ),
          Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
          Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  
          SizedBox(height: 16),
                  Image.asset(
                    'assets/imagenes/teletrabajo.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Habitación puerta 1',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Acción del botón
                      
                    },
                    style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 64, 62, 138),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                    child: Text(
                      '+',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
