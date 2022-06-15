import 'package:easy_register/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../core/services/auth/auth_service.dart';
import '../widgets/utils/Modal.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String password = "";
  String email = "";

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
    const AuthService service =
        AuthService("https://gentle-mountain-69254.herokuapp.com/api/v1");
    final response = await service.login(email, password);
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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const CustomAppBar("assets/logo_small_transparent.png", ""),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const LogoCompleto(heightSize: 230),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthenticationFields(
                    titleText: 'Correo',
                    typeText: false,
                    onChange: getUsenamer,
                    inputType: TextInputType.emailAddress,
                  ),
                  AuthenticationFields(
                    titleText: 'Contraseña',
                    typeText: true,
                    onChange: getPassword,
                    onSubmited: onSubmit,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthenticationButton(
                      buttonText: 'Ingresar',
                      onClick: onSubmit,
                    ),
                    registerLink()
                  ],
                ),
              )
            ],
          ),
        ));
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
      onTap: () => Navigator.pushNamed(context, 'register'),
    );
  }
}
