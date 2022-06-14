import 'package:easy_register/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ClassScreen extends StatelessWidget {
  final List<CardPayload> cards = [CardPayload("Descripcion", "hola")];
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Nombre de la clase',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            TextIcon(),
            CardSlider(
              carouselName: 'Clases',
              cardsCount: cards.length,
              cardPayload: cards,
            )
          ],
        ));
  }
}
