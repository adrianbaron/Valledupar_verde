import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:valledupar_verde_app/src/Base/features/data/offline/datos_barrios.dart';
import 'package:valledupar_verde_app/src/Base/features/views/home/common/widgets/botones%20anidados.dart';
import 'package:valledupar_verde_app/src/Base/features/views/home/common/widgets/card.dart';
import 'package:valledupar_verde_app/src/Base/features/views/home/common/widgets/carrusel.dart';



// Función para crear los polígonos de los barrios
List<Polygon> crearPoligonos() {
  return barrios.values.map((barrio) {
    return Polygon(
      points: barrio.puntos,
      color: barrio.color,
      isFilled: true,
      borderColor: Colors.green,
      borderStrokeWidth: 1,
    );
  }).toList();
}

class MapPage extends StatefulWidget {
  static const String routeName = '/map';
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController mapController = MapController();
  bool isSearchVisible = false;
  TextEditingController searchController = TextEditingController();
  String? barrioSeleccionado; // Para almacenar el barrio seleccionado

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        Position position = await Geolocator.getCurrentPosition();
        LatLng currentLatLng = LatLng(position.latitude, position.longitude);
        mapController.move(currentLatLng, 15.0);
        verificarSiEstaEnBarrio(currentLatLng);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al obtener la ubicación')),
      );
    }
  }

  // Función para verificar si el usuario está sobre un barrio
  void verificarSiEstaEnBarrio(LatLng currentLatLng) {
    for (var entry in barrios.entries) {
      if (puntoEstaEnPoligono(currentLatLng, entry.value.puntos)) {
        setState(() {
          barrioSeleccionado = entry.key; // Almacena el nombre del barrio
        });
        return;
      }
    }
    setState(() {
      barrioSeleccionado = null; // Si no está sobre ningún barrio
    });
  }

  // Algoritmo para verificar si un punto está dentro de un polígono
  bool puntoEstaEnPoligono(LatLng punto, List<LatLng> poligono) {
    int i, j = poligono.length - 1;
    bool dentro = false;
    for (i = 0; i < poligono.length; i++) {
      if (poligono[i].longitude < punto.longitude &&
          poligono[j].longitude >= punto.longitude ||
          poligono[j].longitude < punto.longitude &&
              poligono[i].longitude >= punto.longitude) {
        if (poligono[i].latitude +
                (punto.longitude - poligono[i].longitude) /
                    (poligono[j].longitude - poligono[i].longitude) *
                    (poligono[j].latitude - poligono[i].latitude) <
            punto.latitude) {
          dentro = !dentro;
        }
      }
      j = i;
    }
    return dentro;
  }

  // Modificar para usar TapPosition y LatLng
  void _onTap(TapPosition tapPosition, LatLng latlng) {
    for (var entry in barrios.entries) {
      if (puntoEstaEnPoligono(latlng, entry.value.puntos)) {
        setState(() {
          barrioSeleccionado = entry.key; // Almacena el nombre del barrio
        });
        return;
      }
    }
    setState(() {
      barrioSeleccionado = null; // Si no está sobre ningún barrio
    });
  }

void mostrarCarruselAves() {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          height: 500, // Altura fija para el carrusel
          child: CarruselAnimado(
            items: barrios[barrioSeleccionado]!.aves.map((ave) {
              return InfoItem(
                nombreComun: ave.nombreComun,
                nombreCientifico: ave.nombreCientifico,
                descripcion: ave.descripcion,
                imagen: ave.imagen, // URL de la imagen del ave
              );
            }).toList(), // Convertimos las aves a la lista de InfoItem
            titulo: 'Aves del Barrio ${barrioSeleccionado}',
            
            color: Colors.blue.withOpacity(0.5),
          ),
        ),
      );
    },
  );
}

void mostrarCarruselArboles() {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          height: 500, // Altura fija para el carrusel
          child: CarruselAnimado(
            items: barrios[barrioSeleccionado]!.arboles.map((arbol) {
              return InfoItem(
                nombreComun: arbol.nombreComun,
                nombreCientifico: arbol.nombreCientifico,
                descripcion: arbol.descripcion,
                imagen: arbol.imagen, // URL de la imagen del árbol
              );
            }).toList(), // Convertimos los árboles a la lista de InfoItem
            titulo: 'Árboles del Barrio ${barrioSeleccionado}',
            color: barrios[barrioSeleccionado]!.color,
          ),
        ),
      );
    },
  );
}


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isSearchVisible
            ? const Text('Mapa de Valledupar')
            : FadeIn(
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Buscar ubicación...',
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isSearchVisible ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                isSearchVisible = !isSearchVisible;
                if (!isSearchVisible) {
                  searchController.clear();
                }
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: const LatLng(10.4631, -73.2532),
              initialZoom: 13.0,
              onTap: _onTap,  // Detectar el tap en el mapa
            ),
            children: [
              //animaciones de entrada y salida del mapa
              ElasticInDown(
                delay: const Duration(seconds: 1),
                child: TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
              ),
              //animaciones de entrada y salida de los polígonos
              ElasticInUp(
                delay: const Duration(seconds: 2),
                child: PolygonLayer(
                  polygons: crearPoligonos(), // Usa los polígonos creados
                ),
              ),
            ],
          ),
          if (barrioSeleccionado != null)
  Positioned(
    bottom: 16,
    left: 16,
    right: 16,
    child: Column(
      children: [
        BarrioInfoCard(
          nombre: barrios[barrioSeleccionado]!.nombre,
          descripcion: barrios[barrioSeleccionado]!.descripcion,
          color: barrios[barrioSeleccionado]!.color,
         
        ),
        const SizedBox(height: 16), // Espacio entre la tarjeta y los botones
        BotonesAnimados(
          onMostrarAves: mostrarCarruselAves,  // Pasa la función para mostrar aves
          onMostrarArboles: mostrarCarruselArboles,  // Pasa la función para mostrar árboles
        ),
      ],
    ),
  ),
  


        ],
        
      ),
      // Agrega el botón flotante
    /* floatingActionButton: FloatingActionButton(
      onPressed: getCurrentLocation, // Llama a la función que obtiene la ubicación
      child: const Icon(Icons.my_location), // Icono de ubicación
      backgroundColor: Colors.blue,
    ) */
    );
    
  }
}