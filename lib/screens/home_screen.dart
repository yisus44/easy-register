import 'package:easy_register/screens/screens.dart';
import 'package:easy_register/widgets/generic_button.dart';
import 'package:easy_register/widgets/widgets.dart';
import '../core/services/classes/class_service.dart';

import 'package:flutter/material.dart';

import '../widgets/utils/Modal.dart';
import 'create_class_screen.dart';

class HomeScreen extends StatefulWidget {
  final int teacherId;
  String? teacherName;

  HomeScreen(this.teacherId, {this.teacherName, Key? key}) : super(key: key);

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
      appBar: CustomAppBar(
          "assets/logo_small_transparent.png",
          "Bienvenido ${widget.teacherName ?? "fulanito"}",
          "Configuración",
          "Salir"),
      body: SingleChildScrollView(
          child: Column(
        children: [
          CardSlider(
            carouselName: 'Clases',
            cardsCount: cards.length,
            cardPayload: cards,
          ),
          CardSlider(
            carouselName: 'Material',
            cardsCount: 1,
            cardPayload: const [CardPayload("Materiales", "Ver materiales")],
            onLast: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const MaterialScreen(countColumn: 2)))
            },
          ),
          GenericButton(
            buttonText: "Ir a agregar clase",
            onClick: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CreateClassScreen(teacherId: widget.teacherId)))
            },
          )
        ],
      )),
    );
  }
}
