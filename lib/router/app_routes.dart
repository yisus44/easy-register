import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'grades';

  static Map<String, Widget Function(BuildContext)> routes = {
    'login'      : (_) => LoginScreen(),
    'register'   : (_) => RegisterScreen(),
    'class'      : (_) => ClassScreen(),
    'home'       : (_) => HomeScreen(1),
    'createClass': (_) => const CreateClassScreen(teacherId: 1),
    'student'    : (_) => StudentScreen(),
    'grades'     : (_) => const GradesScreen(),
    'material'   : (_)=> const MaterialScreen(countColumn: 1,),
    'test': (_) => TestScreen()
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => LoginScreen(),
    );
  }
}
