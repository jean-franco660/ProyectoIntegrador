import 'package:dio/dio.dart';
import 'package:eventos_app/models/ParticipanteModelo.dart';
import 'package:eventos_app/util/UrlApi.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'participante_api.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class ParticipanteApi {
  factory ParticipanteApi(Dio dio, {String baseUrl}) = _ParticipanteApi;

  static ParticipanteApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ParticipanteApi(dio);
  }

  @GET("/asis/participante/list")
  Future<List<ParticipanteModelo>> getParticipantes(@Header("Authorization") String token);

  @POST("/asis/participante/crear")
  Future<ParticipanteModelo> createParticipante(
      @Header("Authorization") String token, @Body() ParticipanteModelo participante);

  @GET("/asis/participante/buscar/{id}")
  Future<ParticipanteModelo> findParticipante(
      @Header("Authorization") String token, @Path("id") int id);

  @DELETE("/asis/participante/eliminar/{id}")
  Future<ParticipanteModelo> deleteParticipante(
      @Header("Authorization") String token, @Path("id") int id);

  @PUT("/asis/participante/editar/{id}")
  Future<ParticipanteModelo> updateParticipante(
      @Header("Authorization") String token, @Path("id") int id, @Body() ParticipanteModelo participante);
}
