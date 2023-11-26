import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 

class MedicationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Formulario Flutter'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Agregar medicamento',
                 style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
                ),
              ),
              SizedBox(height: 20.0),
    
              SizedBox(height: 10.0),
              Text(
                'Por favor, complete el formulario:',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),

              // ACÁ EMPIEZA 1
              SizedBox(height: 20.0),
              Text(
                'Nombre de medicamento',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingresa aquí',
                ),
              ),

              // ACÁ EMPIEZA 2
              SizedBox(height: 20.0),
              Text(
                'Dosis',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                keyboardType: TextInputType.number, // Tipo de teclado numérico
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Solo permite números
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingresa cantidad aquí',
                ),
              ),
            
                          // ACÁ EMPIEZA 1
              SizedBox(height: 20.0),
              Text(
                'Propósito de medicación',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingresa aquí',
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
