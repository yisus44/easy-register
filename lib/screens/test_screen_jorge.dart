import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class TestScreen extends StatelessWidget {

  var size, height, width;
  
  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
        appBar: const CustomAppBar("assets/logo_small_transparent.png",
            "Alumnos", "Configuración", "Salir", "Más componentes"),
        body: SingleChildScrollView(
          child: Column(children: [
        
            // ---------------------------------- Implementation of two radio buttons
            Container(
              height: height * 0.2,
              width: width * 0.5,
              color: Colors.amber,
              child: const StudentRadioButton()),
            
            Container(
              height: 300,
              child: StudentRadioButton2()),
        
            // ---------------------------------- Implementation of popup menu button
            /* PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Item 1'),
                  ),
                ),
                const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.anchor),
                    title: Text('Item 2'),
                  ),
                ),
                const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.article),
                    title: Text('Item 3'),
                  ),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem(child: Text('Item A')),
                const PopupMenuItem(child: Text('Item B')),
              ],
            ), */
        
            // ---------------------------------- Implementation of Dialog
            Container(
              height: height * 0.2,
              width: width * 0.5,
              child: TextButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: const Text('AlertDialog description'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                child: const Text('Show Dialog'),
              ),
            ),
        
            // ---------------------------------- Implementation of TimePicker
            Container(
              height: height * 0.2,
              width: width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Colors.green, spreadRadius: 8),
                  BoxShadow(color: Colors.yellow, spreadRadius: 5),
                ],
              ),
              child: StudentTimePicker())
            /* const StudentTimePicker(), */
        
          ]),
        ));
  }
}
