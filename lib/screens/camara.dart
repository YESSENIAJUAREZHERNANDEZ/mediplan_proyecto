import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loginapp.dart';
import 'package:flutter_application_1/text/inicio.dart';
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
      backgroundColor: Color.fromARGB(255, 244, 244, 254), // Fondo azul
    appBar: AppBar(
  elevation: 0,
  backgroundColor: Colors.transparent,
  leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black), // Custom back button icon
    onPressed: () {
      // Navigate back to the previous screen manually
      Navigator.pop(context);
    },
  ),
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
    image: DecorationImage(
      image: AssetImage('assets/imagenes/campo2.png'),
      fit: BoxFit.cover,
    ),
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Medi plan',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Text(
        'Configuración',
        style: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 48, 24, 49),
        ),
      ),
    ],
  ),
),

        ListTile(
          title: Text('Iniciar sesión',
          style: TextStyle( color: Color.fromARGB(255, 48, 24, 49), fontSize: 16,
           ),),
          onTap: () {
            // Acción para la opción 1
            Navigator.push( context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
          },
        ),
        ListTile(
          title: Text('Terminos y condiciones',
          style: TextStyle( color: Color.fromARGB(255, 48, 24, 49), fontSize: 16,
           ),),
          onTap: () {
            // Acción para la opción 2
          },
        ),
        ListTile(
          title: Text('Ayuda',
          style: TextStyle( color: Color.fromARGB(255, 48, 24, 49), fontSize: 16,
           ),),
          onTap: () {
            // Acción para la opción 3
          },
        ),
      ],
    ),
  ),

      body: Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
    Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Center(
  child: Text(
    'Reconocer medicamento',
    style: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
),
    ),
    Expanded(
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Apunte la camara de su telefono',
          style: TextStyle(
            fontSize: 16.0,
            color: Color.fromARGB(255, 85, 42, 87),
          ),
        ),
        Text(
          'a la parte frontal del medicamento',
          style: TextStyle(
            fontSize: 16.0,
            color: Color.fromARGB(255, 85, 42, 87),
          ),
        ),
        SizedBox(height: 20), // Espacio entre el primer texto y la imagen
        Image.asset(
          'assets/imagenes/escaner.png', // Reemplaza 'ruta_de_la_imagen' con la ubicación de tu imagen
          width: 170, // Ancho deseado de la imagen
          height: 150, // Alto deseado de la imagen
        ),
        SizedBox(height: 20), // Espacio entre la imagen y el botón
        ElevatedButton(
          onPressed:(){
            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Plan()),
    );
          },
          style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 78, 157, 196), // Color de fondo
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Radio de esquinas redondeadas
                      ),
                      minimumSize: Size(double.minPositive, 45),
                    ),
          child: Text(
            'Iniciar escaneo',
            style: TextStyle(fontSize: 18), // Cambiar el tamaño de fuente del botón
          ),
        ),
        SizedBox(height: 20),
      ],
    ),
  ),
),


  ],
),

    );
  }
}
