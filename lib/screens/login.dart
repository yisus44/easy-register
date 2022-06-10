
import 'package:easy_register/widgets/widgets.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login'),
        elevation: 0,
        
        ),

      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [

          LogoCompleto(),

          Name(),
          //text y textfield

          //button

          //button ingresar

          //link registrarse


        ],
      )
    );
  }
}


