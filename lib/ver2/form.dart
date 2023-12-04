import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart'; 

//Notificación
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'services/noti_service.dart';

DateTime scheduleTime = DateTime.now();

class AddMedicationScreen extends StatefulWidget {
  final DatabaseReference medicationsRef;

  AddMedicationScreen({required this.medicationsRef});

  @override
  _AddMedicationScreenState createState() => _AddMedicationScreenState();
}


class _AddMedicationScreenState extends State<AddMedicationScreen> {
  String dropdownValue = 'ml / Jarabe';
  DateTime? _selectedDate;
  

  @override
  Widget build(BuildContext context) {
    TextEditingController nombreController = TextEditingController();
    TextEditingController descripcionController = TextEditingController();
    TextEditingController propositoController = TextEditingController();
    TextEditingController administracionController = TextEditingController();

void addMedication() {
  String nombre = nombreController.text.toUpperCase();
  String descripcion = descripcionController.text;
  String proposito = propositoController.text;
  String administracion = administracionController.text;

  if (nombre.isNotEmpty && descripcion.isNotEmpty && _selectedDate != null) {
    // Obtén el formateador de fecha
    DateFormat dateFormatter = DateFormat('yyyy-MM-dd');

    // Formatea la fecha seleccionada a una cadena con el formato deseado
    String formattedDate = dateFormatter.format(_selectedDate!);

    // Verifica si el medicamento ya existe en la base de datos
    widget.medicationsRef
        .orderByChild('nombre')
        .equalTo(nombre)
        .once()
        .then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      Map<dynamic, dynamic>? values = snapshot.value as Map<dynamic, dynamic>?;

      if (values != null) {
        bool exists = values.entries.any((entry) => entry.value['nombre'] == nombre);
        if (exists) {
          final snackBar = SnackBar(
            content: Text('El medicamento ya existe en la base de datos.'),
            duration: Duration(seconds: 3),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          String id = widget.medicationsRef.push().key ?? '';

          // Guardar los datos en Firebase, incluyendo la fecha formateada
          widget.medicationsRef.child(id).set({
            'nombre': nombre,
            'descripcion': descripcion,
            'proposito': proposito,
            'administracion': administracion,
            'fecha': formattedDate, // Agregar la fecha formateada
          }).then((_) {
            Navigator.pop(context);
          }).catchError((error) {
            print('Error adding medication: $error');
          });
        }
      } else {
        String id = widget.medicationsRef.push().key ?? '';

        // Guardar los datos en Firebase, incluyendo la fecha formateada
        widget.medicationsRef.child(id).set({
          'nombre': nombre,
          'descripcion': descripcion,
          'proposito': proposito,
          'administracion': administracion,
          'fecha': formattedDate, // Agregar la fecha formateada
        }).then((_) {
          Navigator.pop(context);
        }).catchError((error) {
          print('Error adding medication: $error');
        });
      }
    }).catchError((error) {
      print('Error searching for medication: $error');
    });
  }
}


     Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (picked != null && picked != _selectedDate) {
        setState(() {
          _selectedDate = picked;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Nuevo medicamento',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Nombre medicamento (en Mayusculas):',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blueGrey,
                ),
              ),
              TextField(
                controller: nombreController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[A-Z ]+')),
                ],
                decoration: InputDecoration(
                  hintText: 'Paracetamol, Nolotil, etc',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                   prefixIcon: Icon(Icons.medication),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Dosis prescrita:',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blueGrey,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: descripcionController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Cantidad',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: Icon(Icons.medication_liquid_rounded),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      }
                    },
                    items: <String>[
                      'ml / Jarabe',
                      'Gotas',
                      'Pastillas',
                      'unidad/mg',
                      'inyecciones'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Día de inicio de tratamiento:',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blueGrey,
                ),
              ),
               TextFormField(
                readOnly: true,
                onTap: () => _selectDate(context),
                controller: TextEditingController(
                  text: _selectedDate != null
                      ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                      : 'Seleccionar fecha',
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  prefixIcon: Icon(Icons.calendar_today_rounded),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Duración del tratamiento (en días):',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blueGrey,
                ),
              ),
              TextField(
                controller: administracionController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '0',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  prefixIcon: Icon(Icons.calendar_month),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Establecer recordatorio:',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blueGrey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ajusta el espaciado entre los elementos
                children: [
                  Flexible(
                    flex: 4, // Puedes ajustar este valor para dar más ancho al DatePickerTxt
                    child: DatePickerTxt(),
                  ), // Espacio entre los elementos (puedes ajustarlo)
                  Flexible(
                    flex: 3, // Puedes ajustar este valor para dar más ancho al botón
                    child: ScheduleBtn(),
                  ),
                ],
              ),
            SizedBox(height: 20),
              Text(
                'Propósito del medicamento:',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blueGrey,
                ),
              ),
              TextField(
                controller: propositoController,
                decoration: InputDecoration(
                  hintText: 'Dolor de cabeza, estomago, etc',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  prefixIcon: Icon(Icons.medical_information),
                ),
              ),
      
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: addMedication,
                child: Text(
                  'AGREGAR',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 78, 157, 196),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 45),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } 
}


class DatePickerTxt extends StatefulWidget {
  const DatePickerTxt({
    Key? key,
  }) : super(key: key);

  @override
  State<DatePickerTxt> createState() => _DatePickerTxtState();
}

class _DatePickerTxtState extends State<DatePickerTxt> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
  onPressed: () {
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      onChanged: (date) => scheduleTime = date,
      onConfirm: (date) {},
    );
  },
  style: ButtonStyle(
    side: MaterialStateProperty.all(BorderSide(color: Colors.grey)), // Cambia el color del borde
    // Otros atributos de estilo que desees modificar
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.access_time, color: Colors.blueGrey,), // Icono que deseas agregar
      const SizedBox(width: 8), // Espacio entre el icono y el texto
      Text(
        'Selecionar horario',
        style: TextStyle(fontSize: 16.0, color: Colors.blueGrey),
      ),
    ],
  ),
);

  }
}

class ScheduleBtn extends StatelessWidget {
  const ScheduleBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
        icon: Icon(Icons.notifications), // Icono que deseas agregar
        label: Text('Guardar ',
        style: TextStyle(fontSize: 16.0,)),
        onPressed: () {
          debugPrint('Notification Scheduled for $scheduleTime');
          NotificationService().scheduleNotification(
            title: 'Toma de medicamento ',
            body: 'Establecida para: $scheduleTime',
            scheduledNotificationDateTime: scheduleTime,
          );
        },
        style: ElevatedButton.styleFrom(
         primary: Color.fromARGB(255, 118, 187, 146),
        ),
      ),
      ],
    );
  }
}