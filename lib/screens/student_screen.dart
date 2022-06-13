import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class StudentScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          "assets/logo_small_transparent.png", "Alumnos"),
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
              const StudentCheckbox(nameItemList: 'Alumno 3')

        ]),
    );
  }
}