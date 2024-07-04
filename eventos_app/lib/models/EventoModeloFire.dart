import 'package:flutter/material.dart';

@immutable
class EventoModeloFire {
  late String id;
  late final String nombre;
  late final String descripcion;
  late final String fechaInicio;
  late final String fechaFin;
  late final List<dynamic> participantes; // Assuming participantes can be dynamic or use specific type
  late final dynamic direccion; // Assuming direccion can be dynamic or use specific type

  EventoModeloFire({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.fechaInicio,
    required this.fechaFin,
    required this.participantes,
    required this.direccion,
  });

  EventoModeloFire.unlaunched();

  EventoModeloFire.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    fechaInicio = json['fechaInicio'];
    fechaFin = json['fechaFin'];
    participantes = json['participantes'];
    direccion = json['direccion'];
  }

  factory EventoModeloFire.fromJsonModelo(Map<String, dynamic> json) {
    return EventoModeloFire(
      id: json['id'] ?? "",
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      fechaInicio: json['fechaInicio'],
      fechaFin: json['fechaFin'],
      participantes: json['participantes'],
      direccion: json['direccion'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombre'] = nombre;
    _data['descripcion'] = descripcion;
    _data['fechaInicio'] = fechaInicio;
    _data['fechaFin'] = fechaFin;
    _data['participantes'] = participantes;
    _data['direccion'] = direccion;
    return _data;
  }

  Map<String, dynamic> toMap() {
    var data = <String, dynamic>{};
    data['id'] = id;
    data['nombre'] = nombre;
    data['descripcion'] = descripcion;
    data['fechaInicio'] = fechaInicio;
    data['fechaFin'] = fechaFin;
    data['participantes'] = participantes;
    data['direccion'] = direccion;
    return data;
  }
}
