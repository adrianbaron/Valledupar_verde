import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
Text textNegro(String text, BuildContext context) {
  // Detectar si el dispositivo está en modo vertical o horizontal
  bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

  return Text(
    text,
    style: GoogleFonts.lato(  // Puedes cambiar 'Lato' por cualquier otra fuente de Google Fonts
      color: Colors.black,
      fontSize: isPortrait ? 16.sp : 13.sp, // Ajusta el tamaño de la fuente según la orientación
      fontWeight: FontWeight.bold,
    ),
  );
}

Text textVerde(String text, BuildContext context) {
  // Detectar si el dispositivo está en modo vertical o horizontal
  bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

  return Text(
    text,
    style: GoogleFonts.lato(  // Usa la misma fuente o cambia según lo necesites
      color: Colors.green,
      fontSize: isPortrait ? 16.sp : 15.sp, // Ajusta el tamaño de la fuente según la orientación
      fontWeight: FontWeight.bold,
    ),
  );
}

