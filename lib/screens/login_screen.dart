

import 'package:easy_register/widgets/widgets.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const CustomAppBar(
          "assets/logo_small_transparent.png", "", "Registrarse","Configuración"),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            const LogoCompleto(heightSize: 230),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                AuthenticationFields(titleText: 'Nombre',typeText: false),
                AuthenticationFields(titleText: 'Contraseña',typeText: true),
              ],
            ),

            Container(
              margin: const EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AuthenticationButton(buttonText: 'Ingresar'),
                  registerLink()
                ],
              ),
            )
          ],
        ),
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
            color: Colors.black,
            decoration: TextDecoration.underline,
            fontSize: 15),
          ),
        onTap: ()=> Navigator.pushNamed(context, 'register'),
        );
      
  }
}

