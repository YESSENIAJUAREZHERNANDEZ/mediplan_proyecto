import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loginapp.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  PickedFile? imageFile;

  Future<void> _openCamera() async {
    final picker = ImagePicker();
    final picture = await picker.getImage(source: ImageSource.camera);
    setState(() {
      imageFile = picture;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Row(
      children: [
        IconButton(
          icon: Image.asset('assets/iconos/icono2.png'),
          onPressed: () {},
        ),
        SizedBox(width: 8),
        Text(
          'Medi plan',
          style: TextStyle(
            color: Color.fromARGB(255, 48, 24, 49),
            fontSize: 16,
          ),
        ),
      ],
    ),
  ),
  endDrawer: Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Configuración',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: Text('Iniciar sesión'),
          onTap: () {
            // Acción para la opción 1
            Navigator.push( context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
          },
        ),
        ListTile(
          title: Text('Terminos y condiciones'),
          onTap: () {
            // Acción para la opción 2
          },
        ),
        ListTile(
          title: Text('Ayuda'),
          onTap: () {
            // Acción para la opción 3
          },
        ),
      ],
    ),
  ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (imageFile != null) SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openCamera,
              child: Text('Iniciar escaneo'),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Text(
              'Título de la interfaz',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
