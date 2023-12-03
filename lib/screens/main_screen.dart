import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/ayuda.dart';
import 'package:flutter_application_1/screens/camara.dart';
import 'package:flutter_application_1/screens/formulario2.dart';
import 'package:flutter_application_1/screens/seguimiento.dart';
import 'package:flutter_application_1/screens/splash_dos.dart';
import 'package:flutter_application_1/screens/terminos.dart';
import 'package:flutter_application_1/ver2/editarmedicamento.dart';
import 'package:flutter_application_1/ver2/eventoos.dart';
import 'package:flutter_application_1/ver2/splash_calendario.dart';
import 'package:flutter_application_1/ver2/splash_medicamentos.dart';
import 'package:flutter_application_1/ver2/splash_ubi.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:timezone/data/latest.dart' as tz;
import '/ver2/services/noti_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //seokjin day
  NotificationService().initNotification();
  tz.initializeTimeZones();
  //   tz.initializeTimeZones(); 
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget{
   void _signOut(BuildContext context) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('isUserLoggedIn'); // Eliminar el estado de inicio de sesión
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Splashdos(), // Redirigir a la página de inicio de sesión
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 254), // Fondo azul
    appBar: AppBar(
      automaticallyImplyLeading: false,
  elevation: 0,
  //backgroundColor: Color.fromARGB(255, 52, 65, 97),
  backgroundColor: Color.fromARGB(255, 78, 157, 196),
  title: Row(
    
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
  title: Stack(
    children: [
      Icon(
        Icons.face_outlined,  // Cambia esto al icono que desees
        size: 25,
        color: Colors.grey, // Color de fondo gris para el ícono
      ),
      Positioned.fill(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Información de la cuenta',
            style: TextStyle(
              color: Color.fromARGB(255, 48, 24, 49),
              fontSize: 16,
            ),
          ),
        ),
      ),
    ],
  ),
  onTap: () {
    // Acción para la opción 3
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserProfileScreen()),
    );
  },
),

        ListTile(
  title: Stack(
    children: [
      Icon(
        Icons.library_books_outlined,  // Cambia esto al icono que desees
        size: 25,
        color: Colors.grey, // Color de fondo gris para el ícono
      ),
      Positioned.fill(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Terminos y Condiciones ',
            style: TextStyle(
              color: Color.fromARGB(255, 48, 24, 49),
              fontSize: 16,
            ),
          ),
        ),
      ),
    ],
  ),
  onTap: () {
    // Acción para la opción 3
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Terminos()),
    );
  },
),

                ListTile(
  title: Stack(
    children: [
      Icon(
        Icons.question_mark,  // Cambia esto al icono que desees
        size: 25,
        color: Colors.grey, // Color de fondo gris para el ícono
      ),
      Positioned.fill(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Ayuda                                ',
            style: TextStyle(
              color: Color.fromARGB(255, 48, 24, 49),
              fontSize: 16,
            ),
          ),
        ),
      ),
    ],
  ),
  onTap: () {
    // Acción para la opción 3
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Ayuda()),
    );
  },
),
        ListTile(
          title: Stack(
    children: [
      Icon(
        Icons.logout,  // Cambia esto al icono que desees
        size: 25,
        color: Colors.grey, // Color de fondo gris para el ícono
      ),
      Positioned.fill(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Cerrar sesion                   ',
            style: TextStyle(
              color: Color.fromARGB(255, 48, 24, 49),
              fontSize: 16,
            ),
          ),
        ),
      ),
    ],
  ),
          onTap: () {
            // Llamar a la función para cerrar sesión
            _signOut(context);
          },
        ),
      ],
    ),
  ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            _textsHeader(context),
            _forYou(context),
            _recent(context),
            _AppBar(context),
          ],
        ),
      ),
    );
  }


Widget _textsHeader(BuildContext context) {
  return Column(
    children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width, // Ancho de la pantalla
        child: Image.asset(
          'assets/imagenes/encabezado2.jpg', // Reemplaza con la ruta de la imagen que deseas usar
          fit: BoxFit.cover,
        ),
        
      ),
        SizedBox(height: 20), // Espacio entre las filas de botones
    ],  
  );
}




Widget _forYou(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start, // Cambiado a alineación izquierda
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 16.0), // Añadido padding izquierdo
        child: Text(
          'Sus opciones:',
          style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 33, 33, 95),
          ),
        ),
      ),
      SizedBox(height: 10),
    ],
  );
}


  Widget _recent(context) {
    return Column(
      children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              // NoteListScreen
             Navigator.push( context,
                MaterialPageRoute(builder: (context) => MedicationsNew()),
             );
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 121, 83, 133), // Color de fondo
              onPrimary: Colors.white, // Color del texto
              //side: BorderSide(color: Color.fromARGB(255, 120, 49, 148), width: 2), // Color y ancho del borde,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
            ),
            child: Padding(
          padding: EdgeInsets.all(15), // Padding de 10 unidades en todos los lados
          child: Column(
            children: [
              Image.asset(
                'assets/inicio/uno.png',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                'Recordatorio',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
          SizedBox(width: 20), // Espacio entre los botones
          ElevatedButton(
            onPressed: () {
              // Acción cuando se presiona el segundo botón
            Navigator.push( context,
                  MaterialPageRoute(builder: (context) => splashmedicamentos()),
               );
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 52, 65, 97), // Color de fondo    Color.fromARGB(255, 123, 59, 51)
              
              onPrimary: Colors.white, // Color del texto
              //side: BorderSide(color: Color.fromARGB(255, 120, 49, 148), width: 2), // Color y ancho del borde,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
            ),
            child: Padding(
          padding: EdgeInsets.all(15), // Padding de 10 unidades en todos los lados
          child: Column(
            children: [
              Image.asset(
                'assets/inicio/pasti.png', 
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                'Medicamento',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
        ],
      ),
      SizedBox(height: 20), // Espacio entre las filas de botones
      Row(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          ElevatedButton(
            onPressed: () {
              //Get.toNamed(Routes.HOME);   " or "Get.lazyPut(()=>HomeController())
               Navigator.push( context,
                MaterialPageRoute(builder: (context) => splashcalendario()),
             );
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 87, 120, 160), // Color de fondo 255, 104, 169, 115
              
              onPrimary: Colors.white, // Color del texto
              //side: BorderSide(color: Color.fromARGB(255, 120, 49, 148), width: 2), // Color y ancho del borde,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
            ),
            child: Padding(
          padding: EdgeInsets.all(15), // Padding de 10 unidades en todos los lados
          child: Column(
            children: [
              Image.asset(
                'assets/imagenes/apagar.png',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 13),
              Text(
                '   Ubicación  ',
                style: TextStyle(fontSize: 16.6),
              ),
            ],
          ),
        ),
      ),


          SizedBox(width: 20), // Espacio entre los botones
          ElevatedButton(
            onPressed: () {
              // Acción cuando se presiona el cuarto botón
             Navigator.push( context,
                 MaterialPageRoute(builder: (context) => splashubi()),
               );
             
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 86, 175, 113) ,// Color de fondo
              onPrimary: Colors.white, // Color del texto
              //side: BorderSide(color: Color.fromARGB(255, 120, 49, 148), width: 2), // Color y ancho del borde,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
            ),
            child: Padding(
          padding: EdgeInsets.all(15), // Padding de 10 unidades en todos los lados
          child: Column(
            children: [
              Image.asset(
                'assets/inicio/informe.png',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                ' Calendario  ',
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
        ],
        
      ),
SizedBox(height: 10),
      ],
                    
    );
  }




  Widget _AppBar(context) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Alinear al centro
        children: <Widget>[
          Center(
            child: IconButton(
              iconSize: 90.0,
              icon: Image.asset(
                'assets/iconos/camara.png',
                width: 90.0, // Ancho de la imagen del icono
                height: 90.0, // Alto de la imagen del icono
              ),
              onPressed: () {
                Navigator.push( context,
                  MaterialPageRoute(builder: (context) => CameraScreen()),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}


    


}