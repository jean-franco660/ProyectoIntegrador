import 'package:eventos_app/models/ParticipanteModelo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:eventos_app/models/DireccionModelo.dart';
import 'package:eventos_app/models/EventoModeloFire.dart';

part 'EventoModeloFire.dart';

@JsonSerializable()
class EventoModelo {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'nombre')
  String nombre;

  @JsonKey(name: 'descripcion')
  String descripcion;

  @JsonKey(name: 'fecha_inicio')
  String fechaInicio;

  @JsonKey(name: 'fecha_fin')
  String fechaFin;

  @JsonKey(name: 'participantes')
  List<ParticipanteModelo> participantes;

  @JsonKey(name: 'direccion')
  DireccionModelo direccion;

  EventoModelo({
    this.id,
    required this.nombre,
    required this.descripcion,
    required this.fechaInicio,
    required this.fechaFin,
    required this.participantes,
    required this.direccion,
  });

  static fromJson(Map<String, dynamic> i) {}


}