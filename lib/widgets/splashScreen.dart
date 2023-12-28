import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:napoli_smart/screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key, required this.titolo});

  final String titolo;

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    final String titolo = widget.titolo;
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: SizedBox(
          height: 240,
          width: 200,
          child: Column(
            children: [
              Image.asset("assets/images/logo/logo.png"),
              Center(
                child: Text(
                  'loSpaccaBit',
                  style: GoogleFonts.pressStart2p(
                      color: Colors.white, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )),
      onAnimationEnd: () => debugPrint("On Fade In End"),
      nextScreen: HomePage(
        title: titolo,
      ),
      animationCurve: Curves.easeInCubic,
      animationDuration: const Duration(milliseconds: 2200),
    );
  }
}
