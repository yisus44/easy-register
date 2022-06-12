import 'package:flutter/material.dart';

class LogoCompleto extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        children: const[
          FadeInImage(
            image: AssetImage('assets/logo_completo.PNG'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            width: double.infinity,
            height: 230,
          )
        ],
      )
    );
  }
}