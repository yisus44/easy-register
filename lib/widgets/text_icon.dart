import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:30),
      color: const Color.fromARGB(255, 199, 200, 202),

      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Nombre de la clase',
                style: TextStyle(color:Colors.black,fontSize: 25),
                ),
                Icon(Icons.edit_note,size: 50)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Alumnos',
                style: TextStyle(color:Colors.black,fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const[
                    Icon(Icons.search, size: 40),
                    Icon(Icons.edit_note, size: 50)
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Asignaciones',
                style: TextStyle(color:Colors.black,fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const[
                    Icon(Icons.search, size: 40),
                    Icon(Icons.edit_note, size: 50)
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Calificaciones',
                style: TextStyle(color:Colors.black,fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const[
                    Icon(Icons.search, size: 40),
                    Icon(Icons.edit_note, size: 50)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}