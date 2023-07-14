import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loginapp.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupScreen(),
    );
  }
}

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nombreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
               Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/iconos/icono2.png',
                  width: 70,
                  height: 70,
                ),
              ),
                Text("Registro", style: TextStyle(fontSize: 28,fontFamily:'Roboto', color:Color.fromARGB(255, 6, 11, 53)),),
                //Text("Bienvenido", style: TextStyle(fontSize: 30, fontFamily:'Roboto' ,color:Color.fromARGB(255, 6, 11, 53)),),
                  SizedBox(height: 16.0),
                 Text(
                  'Ingrese los siguientes datos',
                  style: TextStyle(fontSize: 18.0,
            color: Color.fromARGB(255, 101, 101, 124),),
                ),
                  SizedBox(width: 10),

           
            
            Padding(
              padding: EdgeInsets.only(right: 18.0),
              
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: 
                    TextField(
                      controller: _nombreController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Nombre',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 15),
             Padding(
              padding: EdgeInsets.only(right: 18.0),
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    child: Image.asset('assets/iconos/mexico.png'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Número de teléfono',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


        SizedBox(height: 28.0),
          Container(
            width: 200, // Ajusta el ancho del botón según tus necesidades
            height: 50, // Ajusta la altura del botón según tus necesidades
            child: ElevatedButton(
              onPressed: () {
                // Lógica para iniciar sesión con número de teléfono
                Navigator.push( context,
                  MaterialPageRoute(builder: (context) => LoginApp()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 81, 111, 245), // Color de fondo
                onPrimary: Colors.white, // Color del texto
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Registrar', style: TextStyle(fontSize: 18)),
            ),
          ),

            SizedBox(height: 16.0),
           // ElevatedButton(
             // onPressed: () {
                // Lógica para iniciar sesión con Google
            //  },
            //  style: ElevatedButton.styleFrom(
            //    primary: Color.fromARGB(255, 255, 255, 255), // Color de fondo
             //   onPrimary: Colors.black, // Color del texto
            //  ),
            //  child: Row(
             //   mainAxisAlignment: MainAxisAlignment.center,
              //  children: [
              //    Image.asset(
              //      'assets/iconos/google.png', // Ruta de la imagen de Google
                 //   height: 24.0,
             //     ),
              //    SizedBox(width: 8.0),
               //   Text('Login with Google'),
             //   ],
            //  ),
            //),

          ],
        ),
      ),
    );
  }
}
