import 'package:flutter/material.dart';

class AuthenticationLabel extends StatelessWidget {
  final String titleText;
  const AuthenticationLabel(this.titleText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        '${titleText}',
        style: const TextStyle(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}
