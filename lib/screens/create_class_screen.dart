import 'package:easy_register/widgets/generic_button.dart';
import 'package:easy_register/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../widgets/add_class.dart';
import '../widgets/genericField.dart';
import '../widgets/genericLabel.dart';

class CreateClassScreen extends StatefulWidget {
  const CreateClassScreen({Key? key}) : super(key: key);

  @override
  State<CreateClassScreen> createState() => _CreateClassScreenState();
}

class _CreateClassScreenState extends State<CreateClassScreen> {
  final List<bool> _selections = [true, false];
  bool isTenPercent = true;
  final List<String> groups = ["6D", "3F", "Private"];
  String selectedGroup = "6D";
  final List<CardPayload> cards = [const CardPayload("Agregar rubro", "+")];

  String className = "";
  List<String> students = [];

  void getClassName(String newClassName) {
    setState(() {
      className = newClassName;
    });
  }

  void getGroup(dynamic val) {
    setState(
      () {
        if (val != null) {
          className = val.toString();
        }
      },
    );
  }

  void selectStudents() {}

  void selectHours() {}

  void _addNewAsignation(String title, String description) {
    final newCard = CardPayload(title, description);
    setState(() {
      cards.insert(0, newCard);
    });
  }

  Widget _buildPortraitMode() {
    return SingleChildScrollView(
        child: Column(
      children: [
        GenericField(
          typeText: false,
          titleText: 'Nombre de la clase',
          customFontSize: 20,
          onChange: getClassName,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const GenericLabel("Seleccionar grupo", 20),
                DropdownButton(
                    items: groups.map(
                      (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 15)),
                        );
                      },
                    ).toList(),
                    onChanged: getGroup),
              ],
            ),
          ),
        ),
        // Container(
        //   width: double.infinity,
        //   margin: const EdgeInsets.symmetric(horizontal: 25),
        //   padding: const EdgeInsets.symmetric(vertical: 5),
        //   decoration: BoxDecoration(
        //     color: Colors.grey.withOpacity(0.3),
        //   ),
        //   // child: GestureDetector(
        //   //   child: const GenericLabel("Horarios", 20),
        //   //   onTap: selectStudents,
        //   // ),
        // ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const GenericLabel("Calificacion basada en", 20),
              ToggleButtons(
                children: const <Widget>[Text("10%"), Text("100%")],
                isSelected: _selections,
                onPressed: (int index) {
                  setState(() {
                    if (index == 0) {
                      _selections[index] = !_selections[index];
                      _selections[index + 1] = !_selections[index];
                    } else {
                      _selections[index] = !_selections[index];
                      _selections[index - 1] = !_selections[index];
                    }
                    isTenPercent = !isTenPercent;
                  });
                },
              ),
            ],
          ),
        ),
        const GenericLabel("Encuadre de asignaciones", 15),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: CardSlider(
            carouselName: "Rubros",
            cardsCount: cards.length,
            cardPayload: cards,
            onLast: () {
              showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return GestureDetector(
                      child: AddClass(_addNewAsignation),
                      onTap: () {},
                      behavior: HitTestBehavior.opaque,
                    );
                  });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            GenericButton(buttonText: "Crear"),
            GenericButton(buttonText: "Cancelar")
          ],
        )
      ],
    ));
  }

  Widget _buildLandscapeContent() {
    return SingleChildScrollView(
        child: Column(
      children: [
        GenericField(
          typeText: true,
          titleText: 'Nombre de la clase',
          customFontSize: 15,
        ),
        GestureDetector(
          child: const GenericLabel("Alumnos", 15.0),
          onTap: selectStudents,
        ),
        GestureDetector(
          child: const GenericLabel("Horarios", 15.0),
          onTap: selectStudents,
        ),
        Row(
          children: [
            const GenericLabel("Calificacion basada en", 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ToggleButtons(
                children: const <Widget>[Text("10%"), Text("100%")],
                isSelected: _selections,
                onPressed: (int index) {
                  setState(() {
                    if (index == 0) {
                      _selections[index] = !_selections[index];
                      _selections[index + 1] = !_selections[index];
                    } else {
                      _selections[index] = !_selections[index];
                      _selections[index - 1] = !_selections[index];
                    }
                  });
                },
              ),
            )
          ],
        ),
        const AuthenticationLabel("Encuadre de asignaciones"),
        CardSlider(
          carouselName: "Rubros",
          cardsCount: cards.length,
          cardPayload: cards,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AuthenticationButton(buttonText: "Crear"),
            AuthenticationButton(buttonText: "Cancelar")
          ],
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
            "assets/logo_small_transparent.png", "Crear clase"),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return Center(
              child: orientation == Orientation.portrait
                  ? _buildPortraitMode()
                  : _buildLandscapeContent(),
            );
          },
        ));
  }
}
