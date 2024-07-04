import 'package:asistencia_app/apis/especie_api.dart';

import 'package:dio/dio.dart';
import 'package:eventos_app/apis/evento_api.dart';
import 'package:eventos_app/models/EventoModelo.dart';
import 'package:eventos_app/models/GenericModelo.dart';

class EsventoRepository {
  EventoApi? eventoApi;

  EsventoRepository() {
    Dio _dio = Dio();
    _dio.options.headers["Content-Type"] = "application/json";
    eventoApi = EsventoApi(_dio);
  }

  Future<List<EventoModelo>> getEvento() async {
    var dato =
        await eventoApi!.getEvento(TokenUtil.TOKEN).then((value) => value);
    return await dato;
  }

  Future<GenericModelo> deleteEvento(int id) async {
    return await eventoApi!.deleteEvento(TokenUtil.TOKEN, id);
  }

  Future<EventoModelo> updateEvento(int id, EventoModelo evento) async {
    return await eventoApi!.updateEvento(TokenUtil.TOKEN, id, evento);
  }

  Future<EventoModelo> createEvento(EventoModelo evento) async {
    return await eventoApi!.createEvento(TokenUtil.TOKEN, evento);
  }
}