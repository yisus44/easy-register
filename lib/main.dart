
import 'package:easy_register/screens/screens.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'easyRegister',
      initialRoute: 'login',
      routes: {
        'login': ( _ )=> LoginScreen(),
        'register': ( _ )=> RegisterScreen(),
      },
    );
  }
}