import 'package:flutter/material.dart';

class GenericLabel extends StatelessWidget {
  final String titleText;
  final double fontSize;
  const GenericLabel(this.titleText, this.fontSize, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(5),
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
