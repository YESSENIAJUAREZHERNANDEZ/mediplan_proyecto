import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_application_1/screens/main_screen.dart';

class LoginAppGoogle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreenGoogle(),
    );
  }
}

class LoginScreenGoogle extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreenGoogle> {
  TextEditingController _phoneController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    // ... (El código del widget build se mantiene igual)
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

  void _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        final User? user = userCredential.user;
        if (user != null) {
          // Redireccionar a la pantalla main_screen.dart después del inicio de sesión con éxito
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        }
      } else {
        // Si googleUser es nulo, el usuario canceló el inicio de sesión con Google.
        // Aquí puedes mostrar un mensaje emergente con SnackBar para informar al usuario.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Inicio de sesión con Google cancelado.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      // Si ocurre algún error durante el inicio de sesión con Google, puedes mostrar un mensaje emergente con SnackBar para informar al usuario.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error en el inicio de sesión con Google: $e'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }
}
