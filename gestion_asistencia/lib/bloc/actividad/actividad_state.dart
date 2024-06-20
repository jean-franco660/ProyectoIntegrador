part of 'actividad_bloc.dart';

@immutable
abstract class ActividadState {}

class ActividadInitialState extends ActividadState {}

class ActividadLoadingState extends ActividadState {}

class ActividadLoadedState extends ActividadState {
  final List<ActividadModelo> actividades;

  ActividadLoadedState(this.actividades);
}

class ActividadError extends ActividadState {
  final Error error;

  ActividadError(this.error);
}
