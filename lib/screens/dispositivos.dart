import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loginapp.dart';
import 'package:flutter_application_1/screens/waiting.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text('Iniciar sesión',
          style: TextStyle( color: Color.fromARGB(255, 48, 24, 49), fontSize: 16,
           ),),
          onTap: () {
            // Acción para la opción 1
            Navigator.push( context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
          },
        ),
        ListTile(
          title: Text('Terminos y condiciones',
          style: TextStyle( color: Color.fromARGB(255, 48, 24, 49), fontSize: 16,
           ),),
          onTap: () {
            // Acción para la opción 2
          },
        ),
        ListTile(
          title: Text('Ayuda',
          style: TextStyle( color: Color.fromARGB(255, 48, 24, 49), fontSize: 16,
           ),),
          onTap: () {
            // Acción para la opción 3
          },
        ),
      ],
    ),
  ),

      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/imagenes/glucometro.png',
                //width: 70,
                //height: 70,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Dispositivos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Acción del botón
                  Navigator.push( context,
                  MaterialPageRoute(builder: (context) => Waiting()),
                );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Vinclular',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
