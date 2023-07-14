import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/signup.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
               Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/iconos/icono2.png',
                  width: 70,
                  height: 70,
                ),
              ),
                Text("Iniciar Sesión", style: TextStyle(fontSize: 28,fontFamily:'Roboto', color:Color.fromARGB(255, 6, 11, 53)),),
                //Text("Bienvenido", style: TextStyle(fontSize: 30, fontFamily:'Roboto' ,color:Color.fromARGB(255, 6, 11, 53)),),
                  SizedBox(height: 16.0),
                 Text(
                  'Ingrese su número de telefono para iniciar',
                  style: TextStyle(fontSize: 18.0,
            color: Color(0XFFB7B7D2),),
                ),
                  SizedBox(width: 10),
            Padding(
              padding: EdgeInsets.only(right: 18.0), // Ajusta el valor de espaciado según tus necesidades
              child: Row(
                children: [
                  Container(
                    width: 24, // Ajusta el ancho de la imagen según tus necesidades
                    height: 24, // Ajusta la altura de la imagen según tus necesidades
                    child: Image.asset('assets/iconos/mexico.png'), // Ruta de la imagen en los assets de tu aplicación
                  ),
                  SizedBox(width: 10), // Espacio opcional entre el icono y el TextField
                  Expanded(
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Número de teléfono',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28.0),
          Container(
            width: 200, // Ajusta el ancho del botón según tus necesidades
            height: 50, // Ajusta la altura del botón según tus necesidades
            child: ElevatedButton(
              onPressed: () {
                // Lógica para iniciar sesión con número de teléfono
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 81, 111, 245), // Color de fondo
                onPrimary: Colors.white, // Color del texto
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Empezar', style: TextStyle(fontSize: 18)),
            ),
          ),

            SizedBox(height: 16.0),
            ElevatedButton(
             onPressed: () {
                 //Lógica para iniciar sesión con Google
                Navigator.push( context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );

              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 255, 255, 255), // Color de fondo
                onPrimary: Colors.black, // Color del texto
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                  //Image.asset(
                    //'assets/iconos/google.png', // Ruta de la imagen de Google
                  // height: 24.0,
                  //),
                 SizedBox(width: 8.0),
                  Text('No tiene una cuenta  '),
                  Text('Registro', style: TextStyle(fontSize: 18.0,
            color: Color.fromARGB(255, 121, 5, 59),),),
                ],
             ),
            ),

          ],
        ),
      ),
    );
  }
}
