import 'package:flutter/material.dart';

class AuthenticationLabel extends StatelessWidget {
  final String titleText;
  const AuthenticationLabel(this.titleText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${titleText}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),
          ),
          const Icon(
            Icons.calendar_month,
            color: Color.fromARGB(255, 14 , 100, 115),
           // Color.fromARGB(255, 14, 100, 115)
            size: 24.0,
          ),
        ]
    );
  }
}
