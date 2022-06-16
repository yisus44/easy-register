import 'package:easy_register/screens/grades_screen.dart';
import 'package:easy_register/widgets/QRViewExample.dart';
import 'package:flutter/material.dart';
import '../widgets/generic_button.dart';
import '../widgets/widgets.dart';

class StudentScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          "assets/logo_small_transparent.png", "Alumnos","Configuración","Salir"),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              IconButton(
                onPressed: null,
                 icon: Icon(Icons.email)),
              IconButton(
              onPressed:null,
              icon: Icon(Icons.search)),
              IconButton(
              onPressed:null,
              icon: Icon(Icons.edit_note)),
            ],
            
            
          ),
              const StudentCheckbox(nameItemList: 'Alumno 1'),
              
              const StudentCheckbox(nameItemList: 'Alumno 2'),
              const StudentCheckbox(nameItemList: 'Alumno 3'),

              GenericButton(
            buttonText: "Calificaciones",
            onClick: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          GradesScreen())),
            }),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const QRViewExample(),
                  ));
                },
                child: Container(
                  margin: const EdgeInsets.all(30),
                  child: const Text('Escaner QR')),
              ),

    ]
      ),
    );
  }
}