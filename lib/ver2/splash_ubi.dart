import 'package:flutter/material.dart';
import 'package:flutter_application_1/ver2/eventoos.dart';

class splashubi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 254),
              appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            SizedBox(height: 20),
            Image.asset(
          'assets/imagenes/cha.png', // Reemplaza con la ruta de la imagen que deseas usar
          width: 150,
              height: 150,
        ),
            SizedBox(height: 20),
            Text(
              '___',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                 color: Colors.black45,
              ),
            ),
            SizedBox(height: 7),
            Text(
              'Mantenga un registro',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Como reporte de su tratamiento mensual',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navegar a la segunda pantalla
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ColoresCalendar()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                primary: const Color.fromARGB(255, 78, 157, 196),
              ),
              child: Text(
                'Empezar',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white, // Asegúrate de establecer el color del texto explícitamente
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
