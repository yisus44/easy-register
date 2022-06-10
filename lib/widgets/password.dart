import 'package:flutter/material.dart';

class Password extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
              Padding(
                padding: EdgeInsets.only(left: 30, bottom: 10),
                child: Text(
                  'Nombre',
                  style: TextStyle(
                    color:Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
          ],
        ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText:'UserName',
                  fillColor: Color.fromARGB(255, 209, 213, 216),
                  filled: true,
                ),
              ),
            ),
          )
      ],
    );

 }
}