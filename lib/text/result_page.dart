import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: Padding(
  padding: const EdgeInsets.all(30),
  child: Align(
    alignment: Alignment.center,
    child: Text(
      text,
      style: TextStyle(
        color: Color.fromARGB(255, 48, 24, 49),
        fontSize: 28,
      ),
    ),
  ),
),

    );
  }
}