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
                  } else if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$').hasMatch(value)) {
                    return 'La contraseña debe contener al menos una letra mayúscula, una letra minúscula y un número.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Contraseña',
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
                child: Text('Registrarse'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[200], // Color llamativo para el botón
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
