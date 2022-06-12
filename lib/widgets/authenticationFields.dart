import 'package:flutter/material.dart';

class AuthenticationFields extends StatelessWidget {

final bool typeText;
final String titleText;

  const AuthenticationFields({
    Key? key,
    required this.typeText,
    required this.titleText
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 10),
                child: Text(
                  '${titleText}',
                  style: const TextStyle(
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: typeText,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 209, 213, 216).withOpacity(0.5),
                  filled: true,
                ),
              ),
            ),
          )
      ],
    );

 }
}