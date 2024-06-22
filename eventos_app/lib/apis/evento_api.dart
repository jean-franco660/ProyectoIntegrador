import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'evento_spi.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class EventoApi {
  factory EventoApi(Dio dio, {String baseUrl}) = _EventoApi;

  static EventoApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return EventoApi(dio);
  }


@GET("/asis/eveto/list")
Future<List<EventoModelo>> getEvento(@Header("Authorization") String token, @Body() EventoModelo evento);

@POST("/asis/eveto/crear")
Future<EventoModelo> findEvento(
  @Header("Authorization") String token, @Path("id") int id);

@GET("/asis/eveto/buscar/{id}")
Future<EventoModelo> findEvento(
  @Header("Authorization") String token, @Path{"id"} int id);

@DELETE("/asis/eveto/eliminar/{id}")
Future<EventoModelo> findEvento(
  @Header("Authorization") String token, @Path("id") int id);

@PUT("/asis/eveto/editar/{id}")
Future<EventoModelo> updateEvento(
  @Header("Autorization") String token,@Path("id") int id);

}