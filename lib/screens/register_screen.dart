import 'package:flutter/material.dart';
import '../core/services/auth/auth_service.dart';
import '../widgets/utils/Modal.dart';
import '../widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final dateController = TextEditingController();
  String password = "";
  String email = "";
  String name = "";

  int birthDay = 0;
  int birthMonth = 0;
  int birthYear = 0;
  void getPassword(String val) {
    setState(() {
      password = val;
    });
  }

  void getUsenamer(String val) {
    setState(() {
      email = val;
    });
  }

  void onSubmit() async {
    if (email == "") {
      Modal.showModalDialog(
          "Invalid information", "email should not be empty", context);
      return;
    }

    if (password == "") {
      Modal.showModalDialog(
          "Invalid information", "Password should not be empty", context);
      return;
    }

    if (birthDay <= 0 || birthMonth <= 0 || birthMonth <= 0) {
      Modal.showModalDialog(
          "Invalid information", "Please select your birthday ", context);
      return;
    }

    const AuthService service =
        AuthService("https://gentle-mountain-69254.herokuapp.com/api/v1");

    final response = await service.register(
        name, email, password, birthDay, birthMonth, birthYear);

    if (response.error != null) {
      Modal.showModalDialog("Something went wrong",
          "Check your credentials or try again later", context);
      return;
    }

    Navigator.pushNamed(
      context,
      '/home',
      arguments: <String, int>{
        'teacherId': response.data.id,
      },
    );
  }

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
      final dt = DateTime.parse(dateController.text);
      birthDay = dt.day;
      birthMonth = dt.month;
      birthYear = dt.year;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const CustomAppBar("assets/logo_small_transparent.png", ""),
          elevation: 0,
        ),
        body: Column(
          children: [
            const LogoCompleto(heightSize: 230),

            //campos
            AuthenticationFields(
                typeText: false,
                titleText: 'Email',
                inputType: TextInputType.emailAddress),
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

            AuthenticationFields(
              typeText: true,
              titleText: 'Contraseña',
            ),
            AuthenticationFields(
                typeText: true,
                titleText: 'Confirmar contraseña',
                onSubmited: onSubmit),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthenticationButton(buttonText: 'Ingresar', onClick: onSubmit),
                AuthenticationButton(
                  buttonText: 'Registrarse',
                  onClick: onSubmit,
                ),
              ],
            )
          ],
        ));
  }
}
