import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'createClass';

  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (_) => LoginScreen(),
    'register': (_) => RegisterScreen(),
    'class': (_) => ClassScreen(),
    'home': (_) => HomeScreen(),
    'createClass': (_) => CreateClassScreen(),
    'student': (_) => StudentScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => LoginScreen(),
    );
  }
}
