import 'package:flutter/material.dart';

class DatePickerField extends StatefulWidget {
  @override
  _DatePickerFieldState createState()
  {
    return _DatePickerFieldState();
  }
}

class _DatePickerFieldState extends State<DatePickerField> {
String date = "";
DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Datepicker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
              child: Text("Choose Date"),
            ),
            Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}")
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025), 
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }
}
