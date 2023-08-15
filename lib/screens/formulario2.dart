import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        elevation: 0,
  backgroundColor: Color.fromARGB(255, 94, 81, 233),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imagenes/fondo.jpg'), // Ruta de la imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 32),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(_user.photoURL ?? 'assets/iconos/icono2.png'),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Bienvenido ${_user.displayName ?? ''}',
                      style: TextStyle(
                        fontSize: 21, // Tamaño de fuente del texto
                        color: Colors.white, // Color del texto
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Correo Electrónico: ${_user.email}',
                      style: TextStyle(
                        fontSize: 14, // Tamaño de fuente del texto
                        color: const Color.fromARGB(255, 185, 200, 207), // Color del texto
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // Aquí puedes implementar la lógica para cerrar sesión
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pop();
                  },
                  child: Text('Cerrar Sesión'),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 93, 86, 196), // Color de fondo
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Radio de esquinas redondeadas
                      ),
                      minimumSize: Size(double.infinity, 45),
                    ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UserProfileScreen(),
  ));
}
