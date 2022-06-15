import 'package:easy_register/widgets/widgets.dart';
import 'package:flutter/material.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar("assets/logo_small_transparent.png", "",
            "Registrarse", "Configuración"),
        elevation: 0,
      ),
      body:  const GradeTable(),
    );
  }
}