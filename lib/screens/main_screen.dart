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
      body: SafeArea(
      
        child: ListView(
          children: <Widget>[
            _customAppBar(context),
            _textsHeader(context),
            _forYou(context),
            _recent(context),
            _AppBar(context),
          ],
        ),
      ),
    );
  }

  Widget _customAppBar(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            iconSize: 40.0,
            icon: Image.asset('assets/iconos/icono2.png'),
            onPressed: () {},
          ),
          Row(
            children: <Widget>[
              IconButton(
                iconSize: 20.0,
                icon: Image.asset('assets/imagenes/blanco.png'),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 40.0,
                icon: Image.asset('assets/iconos/menu.png'),
                onPressed: () {
                  Navigator.push( context,
                  MaterialPageRoute(builder: (context) => LoginApp()),
                );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textsHeader(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Su tratamiento ',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Progreso de hoy ',
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            '78%',
            style: Theme.of(context).textTheme.headline5,
          )
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
                  MaterialPageRoute(builder: (context) => Barra()),
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