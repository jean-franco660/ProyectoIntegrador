import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

@immutable
class ParticipanteModelo {
  @primaryKey
  late int id = 0;
  @ColumnInfo(name: "nombre")
  late final String nombre;
  @ColumnInfo(name: "apellido")
  late final String apellido;
  @ColumnInfo(name: "edad")
  late final int edad;
  @ColumnInfo(name: "correo")
  late final String correo;
  @ColumnInfo(name: "fecha_registro")
  late final DateTime fechaRegistro;

  ParticipanteModelo({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.edad,
    required this.correo,
    required this.fechaRegistro,
  });

  ParticipanteModelo.unlaunched();

  factory ParticipanteModelo.fromJson(Map<String, dynamic> json) => _$ParticipanteModeloFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipanteModeloToJson(this);
}

class ParticipantexRModelo {
  late int id = 0;
  late final String nombre;
  late final String apellido;
  late final int edad;
  late final String correo;
  late final DateTime fechaRegistro;

  ParticipantexRModelo({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.edad,
    required this.correo,
    required this.fechaRegistro,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nombre'] = nombre;
    data['apellido'] = apellido;
    data['edad'] = edad;
    data['correo'] = correo;
    data['fecha_registro'] = fechaRegistro;

    return data;
  }
}

@immutable
class ParticipanteModeloFire {
  late String id;
  late final String nombre;
  late final String apellido;
  late final int edad;
  late final String correo;
  late final String fechaRegistro; // Assuming this is a String for Firebase compatibility

  ParticipanteModeloFire({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.edad,
    required this.correo,
    required this.fechaRegistro,
  });

  ParticipanteModeloFire.unlaunched();

  ParticipanteModeloFire.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    nombre = json['nombre'];
    apellido = json['apellido'];
    edad = json['edad'];
    correo = json['correo'];
    fechaRegistro = json['fecha_registro'];
  }

  factory ParticipanteModeloFire.fromJsonModelo(Map<String, dynamic> json) {
    return ParticipanteModeloFire(
      id: json['id'] ?? "",
      nombre: json['nombre'],
      apellido: json['apellido'],
      edad: json['edad'],
      correo: json['correo'],
      fechaRegistro: json['fecha_registro'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombre'] = nombre;
    _data['apellido'] = apellido;
    _data['edad'] = edad;
    _data['correo'] = correo;
    _data['fecha_registro'] = fechaRegistro;
    return _data;
  }

  Map<String, dynamic> toMap() {
    var data = <String, dynamic>{};
    data['id'] = id;
    data['nombre'] = nombre;
    data['apellido'] = apellido;
    data['edad'] = edad;
    data['correo'] = correo;
    data['fecha_registro'] = fechaRegistro;
    return data;
  }
}
