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
     backgroundColor: Colors.white, // Establece el fondo transparente
      title: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            iconSize: 40.0,
            icon: Image.asset('assets/iconos/icono2.png'),
            onPressed: () {Navigator.pop(context);},
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
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
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