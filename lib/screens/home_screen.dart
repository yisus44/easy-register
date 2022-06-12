import 'package:easy_register/widgets/widgets.dart';
import '../widgets/app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          "assets/logo_small_transparent.png", "Bienvenido fulanito"),
      body: SingleChildScrollView(
          child: Column(
        children: [
          CardSlider(),
          CardSlider(),
          CardSlider(),
        ],
      )),
    );
  }
}
