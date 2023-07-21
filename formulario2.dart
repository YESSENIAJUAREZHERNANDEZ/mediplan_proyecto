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
                  TimeOfDay? selectedTime = await showTimePicker(
  context: context,
  initialTime: TimeOfDay.now(),
);

if (selectedTime != null) {
  TimeOfDay nonNullableTime = selectedTime;
  // Ahora puedes usar nonNullableTime que es de tipo TimeOfDay (no nullable)
}


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
                  // Lógica para navegar a la siguiente interfaz
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReminderDatePage(),
                    ),
                  );
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

class ReminderDatePage extends StatelessWidget {
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
                'Paso 3 - Recordatorio',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Cambiar el color del texto a negro
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Selecciona la fecha del recordatorio',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black, // Cambiar el color del texto a negro
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  // Lógica para abrir el selector de fecha (calendario)
                  DateTime? selectedDate = await showDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime.now(),
  lastDate: DateTime(DateTime.now().year + 1), // Hasta un año en el futuro
);

if (selectedDate != null) {
  // Puedes usar selectedDate, que es de tipo DateTime (no nullable)
}

                  // Manejar la fecha seleccionada (si el usuario no canceló la selección)
                  if (selectedDate != null) {
                    print('Fecha seleccionada: $selectedDate');
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
                    hintText: 'Seleccionar fecha',
                    suffixIcon:
                        Icon(Icons.calendar_today), // Icono de calendario
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                  height:
                      30), // Espacio más grande entre el input y los botones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Lógica para cancelar la selección de fecha
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancelar',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para confirmar la fecha seleccionada y navegar a la siguiente interfaz
                      // Navigator.push(...);
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
