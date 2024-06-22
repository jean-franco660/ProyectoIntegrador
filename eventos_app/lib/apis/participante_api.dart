import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'evento_spi.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class ParticipanteApi {
  factory ParticipanteApi(Dio dio, {String baseUrl}) = _ParticipanteApi;

  static ParticipanteApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ParticipanteApi(dio);
  }


@GET("/asis/participante/list")
Future<List<ParticipanteModelo>> getEvento(@Header("Authorization") String token, @Body() EventoModelo evento);

@POST("/asis/participante/crear")
Future<ParticipanteModelo> findParticipante(
  @Header("Authorization") String token, @Path("id") int id);

@GET("/asis/participante/buscar/{id}")
Future<ParticipanteModelo> findParticipante(
  @Header("Authorization") String token, @Path{"id"} int id);

@DELETE("/asis/participante/eliminar/{id}")
Future<ParticipanteModelo> findParticipante(
  @Header("Authorization") String token, @Path("id") int id);

@PUT("/asis/participante/editar/{id}")
Future<ParticipanteModelo> updateParticipante(
  @Header("Autorization") String token,@Path("id") int id);

}