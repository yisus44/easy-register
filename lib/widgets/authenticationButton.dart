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
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(
        child: Text('${buttonText}'),
        onPressed: () {
          
        },
      )
    );
  }
}