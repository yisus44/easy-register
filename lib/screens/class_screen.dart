import 'package:easy_register/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ClassScreen extends StatelessWidget {

var size,height,width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nombre de la clase',
        style: TextStyle(color:Colors.black),
        ),
        elevation: 0,
        
        ),
      body: Column(
        children: [
          TextIcon(),
          const CardSlider(carouselName: 'Clases',cardsCount: 2,)
        ],)
      
    );
  }
}