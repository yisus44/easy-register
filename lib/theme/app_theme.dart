
import 'package:flutter/material.dart';

class AppTheme{
  static const Color primary = Color.fromARGB(255, 25, 76, 112);

  static final ThemeData lightTheme = ThemeData.light().copyWith(

    primaryColor: Colors.indigo,

    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0
    ),
    

  );
  static final ThemeData darkTheme = ThemeData.dark().copyWith(

    primaryColor: Colors.indigo,

    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0
    ),

  );
}