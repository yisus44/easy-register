import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  final String buttonText;
  final Function? onClick;
  const GenericButton({Key? key, required this.buttonText, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          child: Text(buttonText),
          onPressed: () {
            if (onClick != null) {
              onClick!();
            }
          },
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 11, 111, 134),
            onPrimary: Colors.white,
            minimumSize: const Size(100, 50) // foreground (text) color
          ),
        ));
  }
}
