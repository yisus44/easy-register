import 'package:easy_register/widgets/generic_button.dart';
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

  void _submitData() {
    final enteredTitle = _nameController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount < 0) {
      return;
    }

    widget._addNewAsignation(enteredTitle, enteredAmount.toString());

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenericField(
            controller: _nameController,
            typeText: true,
            titleText: 'Nombre de la rubrica',
            customFontSize: 20,
            onChange: null),
        GenericField(
            controller: _amountController,
            typeText: true,
            titleText: 'Valor de la rubrica',
            inputType: TextInputType.number,
            customFontSize: 20,
            onChange: null),
        GenericButton(
          buttonText: "Agregar",
          onClick: _submitData,
        )
      ],
    );
  }
}
