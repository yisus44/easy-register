import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  final String buttonText;

  const GenericButton({Key? key, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          child: Text(buttonText),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 11, 111, 134),
            onPrimary: Colors.white, // foreground (text) color
          ),
        ));
  }
}
