import 'package:easy_register/widgets/widgets.dart';
import '../core/services/classes/class_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<CardPayload> cards = [CardPayload("Descripcion", "hola")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          "assets/logo_small_transparent.png", "Bienvenido fulanito"),
      body: SingleChildScrollView(
          child: Column(
        children: [
          CardSlider(
            carouselName: 'Clases',
            cardsCount: cards.length,
            cardPayload: cards,
          ),
          CardSlider(
            carouselName: 'Presentaciones easer',
            cardsCount: cards.length,
            cardPayload: cards,
          ),
          CardSlider(
            carouselName: 'Material',
            cardsCount: cards.length,
            cardPayload: cards,
          ),
          ElevatedButton(
              onPressed: () async {
                final ClassService service = ClassService(
                    "https://gentle-mountain-69254.herokuapp.com/api/v1");
                final response = await service.getAllClasses();
                int sum = 3 + 2;
                sum += 2;
              },
              child: const Text("hola esquizo"))
        ],
      )),
    );
  }
}
