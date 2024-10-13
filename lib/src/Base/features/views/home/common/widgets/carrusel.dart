import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

// Clase que representa la información de las aves o árboles
class InfoItem {
  final String nombreComun;
  final String nombreCientifico;
  final String descripcion;
  final String imagen;

  InfoItem({
    required this.nombreComun,
    required this.nombreCientifico,
    required this.descripcion,
    required this.imagen,
  });
}

class CarruselAnimado extends StatelessWidget {
  final List<InfoItem> items;  // Lista de objetos InfoItem en lugar de imágenes
  final String titulo;
 
  final Color color;

  CarruselAnimado({
    required this.items,
    required this.titulo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Container(
          decoration: BoxDecoration(
            color: color, // Fondo negro con opacidad
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
              
                child: PageView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index]; // Obtenemos el objeto actual

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
                      child: ElasticIn(
                        delay: Duration(milliseconds: 300 * index),
                        child: Column(
                          children: [
                            // Ajuste de la imagen con Sizer
                            Container(
                              height: 45.h, // Ajustar la altura al 30% de la pantalla
                              width: 100.w,  // Ajustar el ancho al 80% de la pantalla
                              child: Image.network(
                                item.imagen,
                                fit: BoxFit.cover, // Ajustar la imagen a su contenedor
                                errorBuilder: (context, error, stackTrace) {
                                  // En caso de error, mostramos una imagen por defecto
                                  return Image.asset(
                                    'assets/images/placeholder_image.png', // Imagen de respaldo
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 1.h),
                            ElasticIn(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.5), // Fondo verde transparente
                                  borderRadius: BorderRadius.circular(20), // Bordes redondeados
                                ),
                                child: Text(
                                  item.nombreComun,
                                  style: GoogleFonts.lato(
                                    fontSize: 22.sp, // Tamaño de fuente adaptativo
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h),
                            ElasticIn(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                                decoration: BoxDecoration(
                                  color: color, // Fondo verde transparente
                                  borderRadius: BorderRadius.circular(20), // Bordes redondeados
                                ),
                                child: Text(
                                  item.nombreCientifico,
                                  style: GoogleFonts.lato(
                                    fontSize: 20.sp, // Tamaño de fuente adaptativo
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h),
                            ElasticIn(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                                decoration: BoxDecoration(
                                  color: color, // Fondo verde transparente
                                  borderRadius: BorderRadius.circular(20), // Bordes redondeados
                                ),
                                child: Text(
                                  item.descripcion,
                                  style: GoogleFonts.lato(
                                    fontSize: 18.sp, // Tamaño de fuente adaptativo
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 2.h), // Espacio ajustado para que el carrusel tenga más altura
            ],
          ),
        );
      },
    );
  }
}
