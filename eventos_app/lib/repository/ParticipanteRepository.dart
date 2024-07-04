import 'package:asistencia_app/apis/especie_api.dart';

import 'package:dio/dio.dart';
import 'package:eventos_app/apis/participante_api.dart';
import 'package:eventos_app/models/EventoModelo.dart';
import 'package:eventos_app/models/GenericModelo.dart';

class Participanterepository {
  ParticipanteApi? paticipanteApi;

  Participanterepository() {
    Dio _dio = Dio();
    _dio.options.headers["Content-Type"] = "application/json";
    paticipanteApi = ParticipanteApi(_dio);
  }

  Future<List<EventoModelo>> getParticipante() async {
    var dato =
        await paticipanteApi!.getParticipante(TokenUtil.TOKEN).then((value) => value);
    return await dato;
  }

  Future<GenericModelo> deleteEvento(int id) async {
    return await paticipanteApi!.deleteParticipante(TokenUtil.TOKEN, id);
  }

  Future<EventoModelo> updateEvento(int id, EventoModelo evento) async {
    return await paticipanteApi!.updateParticipante(TokenUtil.TOKEN, id, evento);
  }

  Future<EventoModelo> createEvento(EventoModelo evento) async {
    return await paticipanteApi!.createParticipante(TokenUtil.TOKEN, evento);
  }
}