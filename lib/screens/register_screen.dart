
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';


class RegisterScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Register'),
        elevation: 0,
        
        ),

      body: Column(
        children: [

          LogoCompleto(),

          //campos
          const AuthenticationFields(typeText: false, titleText: 'Nombre'),
          const AuthenticationFields(typeText: false, titleText: 'Fecha de nacimiento'),
          const AuthenticationFields(typeText: true, titleText: 'Contraseña'),
          const AuthenticationFields(typeText: true, titleText: 'Confirmar contraseña'),

          const AuthenticationButton(buttonText: 'Registrarse')

        ],
      )
    );
  }
}
