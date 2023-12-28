import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:napoli_smart/screens/home.dart';
import 'package:napoli_smart/widgets/splashScreen.dart';
import 'RouteGenerator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String appName = "🔍 Napoli Smart 🗺️";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(102, 153, 255, 1), // 33, 150, 2243
            brightness: Brightness.light,
            background: Color.fromRGBO(255, 255, 240, 1)), //220, 220, 220
        appBarTheme: AppBarTheme(
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Color.fromRGBO(102, 153, 255, 1),
          centerTitle: true, // centriamo il titolo dell AppBar
          foregroundColor: Color.fromRGBO(0, 0, 128, 1),
          titleTextStyle:
              GoogleFonts.nunito(fontSize: 35, fontWeight: FontWeight.w800),
          toolbarHeight: 90,
          actionsIconTheme: IconThemeData(size: 35),
        ),
        textTheme: TextTheme(
          headline1: GoogleFonts.nunito(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(52, 53, 65, 1),
          ),
          headline2: GoogleFonts.nunito(
            fontSize: 30,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(52, 53, 65, 1),
          ),
          bodyText1: GoogleFonts.nunito(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Color.fromRGBO(64, 64, 64, 1),
          ),
          bodyText2: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color.fromRGBO(64, 64, 64, 1),
          ),
        ),
      ),
      home: Splash(titolo: appName),
      /* HomePage(
        title: appName,
      ), */

      // MyHomePage(title: appName)
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
