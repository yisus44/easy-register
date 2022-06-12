import 'package:flutter/material.dart';

//generic app bar which takes one argument() the widget that will be in the right)
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String imgUrl;
  final String message;
  final List<Widget>? actions;

  const CustomAppBar(this.imgUrl, this.message, {Key? key, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(message,
            style: const TextStyle(
                color: Color.fromARGB(255, 11, 111, 134), fontSize: 18)),
        leadingWidth: 120,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
          ),
          child: Image.asset(imgUrl, width: 110, height: 100),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
//''
// SizedBox(
//           child: Transform.scale(
//               scale: 2,
//               child: IconButton(
//                 onPressed: null,
//                 padding: const EdgeInsets.all(0.0),
//                 icon: Image.asset(
//                   '',
//                   height: 700.0,
//                 ),
//               )),
//         ),