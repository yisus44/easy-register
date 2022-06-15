import 'package:easy_register/screens/screens.dart';
import 'package:flutter/material.dart';

//generic app bar which takes one argument() the widget that will be in the right)
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String imgUrl;
  final String message;
  final List<Widget>? actions;
  final String optMenu1, optMenu2, optMenu3;

  const CustomAppBar(
    this.imgUrl,
    this.message,
    this.optMenu1,
    this.optMenu2,
    this.optMenu3,
    {Key? key, this.actions
    }): super(key: key);

  @override
  Widget build(BuildContext context) {

    void goToZzzz()
    {
      Navigator.push(context, MaterialPageRoute(builder: (context) => TestScreen()),);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 0),
          child:AppBar(
            title: Text(
              message,
                style: const 
                TextStyle(
                  color: Colors.white,
                  fontSize: 18
                )
            ),
            leadingWidth: 120,
            leading: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Image.asset(imgUrl, width: 110, height: 100),
            ),
            actions: <Widget>[
              Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 43,
                          padding: const EdgeInsets.all(0),
                          child: ElevatedButton(onPressed: () => goToZzzz(), child: const Text(":)", style: TextStyle(fontSize: 13),))),

                        PopupMenuButton<String>(
                          onSelected: null,
                          itemBuilder: (BuildContext context) {
                            return {'${optMenu1}', '${optMenu2}', '${optMenu3}'}.map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Text(choice),
                              );
                            }).toList();
                          }
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          )
        ),
      ]
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
