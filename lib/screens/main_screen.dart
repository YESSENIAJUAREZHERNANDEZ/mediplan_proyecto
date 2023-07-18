import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/alarma.dart';
import 'package:flutter_application_1/screens/camara.dart';
import 'package:flutter_application_1/screens/dispositivos.dart';
import 'package:flutter_application_1/screens/loginapp.dart';
import 'package:flutter_application_1/screens/medicamentos.dart';
import 'package:flutter_application_1/screens/seguimiento.dart';
//import 'package:flutter_application_1/screens/signup.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
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
  double progressValue = 0.7; // Valor del progreso (70%)

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Su tratamiento',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(height: 10.0), // Espacio entre el texto y la barra de progreso
        LinearProgressIndicator(
          minHeight: 65.0, // Altura de la barra de progreso
          value: progressValue, // Valor del progreso (70%)
          valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 211, 146, 255)), // Color de la barra de progreso
          backgroundColor: Color.fromARGB(255, 235, 228, 236), // Color de fondo de la barra de progreso
        ), // Barra de progreso
      ],
    ),
  );
}


  

   Widget _forYou(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Text(
            'Inicio',
            style: Theme.of(context).textTheme.bodyText1,
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
              // Acción cuando se presiona el primer botón
              Navigator.push( context,
                  MaterialPageRoute(builder: (context) => ReminderApp()),
                );
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 146, 176, 227), // Color de fondo
              onPrimary: Colors.white, // Color del texto
              //side: BorderSide(color: Color.fromARGB(255, 120, 49, 148), width: 2), // Color y ancho del borde,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
            ),
            child: Padding(
          padding: EdgeInsets.all(15), // Padding de 10 unidades en todos los lados
          child: Column(
            children: [
              Image.asset(
                'assets/imagenes/reloj.png',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                'Recordatorio',
                style: TextStyle(fontSize: 18),
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
                  MaterialPageRoute(builder: (context) => MedicationScreen()),
                );
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 231, 197, 132), // Color de fondo
              onPrimary: Colors.white, // Color del texto
              //side: BorderSide(color: Color.fromARGB(255, 120, 49, 148), width: 2), // Color y ancho del borde,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
            ),
            child: Padding(
          padding: EdgeInsets.all(15), // Padding de 10 unidades en todos los lados
          child: Column(
            children: [
              Image.asset(
                'assets/imagenes/pills.png',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                'Medicamento',
                style: TextStyle(fontSize: 18),
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
              // Acción cuando se presiona el tercer botón
              Navigator.push( context,
                  MaterialPageRoute(builder: (context) => Dispositivos()),
                );
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 139, 81, 245), // Color de fondo
              onPrimary: Colors.white, // Color del texto
              //side: BorderSide(color: Color.fromARGB(255, 120, 49, 148), width: 2), // Color y ancho del borde,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
            ),
            child: Padding(
          padding: EdgeInsets.all(15), // Padding de 10 unidades en todos los lados
          child: Column(
            children: [
              Image.asset(
                'assets/imagenes/blanco.png',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                'Dispositivos',
                style: TextStyle(fontSize: 18),
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
                  MaterialPageRoute(builder: (context) => CalendarScreen()),
                );
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 111, 156, 92), // Color de fondo
              onPrimary: Colors.white, // Color del texto
              //side: BorderSide(color: Color.fromARGB(255, 120, 49, 148), width: 2), // Color y ancho del borde,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
            ),
            child: Padding(
          padding: EdgeInsets.all(15), // Padding de 10 unidades en todos los lados
          child: Column(
            children: [
              Image.asset(
                'assets/imagenes/persona.png',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                'Seguimiento',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
        ],
        
      ),
SizedBox(height: 50),
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