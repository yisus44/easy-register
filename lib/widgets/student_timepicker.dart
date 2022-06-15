import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StudentTimePicker extends StatefulWidget {
  const StudentTimePicker({Key? key}) : super(key: key);

  @override
  State<StudentTimePicker> createState() => _StudentTimePickerState();
}

class _StudentTimePickerState extends State<StudentTimePicker> {
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _selectTime(context);
              },
              child: Text("Choose Time"),
            ),
            Text("${selectedTime.hour}:${selectedTime.minute}"),
          ],
        ),
      ),
    );
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
}
