import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'usuario_api.g.dart';

@RestApi(baseUrl: UrlApi.urlApix)
abstract class UsuarioApi {
  factory UsuarioApi(Dio dio, {String baseUrl}) = _UsuarioApi;

  static UsuarioApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return UsuarioApi(dio);
  }

  @POST("/asis/login") //davidmpx@upeu.edu.pe //D123456
  Future<RespUsuarioModelo> login(@Body() UsuarioModelo usuario);
}