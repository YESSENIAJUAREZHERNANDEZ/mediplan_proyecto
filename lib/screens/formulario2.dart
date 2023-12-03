import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late User _user;

  // Historial de medicamentos
  List<MedicationHistory> medicationHistory = [];

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser!;
    // Se agrega un ejemplo de historial para pruebas
    _addExampleMedicationHistory();
  }

  // Método para agregar un ejemplo de historial de medicamentos
  void _addExampleMedicationHistory() {
    setState(() {
      medicationHistory.add(
        MedicationHistory(
          date: DateTime.now().subtract(Duration(days: 2)),
          medications: ['Paracetamol', 'Ibuprofeno'],
        ),
      );
      medicationHistory.add(
        MedicationHistory(
          date: DateTime.now().subtract(Duration(days: 5)),
          medications: ['Aspirina', 'Amoxicilina'],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 94, 81, 233),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imagenes/fondo.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 32),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          _user.photoURL ?? 'assets/iconos/icono2.png'),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Bienvenido ${_user.displayName ?? ''}',
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Correo Electrónico: ${_user.email}',
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 185, 200, 207),
                      ),
                    ),
                  ],
                ),
              ),
              // Mostrar el historial de medicamentos
              SizedBox(height: 50),
              Text(
                      'Historial',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
              Expanded(
                child: ListView.builder(
                  itemCount: medicationHistory.length,
                  itemBuilder: (context, index) {
                    return MedicationHistoryCard(
                      date: medicationHistory[index].date,
                      medications: medicationHistory[index].medications,
                    );
                  },
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pop();
                  },
                  child: Text('Cerrar Sesión'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 93, 86, 196),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(double.infinity, 45),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MedicationHistory {
  final DateTime date;
  final List<String> medications;

  MedicationHistory({required this.date, required this.medications});
}

class MedicationHistoryCard extends StatelessWidget {
  final DateTime date;
  final List<String> medications;

  MedicationHistoryCard({required this.date, required this.medications});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fecha: ${date.toLocal()}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text('Medicamentos:'),
            Column(
              children: medications
                  .map((medication) => ListTile(
                        title: Text(medication),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UserProfileScreen(),
  ));
}