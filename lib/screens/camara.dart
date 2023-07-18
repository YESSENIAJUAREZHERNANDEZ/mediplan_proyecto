import 'package:flutter/material.dart';
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
        title: Text('Camera'),
        actions: [
          IconButton(
            onPressed: () {
              // Lógica para el primer botón de configuración
            },
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              // Lógica para el segundo botón de configuración
            },
            icon: Icon(Icons.info),
          ),
        ],
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
