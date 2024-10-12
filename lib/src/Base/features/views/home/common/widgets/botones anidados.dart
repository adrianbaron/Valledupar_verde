import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class BotonesAnimados extends StatelessWidget {
  final VoidCallback onMostrarAves;
  final VoidCallback onMostrarArboles;

  BotonesAnimados({
    required this.onMostrarAves,
    required this.onMostrarArboles,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Botón para mostrar aves
        ElasticIn(
  delay: Duration(milliseconds: 300),
  child: ElevatedButton.icon(
    onPressed: onMostrarAves, // Asegúrate de que esté definido
    icon: ImageIcon(
      AssetImage("assets/ave.ico"), // Uso correcto de AssetImage
    ),
    label: Text('Aves'),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue, // Color del botón
    ),
  ),
),

        // Botón para mostrar árboles
        ElasticIn(
          delay: Duration(milliseconds: 500),
          child: ElevatedButton.icon(
            onPressed: onMostrarArboles,
            icon: Icon(Icons.nature), // Icono de árbol
            label: Text('Árboles'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Color del botón
            ),
          ),
        ),
      ],
    );
  }
}
