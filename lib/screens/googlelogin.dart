import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/screens/recuperar.dart';
import 'package:flutter_application_1/screens/registro.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        final preferences = await SharedPreferences.getInstance();
        await preferences.setBool('isUserLoggedIn', true); // Guardar estado de inicio de sesión
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
          Icon(Icons.error, size: 40, color: Color.fromARGB(255, 207, 78, 78)), // Aquí puedes utilizar la imagen que desees
          SizedBox(width: 8),
          Text('Error'),
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
void initState() {
  super.initState();
  _checkLoggedIn(); // Verificar si el usuario ya ha iniciado sesión al cargar la página
}

Future<void> _checkLoggedIn() async {
  final preferences = await SharedPreferences.getInstance();
  final isLoggedIn = preferences.getBool('isUserLoggedIn') ?? false;
  if (isLoggedIn) {
    // Usuario ya inició sesión previamente, redirigir a la página principal
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 78, 157, 196),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                child: Image.asset(
                  'assets/iconos/icono.png',
                  width: 70,
                  height: 70,
                ),
              ),
                Text("Iniciar Sesión", style: TextStyle(fontSize: 26,fontFamily:'Droid Sans', color:Color.fromARGB(255, 255, 255, 255)),),
                //Text("Bienvenido", style: TextStyle(fontSize: 30, fontFamily:'Roboto' ,color:Color.fromARGB(255, 6, 11, 53)),),
                  SizedBox(height: 16.0),
                Text(
                  'Ingrese los siguientes datos:                        ',
                  style: TextStyle(
                    fontFamily: 'Droid Sans',
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 57, 57, 59),
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 18.0),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Correo electrónico';
                  }
                  if (!value.contains('@')) {
                    return 'El correo electrónico debe incluir el símbolo "@"';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Correo electrónico:',
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.grey[600],
                    size: 20.0, 
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
              controller: _passwordController,
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Contraseña';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Contraseña:',
                filled: true,
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide( // Cambiar color del borde
                    color: const Color.fromARGB(255, 255, 255, 255)!, // Color del borde
                    width: 1.0, // Ancho del borde
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // Ajustar el ancho del TextField
                prefixIcon: Icon(
                  Icons.lock, // Icono de candado incorporado
                  color: Colors.grey[600], // Color del icono
                  size: 20.0,
                ),
              ),
            ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signInWithEmailAndPassword,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 110, vertical: 14),
                  child: Text('Empezar'),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 64, 62, 138),
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
                    'Olvido su contraseña? ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 64, 66, 78),
                      fontSize: 12,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Lógica para el registro
                      Navigator.push( context,
                  MaterialPageRoute(builder: (context) => PasswordResetPage()),
                );
                    },
                    child: Text(
                      'Recuperar',
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
