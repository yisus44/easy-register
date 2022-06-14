import 'package:easy_register/widgets/generic_button.dart';
import 'package:easy_register/widgets/utils/Modal.dart';
import 'package:easy_register/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'genericField.dart';

class AddClass extends StatefulWidget {
  final Function _addNewAsignation;
  const AddClass(this._addNewAsignation, {Key? key}) : super(key: key);

  @override
  State<AddClass> createState() => _AddClassState();
}

class _AddClassState extends State<AddClass> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  String enteredTitle = "";
  double enteredAmount = 0;

  void _submitData() {
    widget._addNewAsignation(enteredTitle, enteredAmount.toString());
    Navigator.of(context).pop();
  }

  bool isValidForm() {
    final enteredTitle = _nameController.text;
    final enteredAmount = _amountController.text != ""
        ? double.parse(_amountController.text)
        : 0.0;
    if (enteredTitle.isEmpty || enteredAmount < 0 || enteredAmount > 100) {
      return false;
    }

    setState(() {
      this.enteredTitle = enteredTitle;
      this.enteredAmount = enteredAmount;
    });
    return true;
  }

  void onSubmit() {
    if (isValidForm()) {
      _submitData();
    } else {
      Modal.showModalDialog(
          "Invalid information", "Review information.", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LogoCompleto(heightSize: 130),
          GenericField(
              controller: _nameController,
              typeText: true,
              titleText: 'Nombre de la rubrica',
              customFontSize: 15,
              onChange: null),
          GenericField(
              controller: _amountController,
              typeText: true,
              titleText: 'Valor de la rubrica',
              inputType: TextInputType.number,
              inputAction: TextInputAction.go,
              customFontSize: 15,
              onSubmited: onSubmit,
              onChange: null),
          GenericButton(
            buttonText: "Agregar",
            onClick: onSubmit,
          ),
        ],
      ),
    );
  }
}
