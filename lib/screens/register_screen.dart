import 'package:easy_register/widgets/authenticationLabel.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final dateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    super.dispose();
  }

  Future<void> selectDate() async {
    var date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    dateController.text = date.toString().substring(0, 10);
    print(dateController.text);
  }

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
            // const AuthenticationFields(typeText: false, titleText: ''),
            GestureDetector(
              child: const AuthenticationLabel("Fecha de nacimiento"),
              onTap: selectDate,
            ),

            const AuthenticationFields(typeText: true, titleText: 'Contraseña'),
            const AuthenticationFields(
                typeText: true, titleText: 'Confirmar contraseña'),

            const AuthenticationButton(buttonText: 'Registrarse')

            //DateTimeField(),
            //MyHomePage(),

            //button registrarse
          ],
        ));
  }
}
