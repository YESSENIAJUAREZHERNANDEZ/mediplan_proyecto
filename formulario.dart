/*import 'package:flutter/material.dart';*/
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReminderPage(),
    );
  }
}

class ReminderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/app_logo.png',
                width: 40, height: 40), // Coloca el logo de tu app aquí
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Lógica para abrir el menú
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors
                .grey[200], // Cambiar el color del background a gris clarito
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Paso 2 - Recordatorio',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Cambiar el color del texto a negro
                ),
              ),
              SizedBox(height: 20),
              Text(
                '¿A qué hora quiere escuchar el recordatorio?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black, // Cambiar el color del texto a negro
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  // Lógica para abrir el selector de hora
                  TimeOfDay selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  // Manejar la hora seleccionada (si el usuario no canceló la selección)
                  if (selectedTime != null) {
                    print('Hora seleccionada: ${selectedTime.format(context)}');
                  }
                },
                child: TextFormField(
                  readOnly:
                      true, // Evita que el teclado aparezca al hacer tap en el input
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Seleccionar hora',
                    suffixIcon: Icon(Icons.access_time), // Icono de reloj
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                  height: 30), // Espacio más grande entre el input y el botón
              ElevatedButton(
                onPressed: () {
                  // Lógica para pasar a la siguiente interfaz
                },
                child: Text(
                  'Siguiente',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
