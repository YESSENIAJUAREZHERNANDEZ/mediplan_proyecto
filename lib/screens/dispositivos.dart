import 'package:flutter/material.dart';
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
        backgroundColor: Colors.white, // Establece el fondo transparente
      title: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            iconSize: 40.0,
            icon: Image.asset('assets/iconos/icono2.png'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Row(
            children: <Widget>[
              IconButton(
                iconSize: 20.0,
                icon: Image.asset('assets/imagenes/blanco.png'),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 40.0,
                icon: Image.asset('assets/iconos/menu.png'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
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
