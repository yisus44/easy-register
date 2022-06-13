import 'package:easy_register/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreateClassScreen extends StatefulWidget {
  @override
  State<CreateClassScreen> createState() => _CreateClassScreenState();
}

class _CreateClassScreenState extends State<CreateClassScreen> {
  List<bool> _selections = List.generate(2, (_) => false);

  void selectStudents() {}

  void selectHours() {}

  Widget _buildPortraitMode() {
    return SingleChildScrollView(
        child: Column(
      children: [
        const AuthenticationFields(
            typeText: true, titleText: 'Nombre de la clase'),
        GestureDetector(
          child: const AuthenticationLabel("Alumnos"),
          onTap: selectStudents,
        ),
        GestureDetector(
          child: const AuthenticationLabel("Horarios"),
          onTap: selectStudents,
        ),
        Row(
          children: [
            const AuthenticationLabel("Calificacion basada en"),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ToggleButtons(
                children: <Widget>[Text("10%"), Text("100%")],
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
        const CardSlider(carouselName: "Rubros", cardsCount: 2),
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

  Widget _buildLandscapeContent() {
    return SingleChildScrollView(
        child: Column(
      children: [
        const AuthenticationFields(
            typeText: true, titleText: 'Nombre de la clase'),
        GestureDetector(
          child: const AuthenticationLabel("Alumnos"),
          onTap: selectStudents,
        ),
        GestureDetector(
          child: const AuthenticationLabel("Horarios"),
          onTap: selectStudents,
        ),
        Row(
          children: [
            const AuthenticationLabel("Calificacion basada en"),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ToggleButtons(
                children: <Widget>[Text("10%"), Text("100%")],
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
        const CardSlider(carouselName: "Rubros", cardsCount: 2),
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
