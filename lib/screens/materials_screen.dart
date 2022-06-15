import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class MaterialScreen extends StatelessWidget {
  final int countColumn;

  const MaterialScreen({Key? key, required this.countColumn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar("assets/logo_small_transparent.png", "",
            "Registrarse", "Configuración"),
        elevation: 0,
      ),
      body: Container(
        child: Padding(padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            
            const SizedBox(
              height: 10,
            ),
            const Text('Mi material', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(icon: const Icon(Icons.sort), onPressed: () {})
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: countColumn),
                  children: [1,2,3,4,5,6]
                      .map(
                        (e) =>
                            // EACH LIST ITEM
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Card(
                              elevation: 15,
                              shadowColor: Colors.blueGrey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/image_$e.jpg"),
                              ],
                            ),
                                                  ),
                          ),
                      )
                      .toList(),
                )
            )
          ]),
        ),
      ),
    );
  }
}