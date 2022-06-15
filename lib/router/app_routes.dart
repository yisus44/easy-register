import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'material';

  static Map<String, Widget Function(BuildContext)> routes = {
    'login'      : (_) => LoginScreen(),
    'register'   : (_) => RegisterScreen(),
    'class'      : (_) => ClassScreen(),
    'home'       : (_) => HomeScreen(1),
    'createClass': (_) => const CreateClassScreen(teacherId: 1),
    'student'    : (_) => StudentScreen(),
    'material'   : (_)=> const MaterialScreen(countColumn: 1,),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => LoginScreen(),
    );
  }
}
