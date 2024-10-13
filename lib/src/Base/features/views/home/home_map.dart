import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:geolocator/geolocator.dart';
import 'package:valledupar_verde_app/src/Base/features/views/home/common/widgets/botones%20anidados.dart';
import 'package:valledupar_verde_app/src/Base/features/views/home/common/widgets/card.dart';
import 'package:valledupar_verde_app/src/Base/features/views/home/common/widgets/carrusel.dart';

class AveInfo {
  final String nombreComun;
  final String nombreCientifico;
  final String descripcion;
  final String imagen;

  AveInfo({
    required this.nombreComun,
    required this.nombreCientifico,
    required this.descripcion,
    required this.imagen,
  });
}

class ArbolInfo {
  final String nombreComun;
  final String nombreCientifico;
  final String descripcion;
  final String imagen;

  ArbolInfo({
    required this.nombreComun,
    required this.nombreCientifico,
    required this.descripcion,
    required this.imagen,
  });
}

class BarrioInfo {
  final String nombre;
  final String descripcion;
  final List<LatLng> puntos;
  final Color color;
  final List<AveInfo> aves;
  final List<ArbolInfo> arboles;

  BarrioInfo({
    required this.nombre,
    required this.descripcion,
    required this.puntos,
    required this.color,
    required this.aves,
    required this.arboles,
  });
}



final Map<String, BarrioInfo> barrios = {
  'Panama': BarrioInfo(
    nombre: 'Barrio Panamá',
    descripcion: 'Barrio histórico de Valledupar, conocido por su arquitectura tradicional y ubicación céntrica.',
    puntos: [
      LatLng(10.478684193009514, -73.27826692696355),
      LatLng(10.479360963376621, -73.2768166873887),
      LatLng(10.479892710485728, -73.275833474118),
      LatLng(10.481197904062682, -73.27229390634203),
      LatLng(10.48175381817542, -73.27273635231379),
      LatLng(10.488932271623057, -73.27214642435133),
      LatLng(10.486877849086724, -73.28040541582813),
      LatLng(10.478684193009514, -73.27826692696355),
    ],
    color: Colors.red.withOpacity(0.5),
    aves: [
      AveInfo(
        nombreComun: 'Gavilán Blanco',
        nombreCientifico: 'Elanus leucurus',
        descripcion: 'Ave rapaz de color blanco con ojos rojos, frecuente en zonas abiertas.',
        imagen: 'https://images.unsplash.com/photo-1568243118258-f9066e046ecd?q=80&w=1426&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      AveInfo(
        nombreComun: 'Carpintero Real',
        nombreCientifico: 'Melanerpes rubricapillus',
        descripcion: 'Ave pequeña de cabeza roja y cuerpo negro con blanco. Común en áreas urbanas.',
        imagen: 'https://images.unsplash.com/photo-1486365227551-f3f90034a57c?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
    ],
    arboles: [
      ArbolInfo(
        nombreComun: 'Ceiba',
        nombreCientifico: 'Ceiba pentandra',
        descripcion: 'Árbol de gran tamaño, símbolo cultural en muchas regiones tropicales.',
        imagen: 'https://images.unsplash.com/photo-1686526894310-ddcc5773cf65?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      ArbolInfo(
        nombreComun: 'Guayacán',
        nombreCientifico: 'Tabebuia chrysantha',
        descripcion: 'Árbol de flores amarillas, muy apreciado por su madera y valor ornamental.',
        imagen: 'https://images.unsplash.com/photo-1502082553048-f009c37129b9?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
    ],
  ),
  'las Flores': BarrioInfo(
    nombre: 'Barrio las flores',
    descripcion: 'Barrio residencial de Valledupar, conocido por sus amplias áreas verdes.',
    puntos: [
      LatLng(10.468954281873494, -73.25689096513787),
      LatLng(10.475308522973634, -73.25925811861208),
      LatLng(10.474514369849771, -73.2641623053819),
      LatLng(10.473152919680274, -73.26831592855348),
      LatLng(10.470316396634658, -73.26721951016421),
      LatLng(10.46867110191721, -73.26710385823878),
      LatLng(10.466685397613219, -73.26641136559448),
      LatLng(10.464586146515543, -73.26623806517856),
      LatLng(10.468954281873494, -73.25689096513787),
    ],
    color: Colors.green.withOpacity(0.5),
    aves: [
      AveInfo(
        nombreComun: 'Rey de los Vencejos',
        nombreCientifico: 'Cypseloides lemosi',
        descripcion: 'Especie que vuela en bandadas y se observa a gran altura.',
        imagen: 'https://images.unsplash.com/photo-1480044965905-02098d419e96?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      AveInfo(
        nombreComun: 'Rey Guajiro',
        nombreCientifico: 'Cypseloidr Guajiruy',
        descripcion: 'Especie de color rojo y blanco, común en zonas abiertas.',
        imagen: 'https://images.unsplash.com/photo-1520808663317-647b476a81b9?q=80&w=1473&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
    ],
    arboles: [
      ArbolInfo(
        nombreComun: 'Saman',
        nombreCientifico: 'Samanea saman',
        descripcion: 'Árbol majestuoso de gran sombra, común en parques y plazas.',
        imagen: 'https://images.unsplash.com/photo-1444492696363-332accfd40c0?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
    ],
  ),
};


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
              initialCenter: LatLng(10.4631, -73.2532),
              initialZoom: 13.0,
              onTap: _onTap,  // Detectar el tap en el mapa
            ),
            children: [
              FadeIn(
                delay: const Duration(seconds: 1),
                child: TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
              ),
              FadeIn(
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