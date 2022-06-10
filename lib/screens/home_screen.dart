import 'package:easy_register/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          child: 
            Image.asset('assets/logo_chico_fg.PNG'),
            margin: const EdgeInsets.only(left: 5),
            //padding: EdgeInsets.only(left: 10),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSlider(),
              CardSlider(),
              CardSlider(),
            ],
          ) 
        ),
    );
  }
}