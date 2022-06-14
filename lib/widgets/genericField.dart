import 'package:flutter/material.dart';

class GenericField extends StatelessWidget {
  final bool typeText;
  final String titleText;
  final double customFontSize;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  Function? onChange;

  GenericField(
      {Key? key,
      required this.typeText,
      required this.titleText,
      this.onChange,
      this.controller,
      this.customFontSize = 25,
      this.inputAction,
      this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 10),
              child: Text(
                '${titleText}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: customFontSize,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              obscureText: typeText,
              keyboardType: inputType,
              textInputAction: inputAction,
              decoration: InputDecoration(
                fillColor:
                    const Color.fromARGB(255, 209, 213, 216).withOpacity(0.5),
                filled: true,
              ),
              onChanged: (_) {
                if (onChange != null) {
                  onChange!(_);
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
