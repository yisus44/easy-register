import 'package:easy_register/widgets/widgets.dart';
import '../core/services/classes/class_service.dart';

import 'package:flutter/material.dart';

import '../widgets/utils/Modal.dart';

class HomeScreen extends StatefulWidget {
  final int teacherId;

  HomeScreen(this.teacherId, {Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CardPayload> cards = [CardPayload("Descripcion", "hola")];
  void initState() {
    super.initState();
    onLoad();
  }

  void onLoad() async {
    const ClassService service =
        ClassService("https://gentle-mountain-69254.herokuapp.com/api/v1");
    final response = await service.getAllClasses(widget.teacherId);
    if (response.error != null) {
      Modal.showModalDialog("Something went wrong",
          "Check your credentials or try again later", context);
      return;
    }

    setState(() {
      cards = [];
      response.data.forEach((element) {
        cards.add(CardPayload(element.name, element.id.toString()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar("assets/logo_small_transparent.png",
          "Bienvenido fulanito", "Configuración", "Salir"),
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
        ],
      )),
    );
  }
}
