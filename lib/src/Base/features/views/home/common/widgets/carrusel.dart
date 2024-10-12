import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CarruselAnimado extends StatelessWidget {
  final List<String> imagenes;
  final String titulo;
  final String subtitulo;

  CarruselAnimado({
    required this.imagenes,
    required this.titulo,
    required this.subtitulo,
  });

  @override
  Widget build(BuildContext context) {
    return Sizer(
      
      builder: (context, orientation, deviceType) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.5), // Fondo negro con opacidad
          ),
          child: Column(
            children: [
              SizedBox(height: 1.h),
              // Título con fondo verde transparente y bordes redondeados
              ElasticIn(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.5), // Fondo verde transparente
                    borderRadius: BorderRadius.circular(20), // Bordes redondeados
                  ),
                  child: Text(
                    titulo,
                    style: GoogleFonts.lato(
                      fontSize: 23.sp, // Tamaño de fuente adaptativo
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1.h), // Espacio reducido para más altura en el carrusel
              
              // Aumenta la altura del carrusel ocupando más espacio de la pantalla
              Expanded(
                flex: 1,  // Aumentar flex para darle más espacio al carrusel
                child: PageView.builder(
                  itemCount: imagenes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                      child: FadeIn(
                        delay: Duration(milliseconds: 300 * index),
                        child: Image.network(
                          imagenes[index],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // En caso de error, mostramos una imagen por defecto
                            return Image.asset(
                              'assets/images/placeholder_image.png', // Imagen de respaldo
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              SizedBox(height: 2.h), // Espacio ajustado para que el carrusel tenga más altura
              ElasticIn(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.5), // Fondo verde transparente
                    borderRadius: BorderRadius.circular(20), // Bordes redondeados
                  ),
                  child: Text(
                    subtitulo,
                    style: GoogleFonts.lato(
                      fontSize: 18.sp, // Tamaño de fuente adaptativo
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1.h), // Reducir espacio inferior
            ],
          ),
        );
      },
    );
  }
}
