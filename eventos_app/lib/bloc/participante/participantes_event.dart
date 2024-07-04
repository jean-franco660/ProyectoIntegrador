part of 'participante_bloc.dart';

import 'package:eventos_app/models/ParticipanteModelo.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ParticipanteEvent {}

class ListarParticipanteEvent extends ParticipanteEvent {
  ListarParticipanteEvent() {
    print("Evento si");
  }
}

class DeleteParticipanteEvent extends ParticipanteEvent {
  ParticipanteModelo participante;
  DeleteParticipanteEvent(this.participante);
}

class UpdateParticipanteEvent extends ParticipanteEvent {
  ParticipanteModelo participante;
  UpdateParticipanteEvent(this.participante);
}

class CreateParticipanteEvent extends ParticipanteEvent {
  ParticipanteModelo participante;
  CreateParticipanteEvent(this.participante);
}