import 'package:flutter/material.dart';

//PASO "2"
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Form2(),
    );
  }
}

class Form2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/iconos/icono.png',
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
            color: Colors.grey[200],
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
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '¿A qué hora quiere escuchar el recordatorio?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  // Lógica para abrir el selector de hora
                  TimeOfDay? selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  // Manejar la hora seleccionada (si el usuario no canceló la selección)
                  if (selectedTime != null) {
                    print('Hora seleccionada: ${selectedTime.format(context)}');
                  }
                },
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Seleccionar hora',
                    suffixIcon: Icon(Icons.access_time),
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 30),
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
