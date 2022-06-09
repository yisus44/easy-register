import 'package:flutter/material.dart';

class NavbarLogo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        elevation: 0,
        leading: Container(
          child: Image.asset('assets/logo_chico_fg.PNG'),
          ),
        ),
    );
  }
}