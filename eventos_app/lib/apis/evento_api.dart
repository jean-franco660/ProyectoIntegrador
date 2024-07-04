import 'package:dio/dio.dart';
import 'package:eventos_app/util/UrlApi.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:eventos_app/models/EventoModelo.dart';
import 'package:eventos_app/models/GenericModelo.dart';

part 'evento_api.g.dart';

@RestApi(baseUrl: 'https://yourapi.url/')
abstract class EventoApi {
  factory EventoApi(Dio dio, {String baseUrl}) = _EventoApi;

  static EventoApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return EventoApi(dio);
  }

  @GET("/asis/evento/list")
  Future<List<EventoModelo>> getEvento(
    @Header("Authorization") String token,
  );

  @POST("/asis/evento/crear")
  Future<EventoModelo> createEvento(
    @Header("Authorization") String token,
    @Body() EventoModelo evento,
  );

  @GET("/asis/evento/buscar/{id}")
  Future<EventoModelo> findEvento(
    @Header("Authorization") String token,
    @Path("id") int id,
  );

  @DELETE("/asis/evento/eliminar/{id}")
  Future<GenericModelo> deleteEvento(
    @Header("Authorization") String token,
    @Path("id") int id,
  );

  @PUT("/asis/evento/editar/{id}")
  Future<EventoModelo> updateEvento(
    @Header("Authorization") String token,
    @Path("id") int id,
    @Body() EventoModelo evento,
  );
}
