import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BarrioInfo {
  final String nombre;
  final String descripcion;
  final List<GeoPoint> puntos;
  final Color color;
  final List<String> imagenesAves;
  final List<String> imagenesArboles;

  BarrioInfo({
    required this.nombre,
    required this.descripcion,
    required this.puntos,
    this.color = Colors.blue,
    required this.imagenesAves,
    required this.imagenesArboles,
  });
}

class MapPages extends StatefulWidget {
  static const String routeName = '/onboarding_screem_dos';
  const MapPages({super.key});

  @override
  State<MapPages> createState() => _MapPageState();
}

class _MapPageState extends State<MapPages> {
  static const double valleduparLat = 10.474245;
  static const double valleduparLon = -73.243633;
  final TextEditingController _searchController = TextEditingController();
  BarrioInfo? barrioSeleccionado;
  bool mostrarCard = false;
  bool mostrarBotones = true;

  final Map<String, BarrioInfo> barrios = {
    'panama': BarrioInfo(
      nombre: 'Barrio Panamá',
      descripcion: 'Barrio histórico de Valledupar, conocido por su arquitectura tradicional y ubicación céntrica.',
      puntos: [
        GeoPoint(latitude: 10.478684193009514, longitude: -73.27826692696355),
        GeoPoint(latitude: 10.479360963376621, longitude: -73.2768166873887),
        GeoPoint(latitude: 10.479892710485728, longitude: -73.275833474118),
        GeoPoint(latitude: 10.481197904062682, longitude: -73.27229390634203),
        GeoPoint(latitude: 10.48175381817542, longitude: -73.27273635231379),
        GeoPoint(latitude: 10.488932271623057, longitude: -73.27214642435133),
        GeoPoint(latitude: 10.486877849086724, longitude: -73.28040541582813),
        GeoPoint(latitude: 10.478684193009514, longitude: -73.27826692696355),
      ],
      color: Colors.red.withOpacity(0.5),
      imagenesAves: [
        'https://example.com/ave1.jpg',
        'https://example.com/ave2.jpg',
        'https://example.com/ave3.jpg',
      ],
      imagenesArboles: [
        'https://example.com/arbol1.jpg',
        'https://example.com/arbol2.jpg',
        'https://example.com/arbol3.jpg',
      ],
    ),
    'las_flores': BarrioInfo(
      nombre: 'Barrio las flores',
      descripcion: 'Barrio residencial de Valledupar, conocido por sus amplias áreas verdes.',
      puntos: [
        GeoPoint(latitude: 10.468954281873494, longitude: -73.25689096513787),
        GeoPoint(latitude: 10.475308522973634, longitude: -73.25925811861208),
        GeoPoint(latitude: 10.474514369849771, longitude: -73.2641623053819),
        GeoPoint(latitude: 10.473152919680274, longitude: -73.26831592855348),
        GeoPoint(latitude: 10.470316396634658, longitude: -73.26721951016421),
        GeoPoint(latitude: 10.46867110191721, longitude: -73.26710385823878),
        GeoPoint(latitude: 10.466685397613219, longitude: -73.26641136559448),
        GeoPoint(latitude: 10.464586146515543, longitude: -73.26623806517856),
        GeoPoint(latitude: 10.468954281873494, longitude: -73.25689096513787),
      ],
      color: Colors.green.withOpacity(0.5),
      imagenesAves: [
        'https://images.unsplash.com/photo-1534532924949-2253cff0f267?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://plus.unsplash.com/premium_photo-1667573535846-a4670d4810e9?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://plus.unsplash.com/premium_photo-1667685540549-576658d923b2?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ],
      imagenesArboles: [
        'https://plus.unsplash.com/premium_photo-1675827055620-24d540e0892a?q=80&w=1944&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1463097366893-15ebd10df5ff?q=80&w=1931&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1605472446339-2e98a2e7912e?q=80&w=1970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ],
    ),
  };

  MapController controller = MapController(
    initPosition: GeoPoint(
      latitude: valleduparLat,
      longitude: valleduparLon,
    ),
    areaLimit: BoundingBox(
      east: -73.0,
      north: 10.7,
      south: 10.2,
      west: -73.5,
    ),
  );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dibujarBarrios();
    });
  }

 void mostrarCarruselImagenes(List<String> imagenes, String titulo) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(titulo),
        content: SizedBox(
          height: 300,
          width: double.maxFinite,
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 16/9,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              initialPage: 0,
              autoPlay: false,
            ),
            items: imagenes.map((imagen) {
              return Builder(
                builder: (BuildContext context) {
                  return AnimatedBuilder(
                    animation: ModalRoute.of(context)!.animation!,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: Curves.easeInOut.transform(ModalRoute.of(context)!.animation!.value),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              imagen,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(child: Text('Error al cargar la imagen'));
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cerrar"),
          ),
        ],
      );
    },
  );
}
  Future<void> dibujarBarrios() async {
    try {
      for (var barrio in barrios.entries) {
        for (var punto in barrio.value.puntos) {
          await controller.addMarker(
            GeoPoint(latitude: punto.latitude, longitude: punto.longitude),
            markerIcon: MarkerIcon(
              icon: Icon(
                Icons.circle,
                color: barrio.value.color,
                size: 12,
              ),
            ),
          );
        }
      }

      controller.listenerMapSingleTapping.addListener(() {
        if (controller.listenerMapSingleTapping.value != null) {
          verificarBarrioSeleccionado(controller.listenerMapSingleTapping.value!);
        }
      });
    } catch (e) {
      debugPrint('Error al dibujar barrios: $e');
    }
  }

  Future<void> verificarBarrioSeleccionado(GeoPoint punto) async {
    for (var barrio in barrios.entries) {
      if (estaPuntoEnPoligono(punto, barrio.value.puntos)) {
        setState(() {
          barrioSeleccionado = barrio.value;
          mostrarCard = true;
          mostrarBotones = false;
        });
        return;
      }
    }
    setState(() {
      mostrarCard = false;
      mostrarBotones = true;
    });
  }

  bool estaPuntoEnPoligono(GeoPoint punto, List<GeoPoint> vertices) {
    var dentro = false;
    var j = vertices.length - 1;
    
    for (var i = 0; i < vertices.length; i++) {
      if (((vertices[i].latitude > punto.latitude) != 
          (vertices[j].latitude > punto.latitude)) &&
          (punto.longitude < (vertices[j].longitude - vertices[i].longitude) * 
          (punto.latitude - vertices[i].latitude) / 
          (vertices[j].latitude - vertices[i].latitude) + vertices[i].longitude)) {
        dentro = !dentro;
      }
      j = i;
    }
    
    return dentro;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                mostrarCard = false;
                mostrarBotones = true;
              });
            },
            child: OSMFlutter(
              controller: controller,
              onMapIsReady: (isReady) {
                if (isReady) {
                  dibujarBarrios();
                }
              },
              osmOption: OSMOption(
                userTrackingOption: const UserTrackingOption(
                  enableTracking: false,
                  unFollowUser: true,
                ),
                zoomOption: const ZoomOption(
                  initZoom: 15,
                  minZoomLevel: 3,
                  maxZoomLevel: 19,
                  stepZoom: 1.0,
                ),
                userLocationMarker: UserLocationMaker(
                  personMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.location_history_rounded,
                      color: Colors.red,
                      size: 48,
                    ),
                  ),
                  directionArrowMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.double_arrow,
                      size: 48,
                    ),
                  ),
                ),
                roadConfiguration: const RoadOption(
                  roadColor: Colors.yellowAccent,
                ),
                staticPoints: [
                  StaticPositionGeoPoint(
                    "valledupar-center",
                    const MarkerIcon(
                      icon: Icon(
                        Icons.person_pin_circle,
                        color: Colors.blue,
                        size: 56,
                      ),
                    ),
                    [GeoPoint(latitude: valleduparLat, longitude: valleduparLon)],
                  ),
                ],
              ),
            ),
          ),
          if (mostrarCard && barrioSeleccionado != null)
            Positioned(
              bottom: 90,
              left: 16,
              right: 16,
              child: FadeInUp(
                duration: const Duration(milliseconds: 500),
                child: Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          barrioSeleccionado!.nombre,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          barrioSeleccionado!.descripcion,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () => mostrarCarruselImagenes(
                                barrioSeleccionado!.imagenesAves,
                                "Aves en ${barrioSeleccionado!.nombre}",
                              ),
                              icon: const Icon(Icons.pets),
                              label: const Text("Aves"),
                            ),
                            ElevatedButton.icon(
                              onPressed: () => mostrarCarruselImagenes(
                                barrioSeleccionado!.imagenesArboles,
                                "Árboles en ${barrioSeleccionado!.nombre}",
                              ),
                              icon: const Icon(Icons.nature),
                              label: const Text("Árboles"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: FadeInDown(
              duration: const Duration(milliseconds: 500),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Buscar lugar...',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        // Implement search logic here
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (mostrarBotones)
            Positioned(
              right: 16,
              bottom: 100,
              child: Column(
                children: [
                  FadeInRight(
                    duration: const Duration(milliseconds: 500),
                    child: FloatingActionButton(
                      heroTag: "zoomIn",
                      onPressed: () {
                        controller.zoomIn();
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FadeInRight(
                    duration: const Duration(milliseconds: 500),
                    delay: const Duration(milliseconds: 200),
                    child: FloatingActionButton(
                      heroTag: "zoomOut",
                      onPressed: () {
                        controller.zoomOut();
                      },
                      child: const Icon(Icons.remove),
                    ),
                  ),
                ],
              ),
            ),
          if (mostrarBotones)
            Positioned(
              bottom: 16,
              right: 16,
              child: FadeInUp(
                duration: const Duration(milliseconds: 500),
                child: FloatingActionButton(
                  heroTag: "currentLocation",
                  onPressed: () async {
                    try {
                      await controller.currentLocation();
                      await controller.enableTracking();
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Error al obtener la ubicación. Verifica los permisos de ubicación.'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    }
                  },
                  child: const Icon(Icons.my_location),
                ),
              ),
            ),
        ],
      ),
    );
  }
}