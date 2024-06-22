import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class EventoModelo {

  late int id=0;
  late final String nombre;
  late final String descripcion;
  late final String fechaInicio;
  late final String fechaFin;
  late final int fincaId;

  EventoModelo({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.fechaInicio,
    required this.fechaFin,
    required this.fincaId,
  });
  EventoModelo.unlaunched();

  factory EventoModelo.fromJson(Map<String, dynamic> json) => _$EventoModeloFromJson(json);

  Map<String, dynamic> toJson() => _$EventoModeloToJson(this);
}