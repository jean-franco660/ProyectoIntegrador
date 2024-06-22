import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
@Entity(tableName: "Participante")
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

// EspeciexRModelo adaptado a ParticipantexRModelo
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
