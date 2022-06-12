

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
          const AuthenticationFields(titleText: 'Nombre',typeText: false),
          const AuthenticationFields(titleText: 'Contraseña',typeText: true),

          const AuthenticationButton(buttonText: 'Ingresar'),

          registerLink()


        ],
      )
    );
  }
}

class registerLink extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: const Text(
          'Registrate',
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
            fontSize: 25),
          ),
        onTap: ()=> Navigator.pushNamed(context, 'register'),
        );
      
      
      
      // child: TextButton(
      //   child: const Text(
      //     'Registrate',
      //     style: TextStyle(
      //       fontSize: 25,
      //       decoration: TextDecoration.underline,
      //       ),
      //   ),
      //   onPressed: () {} , 
      // )
    
  }
}

