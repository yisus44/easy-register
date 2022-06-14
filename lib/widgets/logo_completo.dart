import 'package:flutter/material.dart';

class LogoCompleto extends StatelessWidget {
  final double heightSize;

  const LogoCompleto({Key? key, required this.heightSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        children: [
          FadeInImage(
            image: const AssetImage('assets/logo_completo.PNG'),
            placeholder: const AssetImage('assets/jar-loading.gif'),
            width: double.infinity,
            height: heightSize,
          )
        ],
      )
    );
  }
}