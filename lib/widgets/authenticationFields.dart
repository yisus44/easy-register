import 'package:flutter/material.dart';

class AuthenticationFields extends StatelessWidget {
  final bool typeText;
  final String titleText;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  Function? onChange;
  Function? onSubmited;

  AuthenticationFields(
      {Key? key,
      required this.typeText,
      required this.titleText,
      this.inputAction,
      this.onChange,
      this.onSubmited,
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
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
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
              keyboardType: inputType,
              textInputAction: inputAction,
              onSubmitted: (_) {
                if (onSubmited != null) {
                  onSubmited!();
                }
              },
              onChanged: (_) {
                if (onChange != null) {
                  onChange!(_);
                }
              },
              obscureText: typeText,
              decoration: InputDecoration(
                fillColor:
                    const Color.fromARGB(255, 24, 102, 162).withOpacity(0.5),
                filled: true,
              ),
            ),
          ),
        )
      ],
    );
  }
}
