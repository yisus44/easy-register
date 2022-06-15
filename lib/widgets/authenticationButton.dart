import 'package:flutter/material.dart';

class AuthenticationButton extends StatelessWidget {

final String buttonText;

  const AuthenticationButton({
    Key? key,
    required this.buttonText
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(
        child: Text('${buttonText}'),
        onPressed: () {
        },
        style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 14, 100, 115),
                //padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold)),
      )
    );
  }
}