part of 'empresa_bloc.dart';

@Immutable
abstract class EventoState {}

class EventoInitialState extends EventoState {}

class EventoLoadingState extends EventoState {}

class EventoLoadedState extends EventoState {
  List<evento> EventoList;

  EventoLoadedState(this.EventoList);
}

class EventoError extends EventoState {
  Error e;

  EventoError(this.e);
}