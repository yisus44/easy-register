import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StudentRadioButton2 extends StatefulWidget {
  const StudentRadioButton2({Key? key}) : super(key: key);

  @override
  State<StudentRadioButton2> createState() => _StudentRadioButton2State();
}

class _StudentRadioButton2State extends State<StudentRadioButton2> {
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 77, 255, 7),
        child: Column(
          children: <Widget>[
            for (int i = 1; i <= 5; i++)
              ListTile(
                title: Text(
                  'Radio $i',
                ),
                leading: Radio(
                  value: i,
                  groupValue: _value,
                  onChanged: i == 5
                      ? null
                      : (int? value) {
                          setState(() {
                            _value = value;
                          });
                        },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
