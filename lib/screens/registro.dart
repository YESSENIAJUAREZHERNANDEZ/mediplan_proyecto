import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String getPasswordHint(String password) {
    if (password.isEmpty) {
      return 'La contraseña debe tener al menos 9 caracteres, una letra mayúscula, una letra minúscula y un número.';
    } else if (password.length < 9) {
      return 'La contraseña debe tener al menos 9 caracteres.';
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$').hasMatch(password)) {
      return 'La contraseña debe contener al menos una letra mayúscula, una letra minúscula y un número.';
    }
    return 'Contraseña válida.';
  }

  Future<void> _registerWithEmailAndPassword() async {
    try {
      if (_formKey.currentState!.validate()) {
        final userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        if (userCredential.user != null) {
          // Successfully registered, you can do something after registration if needed
          Navigator.pop(context); // Go back to the previous screen (homepage in this case)
        } else {
          // Something went wrong
          // You can show an error message to the user
        }
      }
    } catch (e) {
      print('Error registering: $e');
      // You can show an error message to the user
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
                Text("Registro                               ", style: TextStyle(fontSize: 26,fontFamily:'Droid Sans', color:Color.fromARGB(255, 255, 255, 255)),),
                //Text("Bienvenido", style: TextStyle(fontSize: 30, fontFamily:'Roboto' ,color:Color.fromARGB(255, 6, 11, 53)),),
                  SizedBox(height: 16.0),
                Text(
                  'Crear una cuenta:                                             ',
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
                    return 'Ingrese su correo electrónico';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
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
                    return 'Ingrese su contraseña';
                  } else if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$').hasMatch(value)) {
                    return 'La contraseña debe contener al menos una letra mayúscula, una letra minúscula y un número.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Contraseña',
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
              SizedBox(height: 10),
              Text(
                getPasswordHint(_passwordController.text),
                style: TextStyle(
                  color: _passwordController.text.isEmpty ? Colors.grey : Colors.green,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registerWithEmailAndPassword,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 14),
                  child: Text('Registrar cuenta'),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 64, 62, 138),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              // Resto del contenido del formulario
            ],
          ),
        ),
      ),
    );
  }
}
