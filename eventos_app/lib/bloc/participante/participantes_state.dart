part of 'participantes_bloc.dart';

import 'package:eventos_app/models/ParticipanteModelo.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ParticipantesState {}

class ParticipantesInitialState extends ParticipantesState {}

class ParticipantesLoadingState extends ParticipantesState {}

class ParticipantesLoadedState extends ParticipantesState {
  List<ParticipanteModelo> participantesList;
  ParticipantesLoadedState(this.participantesList);
}

class ParticipantesError extends ParticipantesState {
  Error e;
  ParticipantesError(this.e);
}