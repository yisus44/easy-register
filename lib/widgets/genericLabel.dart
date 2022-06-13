import 'package:flutter/material.dart';

class GenericLabel extends StatelessWidget {
  final String titleText;
  final double fontSize;
  const GenericLabel(this.titleText, this.fontSize, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        '${titleText}',
        style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
