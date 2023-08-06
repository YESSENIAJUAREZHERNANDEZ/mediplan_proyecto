import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PasswordResetPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text.trim());
      // El correo electrónico de restablecimiento de contraseña ha sido enviado.
      // Puedes mostrar un mensaje al usuario para que revise su bandeja de entrada o spam.
    } catch (e) {
      print('Error al restablecer la contraseña: $e');
      // Puedes mostrar un mensaje de error al usuario si algo sale mal.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 78, 157, 196),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                Text("Recuperar contraseña", style: TextStyle(fontSize: 26,fontFamily:'Droid Sans', color:Color.fromARGB(255, 255, 255, 255)),),
                //Text("Bienvenido", style: TextStyle(fontSize: 30, fontFamily:'Roboto' ,color:Color.fromARGB(255, 6, 11, 53)),),
                SizedBox(height: 18.0),
                Text(
                  'Ingrese su correo electronico:                        ',
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
            ElevatedButton(
              onPressed: _resetPassword,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  child: Text('Enviar correo de recuperación'),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 39, 36, 133),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
