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
    if (date != null) {
      print(dateController.text);
      dateController.text = date.toString().substring(0, 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const CustomAppBar(
          "assets/logo_small_transparent.png", "","Configuración","Salir"),
          elevation: 0,
        ),
        body: Column(
          children: [
            const LogoCompleto(heightSize: 230),

            //campos
            const AuthenticationFields(typeText: false, titleText: 'Nombre'),
            // const AuthenticationFields(typeText: false, titleText: ''),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: GestureDetector(
                child: const AuthenticationLabel("Fecha de nacimiento"),
                onTap: selectDate,
              ),
            ),

            const AuthenticationFields(typeText: true, titleText: 'Contraseña'),
            const AuthenticationFields(
                typeText: true, titleText: 'Confirmar contraseña'),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const[
                AuthenticationButton(buttonText: 'Ingresar'),
                AuthenticationButton(buttonText: 'Registrarse'),

              ],
            )

          ],
        ));
  }
}
