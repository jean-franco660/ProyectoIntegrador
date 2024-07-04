import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class DireccionModelo {
  @JsonKey(name: 'calle')
  String calle;

  @JsonKey(name: 'ciudad')
  String ciudad;

  DireccionModelo({
    required this.calle,
    required this.ciudad,
  });

  factory DireccionModelo.fromJson(Map<String, dynamic> json) => _$DireccionModeloFromJson(json);

  Map<String, dynamic> toJson() => _$DireccionModeloToJson(this);
}
