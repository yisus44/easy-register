import 'package:easy_register/widgets/utils/Modal.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

import '../widgets/widgets.dart';

class MaterialScreen extends StatelessWidget {
  final int countColumn;

  const MaterialScreen({Key? key, required this.countColumn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar("assets/logo_small_transparent.png", "",
            "Configuracion", "Salir"),
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
                            child: FocusedMenuHolder(
                              blurSize: 4,
                              blurBackgroundColor: Colors.white,
                              menuWidth: MediaQuery.of(context).size.width*0.5,
                              menuItemExtent: 70,
                              animateMenuItems: false,
                              duration: const Duration(milliseconds: 500),
                              onPressed: (){},
                              menuItems: <FocusedMenuItem>[
                                FocusedMenuItem(
                                  title: const Text("Eliminar"),
                                   onPressed: (){
                                    Modal.showModalDialog("Eliminar", "Seguro que desea eliminar este elemento?", context);
                                   },
                                   trailingIcon: const Icon(Icons.delete)
                                ),
                                FocusedMenuItem(title: const Text("Mostrar"), onPressed: (){
                                    Modal.showModalDialog("Mostrar", "¿Seguro que desea mostrar este elemento?", context);

                                }, trailingIcon: const Icon(Icons.open_in_full))
                              ],
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