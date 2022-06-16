import 'package:easy_register/widgets/utils/Modal.dart';
import 'package:flutter/material.dart';

class StudentCheckbox extends StatefulWidget {
  final String nameItemList;

  const StudentCheckbox(
    {Key? key,
     required this.nameItemList
     }) : super(key: key);

  @override
  State<StudentCheckbox> createState() => _StudentCheckboxState(nameItemList);

}

class _StudentCheckboxState extends State<StudentCheckbox> {

  bool _checkValue = false;
  String nameItem='';

  _StudentCheckboxState(String nameItem){
    
    this.nameItem = nameItem;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [

          Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 19, 83, 117)),
                  borderRadius: BorderRadius.circular(10),
                ),
            child: CheckboxListTile(
              secondary: const Icon(Icons.delete),
              controlAffinity: ListTileControlAffinity.leading,//orden de check y title
              value: _checkValue,
              title: Text('${nameItem}'),
              onChanged: (value) => setState(() {
                _checkValue = value ?? true;
                Modal.showModalDialog('Seleccion', 'Selecciono ${nameItem}', context);
              }),
            ),
          ),
      ],
    );
  }
}