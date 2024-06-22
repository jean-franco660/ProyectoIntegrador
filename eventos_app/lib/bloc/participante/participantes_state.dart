part of 'participantes_bloc.dart';

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