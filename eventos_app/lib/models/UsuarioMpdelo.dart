import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UsuarioModelo {
  UsuarioModelo({
    required this.nombres,
    required this.apellidos,
    required this.correo,
    required this.password,
  });

  UsuarioModelo.login(this.correo, this.password)
      : nombres = "",
        apellidos = "";

  UsuarioModelo.loginDos(this.correo, this.password)
      : nombres = "",
        apellidos = "";

  late final String nombres;
  late final String apellidos;
  late final String correo;
  late final String password;

  factory UsuarioModelo.fromJson(Map<String, dynamic> json) {
    return UsuarioModelo(
      nombres: json['nombres'],
      apellidos: json['apellidos'],
      correo: json['correo'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nombres'] = nombres;
    _data['apellidos'] = apellidos;
    _data['correo'] = correo;
    _data['password'] = password;
    return _data;
  }
}

class RespUsuarioModelo {
  RespUsuarioModelo({
    required this.id,
    required this.nombres,
    required this.apellidos,
    required this.correo,
  });

  late final int id;
  late final String nombres;
  late final String apellidos;
  late final String correo;
  late final String token;
  late final String dni;
  late final String perfilPrin;
  late final String estado;
  late final String offlinex;

  factory RespUsuarioModelo.fromJson(Map<String, dynamic> json) {
    return RespUsuarioModelo(
      id: json['id'],
      nombres: json['nombres'],
      apellidos: json['apellidos'],
      correo: json['correo'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nombres'] = nombres;
    _data['apellidos'] = apellidos;
    _data['correo'] = correo;
    return _data;
  }
}