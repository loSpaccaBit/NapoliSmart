import 'package:flutter/material.dart';
import 'package:napoli_smart/screens/home.dart';
import 'package:napoli_smart/screens/infoPage.dart';
import 'package:napoli_smart/screens/scanCode.dart';
import 'package:napoli_smart/screens/errorPage.dart';
import 'models/infoModel.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/scan':
        return MaterialPageRoute(builder: (context) => ScanCode());
      case '/home':
        return MaterialPageRoute(
            builder: (context) => HomePage(title: "🔍 Napoli Smart 🗺️"));
      /* case '/info':
        return MaterialPageRoute(builder: (context) => InfoPage()); */

      case '/info':
        if (args is Information) {
          return MaterialPageRoute(
            builder: (context) => InfoPage(information: args),
          );
        } else {
          return MaterialPageRoute(
            builder: (context) => ErrorPage(),
          );
        }

      /* case '/view':
        if (args is String) {
          return MaterialPageRoute(
              builder: (context) => ViewCircolari(link: args)); 
        }
        return MaterialPageRoute(builder: (context) => ErrorPage()); */
      case '/error':
        return MaterialPageRoute(builder: (context) => ErrorPage());
      default:
        return MaterialPageRoute(builder: (context) => ErrorPage());
    }
  }
}
