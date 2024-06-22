part of 'participante_bloc.dart';

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