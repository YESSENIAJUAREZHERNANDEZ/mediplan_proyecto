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
      backgroundColor: Color.fromARGB(255, 251, 254, 255),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/iconos/icono.png',
                  width: 70,
                  height: 70,
                ),
              ),
                Text("Iniciar Sesión", style: TextStyle(fontSize: 28,fontFamily:'Roboto', color:Color.fromARGB(255, 6, 11, 53)),),
                //Text("Bienvenido", style: TextStyle(fontSize: 30, fontFamily:'Roboto' ,color:Color.fromARGB(255, 6, 11, 53)),),
                  SizedBox(height: 16.0),
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
                  labelText: 'Ingrese su correo electronico:',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: Icon(
                    Icons.email, // Icono de correo electrónico incorporado
                    color: Colors.grey[600], // Color del icono
                  ),
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
                  labelText: 'Ingrese su contraseña:',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: Icon(
                    Icons.lock, // Icono de correo electrónico incorporado
                    color: Colors.grey[600], // Color del icono
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signInWithEmailAndPassword,
                child: Text('Iniciar sesión'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 78, 157, 196), // Color llamativo para el botón
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
