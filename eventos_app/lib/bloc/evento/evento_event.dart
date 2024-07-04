part of 'empresa_bloc.dart';

import 'package:eventos_app/models/EventoModelo.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class EventoEvent {}

class ListarEventoEvent extends EventoEvent {
  ListarEventoEvent() {
    print("Evento si");
  }
//ListarEmpresaEvent({required EmpresaModelo empresa}):super(empresa:empresa);
}

class DeleteEventoEvent extends EventoEvent {
  EventoModelo evento;

  DeleteEventoEvent(this.evento);
//DeleteEmpresaEvent({required EmpresaModelo empresa}):super(empresa:empresa);
}

class UpdateEventoEvent extends EventoEvent {
  EventoModelo evento;

  UpdateEventoEvent(this.evento);
//UpdateEmpresaEvent({required EmpresaaModelo empresa}):super(empresa:empresa);
}

class CreateEventoEvent extends EventoEvent {
  EventoModelo evento;

  CreateEventoEvent(this.evento);
//CreateEmpresaEvent({required EmpresaModelo empresa}):super(empresa:empresa);
}