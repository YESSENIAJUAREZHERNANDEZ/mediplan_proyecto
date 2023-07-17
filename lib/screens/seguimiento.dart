import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Seguimiento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalendarScreen(),
    );
  }
}


DateTime focusedDay = DateTime.now(); 
DateTime firstDay = DateTime.now().subtract(Duration(days: 7)); // Primer día
DateTime lastDay = DateTime.now().add(Duration(days: 7)); // Segundo día


class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Seguimiento de salud',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Mes | Semana',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            
            child: 
            
            TableCalendar(
              calendarFormat: CalendarFormat.month,
              focusedDay: focusedDay,
                firstDay: firstDay,
                lastDay: lastDay,
              // Resto de las configuraciones y propiedades del TableCalendar
            )
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/imagenes/campo.png', // Ruta de la imagen
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
