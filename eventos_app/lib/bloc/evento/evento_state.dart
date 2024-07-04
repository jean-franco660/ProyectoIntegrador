part of 'empresa_bloc.dart';

import 'package:eventos_app/models/EventoModelo.dart';
import 'package:meta/meta.dart';

@Immutable()
abstract class EventoState {}

class EventoInitialState extends EventoState {}

class EventoLoadingState extends EventoState {}

class EventoLoadedState extends EventoState {
  List<EventoModelo> EventoList;

  EventoLoadedState(this.EventoList);
}

class EventoError extends EventoState {
  Error e;

  EventoError(this.e);
}