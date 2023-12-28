import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Pagina Non Trovata!'),
      ),
    );
  }
}
