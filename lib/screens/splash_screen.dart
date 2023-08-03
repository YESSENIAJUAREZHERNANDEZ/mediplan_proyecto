import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/googlelogin.dart';
import 'package:flutter_application_1/screens/loginapp.dart';
//import 'package:flutter_application_1/screens/main_screen.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Container(
        width: double.infinity,
        color:Color.fromARGB(255, 78, 157, 196),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/imagenes/inicio.png'),
            Column(
              children:<Widget> [
                Text(
              'Medi plan',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Su asistente personal',
              style: Theme.of(context).textTheme.headline2,
            ),
              ],
            ),
            MaterialButton(
              elevation:10.0,
              minWidth: 170.0,
              height: 60.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              child:Text(
                'Iniciar',
                style:TextStyle(
                  color: Color.fromARGB(255, 78, 157, 196),
                  fontSize: 26.0,
                 ),
              ),
              onPressed: () {
                Navigator.push( context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                },
            ),
          ],
        ),
      ),
    );
  }
}