import 'dart:math';

import 'package:easy_register/core/models/common/evaluation.dart';
import 'package:easy_register/core/models/common/student.dart';
import 'package:easy_register/core/services/classes/class_service.dart';
import 'package:easy_register/widgets/generic_button.dart';
import 'package:easy_register/widgets/utils/Modal.dart';
import 'package:easy_register/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../widgets/add_class.dart';
import '../widgets/genericField.dart';
import '../widgets/genericLabel.dart';

class CreateClassScreen extends StatefulWidget {
  final int teacherId;
  const CreateClassScreen({required this.teacherId, Key? key})
      : super(key: key);

  @override
  State<CreateClassScreen> createState() => _CreateClassScreenState();
}

class _CreateClassScreenState extends State<CreateClassScreen> {
  //first one means 10 percent
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
          selectedGroup = val.toString();
        }
      },
    );
  }

  void _addNewAsignation(String title, String description) {
    final newCard = CardPayload(title, description);
    setState(() {
      cards.insert(0, newCard);
    });
  }

  void sendClass() async {
    isTenPercent = _selections[0];
    final String name = className;
    final int teacherId = widget.teacherId;
    final int base = isTenPercent ? 10 : 100;
    double totalEvaluationSum = 0;
    List<double> totalEvaluationPoint = [];

    cards.removeAt(cards.length - 1);
    final List<Evaluation> evaluations = cards.map((card) {
      double point = double.parse(card.cardDescription);
      totalEvaluationPoint.add(point);
      return Evaluation(card.cardTitle, point);
    }).toList();

    totalEvaluationPoint.forEach((e) => totalEvaluationSum += e);

    final List<Student> formStudents = [
      Student("Jesus Adrian", "Flores Arevalo",
          "${DateTime.now().toString()}@gmail.com", "3325615651", 0)
    ];
    //we delete the card of Agregar rubro

    //validate data
    if (name == "") {
      Modal.showModalDialog(
          "Invalid information", "Classname should not be empty", context);

      cards.insert(cards.length, const CardPayload("Agregar rubro", "+"));
      return;
    }

    if (evaluations.isEmpty) {
      Modal.showModalDialog(
          "Invalid information", "Not enough evaluations", context);

      cards.insert(cards.length, const CardPayload("Agregar rubro", "+"));
      return;
    }

    if (isTenPercent && totalEvaluationSum != 10.00) {
      Modal.showModalDialog(
          "Invalid information",
          "Your evaluation must sum 10. You have($totalEvaluationSum)",
          context);

      cards.insert(cards.length, const CardPayload("Agregar rubro", "+"));
      return;
    }

    if (!isTenPercent && totalEvaluationSum != 100) {
      Modal.showModalDialog(
          "Invalid information",
          "Your evaluation must sum 100.You have($totalEvaluationSum)",
          context);

      cards.insert(cards.length, const CardPayload("Agregar rubro", "+"));
      return;
    }

    const ClassService classService =
        ClassService("https://gentle-mountain-69254.herokuapp.com/api/v1");
    final response = await classService.createClass(
        name, teacherId, evaluations, base, formStudents);
    if (response.data) {
      Navigator.pushNamed(context, '/home');
    }
  }

  Widget _buildPortraitMode() {
    return SingleChildScrollView(
        child: Column(
      children: [
        GenericField(
          typeText: false,
          titleText: 'Nombre de la clase',
          customFontSize: 15,
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
                const GenericLabel("Seleccionar grupo", 15),
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
        //   child: GestureDetector(
        //     child: const GenericLabel("Horarios", 15),
        //     onTap: selectStudents,
        //   ),
        // ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const GenericLabel("Calificacion basada en", 15),
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
                  });
                },
              ),
            ],
          ),
        ),
        const GenericLabel("Encuadre de asignaciones", 15),
        Container(
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
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
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GenericButton(
                buttonText: "Crear",
                onClick: sendClass,
              ),
              const GenericButton(buttonText: "Cancelar")
            ],
          ),
        )
      ],
    ));
  }

  Widget _buildLandscapeContent() {
    return SingleChildScrollView(
        child: Column(
      children: [
        GenericField(
          typeText: false,
          titleText: 'Nombre de la clase',
          customFontSize: 15,
        ),
        // GestureDetector(
        //   child: const GenericLabel("Alumnos", 15.0),
        //   onTap: selectStudents,
        // ),
        // GestureDetector(
        //   child: const GenericLabel("Horarios", 15.0),
        //   onTap: selectStudents,
        // ),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            "assets/logo_small_transparent.png", "Crear clase","Configuración","Salir"),
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
