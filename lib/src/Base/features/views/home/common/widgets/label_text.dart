import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
 // Para ElasticIn
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart'; // Para el tamaño adaptable de la fuente

class AnimatedTextWidget extends StatelessWidget {
  final Color color;
  final String texto;
  final double fontSize;

  const AnimatedTextWidget({
    Key? key,
    required this.color,
    required this.texto,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElasticIn(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
        decoration: BoxDecoration(
          color: color, // Fondo verde transparente o cualquier color que se le pase
          borderRadius: BorderRadius.circular(20), // Bordes redondeados
        ),
        child: Text(
          texto,
          style: GoogleFonts.lato(
            fontSize: fontSize, // Tamaño de fuente adaptativo
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
