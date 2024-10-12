import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valledupar_verde_app/src/Base/features/views/home/common/widgets/carrusel.dart';

class BarrioInfoCard extends StatelessWidget {
  final String nombre;
  final String descripcion;
  final Color color;


  const BarrioInfoCard({
    Key? key,
    required this.nombre,
    required this.descripcion,
    required this.color,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                nombre,
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(descripcion,
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              ),
              const SizedBox(height: 16),
              // Botones para mostrar el carrusel de aves y árboles
              /* Column(
                children: [
                 Image.network(
                  "https://interpolitico.com/inicio/wp-content/uploads/2013/12/Lasflores15.jpg",
                 )
                ],
              ), */ 
            ],
          ),
        ),
      ),
    );
  }
}