
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
        'login':    ( _ )=> LoginScreen(),
        'register': ( _ )=> RegisterScreen(),
        'homeScreen': ( _ )=> HomeScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color:Color.fromARGB(255, 206, 206, 206)
        )
      ),
    );
  }
}