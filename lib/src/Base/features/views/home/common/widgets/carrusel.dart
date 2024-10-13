import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:sizer/sizer.dart';
import 'package:valledupar_verde_app/src/Base/features/views/home/common/widgets/label_text.dart';

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

  const CarruselAnimado({
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
              SizedBox(height: 3.h),
              // Título con fondo verde transparente y bordes redondeados
              AnimatedTextWidget(
                color: Colors.green,
                texto: titulo,
                fontSize: 21.sp,
              ),
             
              // Espacio reducido para más altura en el carrusel
              
              // Aumenta la altura del carrusel ocupando más espacio de la pantalla
              Expanded(
              
                child: PageView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index]; // Obtenemos el objeto actual

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
                      child: FadeOutLeft(
                        delay: Duration(milliseconds: 300 * index),
                        child: Column(
                          children: [
                            // Ajuste de la imagen con Sizer
                            SizedBox(
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
                            SizedBox(height: 2.h),
                            AnimatedTextWidget(
                              color: Colors.orange.withOpacity(0.5), 
                              texto: item.nombreComun, 
                              fontSize: 19),
                            SizedBox(height: 2.h),
                            AnimatedTextWidget(
                              color: color, 
                              texto: item.nombreCientifico, 
                              fontSize: 19),
                            SizedBox(height: 1.h),
                            AnimatedTextWidget(
                              color: color, 
                              texto: item.descripcion, 
                              fontSize: 16)
                            
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
             // Espacio ajustado para que el carrusel tenga más altura
            ],
          ),
        );
      },
    );
  }
}
