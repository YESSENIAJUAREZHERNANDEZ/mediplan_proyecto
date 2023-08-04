import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/screens/registro.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _errorMessage = '';


  Future<void> _signInWithEmailAndPassword() async {
    try {
      if (_formKey.currentState!.validate()) {
        final userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        if (userCredential.user != null) {
          // Successfully signed in, redirect to home page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(),
            ),
          );
        } else {
          // Something went wrong
          // You can show an error message to the user
          setState(() {
          _showErrorDialog('El inicio de sesión ha fallado. Verifica tu correo electrónico y contraseña.');
        });
        }
      }
    } catch (e) {
      print('Error signing in: $e');
      // You can show an error message to the user
       setState(() {
       _showErrorDialog('Ha ocurrido un error al intentar iniciar sesión. Por favor, inténtalo nuevamente.');
    });
    }
  }

void _showErrorDialog(String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Column(
        children: [
          Icon(Icons.error, size: 40, color: Color.fromARGB(255, 230, 177, 32)), // Aquí puedes utilizar la imagen que desees
          SizedBox(width: 8),
          Text('Error de inicio de sesión'),
        ],
      ),
      content: Text(message),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Aceptar'),
        ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese su correo electrónico';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese su contraseña';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signInWithEmailAndPassword,
                child: Text('Iniciar sesión'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 143, 158, 244), // Color llamativo para el botón
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              ElevatedButton(
             onPressed: () {
                 //Lógica para iniciar sesión con Google
                Navigator.push( context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
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
      ),
    );
  }
}
