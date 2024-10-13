import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

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
      const LatLng(10.478684193009514, -73.27826692696355),
      const LatLng(10.479360963376621, -73.2768166873887),
      const LatLng(10.479892710485728, -73.275833474118),
      const LatLng(10.481197904062682, -73.27229390634203),
      const LatLng(10.48175381817542, -73.27273635231379),
      const LatLng(10.488932271623057, -73.27214642435133),
      const LatLng(10.486877849086724, -73.28040541582813),
      const LatLng(10.478684193009514, -73.27826692696355),
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
      const LatLng(10.468954281873494, -73.25689096513787),
      const LatLng(10.475308522973634, -73.25925811861208),
      const LatLng(10.474514369849771, -73.2641623053819),
      const LatLng(10.473152919680274, -73.26831592855348),
      const LatLng(10.470316396634658, -73.26721951016421),
      const LatLng(10.46867110191721, -73.26710385823878),
      const LatLng(10.466685397613219, -73.26641136559448),
      const LatLng(10.464586146515543, -73.26623806517856),
      const LatLng(10.468954281873494, -73.25689096513787),
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
