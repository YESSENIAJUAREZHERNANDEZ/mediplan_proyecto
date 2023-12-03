import 'package:flutter/material.dart';

class splashmedicamentos extends StatelessWidget {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            SizedBox(height: 20),
            Image.asset(
          'assets/imagenes/futa.png', // Reemplaza con la ruta de la imagen que deseas usar
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
              'Organice el tratamiento',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'De todos los medicamentos que toma',
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
                  MaterialPageRoute(builder: (context) => SecondScreen()),
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

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Pantalla'),
      ),
      body: Center(
        child: Text(
          'Esta es la segunda pantalla',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
