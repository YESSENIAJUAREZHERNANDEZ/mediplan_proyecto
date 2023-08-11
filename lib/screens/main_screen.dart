import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/alarma.dart';
import 'package:flutter_application_1/screens/camara.dart';
import 'package:flutter_application_1/screens/dispositivos.dart';
import 'package:flutter_application_1/screens/editarecordatorios.dart';
import 'package:flutter_application_1/screens/editarmedicamento.dart';
import 'package:flutter_application_1/screens/formulario.dart';
import 'package:flutter_application_1/screens/formulario2.dart';
import 'package:flutter_application_1/screens/loginapp.dart';
import 'package:flutter_application_1/screens/recordatorios.dart';
import 'package:flutter_application_1/screens/seguimiento.dart';
import 'package:flutter_application_1/screens/splash_dos.dart';
import 'package:flutter_application_1/screens/splash_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      backgroundColor: Color.fromARGB(255, 223, 238, 248), // Fondo azul
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
          title: Text('Información de la cuenta',
          style: TextStyle( color: Color.fromARGB(255, 48, 24, 49), fontSize: 16,
           ),),
          onTap: () {
            // Acción para la opción 1
            
          },
        ),
        ListTile(
          title: Text(
            'Cerrar sesión',
            style: TextStyle(color: Color.fromARGB(255, 48, 24, 49), fontSize: 16),
          ),
          onTap: () {
            // Llamar a la función para cerrar sesión
            _signOut(context);
          },
        ),
        ListTile(
          title: Text('',
          style: TextStyle( color: Color.fromARGB(255, 48, 24, 49), fontSize: 16,
           ),),
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
  double progressValue = 0.2; // Valor del progreso (70%)

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Progreso de tratamiento',
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(height: 10.0), // Espacio entre el texto y la barra de progreso
        LinearPercentIndicator(
          alignment: MainAxisAlignment.spaceBetween, // Alineación del indicador de porcentaje
          width: MediaQuery.of(context).size.width - 60,
          lineHeight: 70.0, // Altura de la barra de progreso
          percent: progressValue, // Valor del progreso (70%)
          linearGradient: LinearGradient(
            colors: [Color.fromARGB(255, 201, 213, 251), Color.fromARGB(255, 208, 201, 251)], // Colores del gradiente
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          backgroundColor: const Color.fromARGB(255, 240, 240, 240), // Color de fondo de la barra de progreso
          linearStrokeCap: LinearStrokeCap.roundAll, // Borde redondeado
          center: Container(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${(progressValue * 100).toStringAsFixed(0)}%',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.bold,
            color:Color.fromARGB(255, 74, 61, 150),fontSize: 30.0,),
                  ),
                ),
              ],
            ),
          ), // Indicador de porcentaje
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
            style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: Color(0XFFB7B7D2),
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
              // Acción cuando se presiona el primer botón
              Navigator.push( context,
                  MaterialPageRoute(builder: (context) => NoteListScreen()),
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
                  MaterialPageRoute(builder: (context) => MedicationsApp()),
                );
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 136, 108, 189), // Color de fondo
              
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
              // Acción cuando se presiona el tercer botón
              Navigator.push( context,
                  MaterialPageRoute(builder: (context) => Mood()),
                );
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 233, 100, 144),  // Color de fondo
              
              onPrimary: Colors.white, // Color del texto
              //side: BorderSide(color: Color.fromARGB(255, 120, 49, 148), width: 2), // Color y ancho del borde,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
            ),
            child: Padding(
          padding: EdgeInsets.all(15), // Padding de 10 unidades en todos los lados
          child: Column(
            children: [
              Image.asset(
                'assets/iconos/espera.png',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                'Dispositivos',
                style: TextStyle(fontSize: 17),
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
              primary: Color.fromARGB(255, 209, 134, 98), // Color de fondo
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
                'Seguimiento',
                style: TextStyle(fontSize: 17),
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