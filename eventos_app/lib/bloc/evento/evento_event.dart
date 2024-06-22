part of 'empresa_bloc.dart';

@immutable
abstract class EventoEvent {}

class ListarEventoEvent extends EventoEvent {
  ListarEventoEvent() {
    print("Evento si");
  }
//ListarEmpresaEvent({required EmpresaModelo empresa}):super(empresa:empresa);
}

class DeleteEmpresaEvent extends EventoEvent {
  EventoModelo evento;

  DeleteEmpresaEvent(this.evento);
//DeleteEmpresaEvent({required EmpresaModelo empresa}):super(empresa:empresa);
}

class UpdateEmpresaEvent extends EventoEvent {
  EventoModelo evento;

  UpdateEmpresaEvent(this.evento);
//UpdateEmpresaEvent({required EmpresaaModelo empresa}):super(empresa:empresa);
}

class CreateEmpresaEvent extends EventoEvent {
  EventoModelo evento;

  CreateEmpresaEvent(this.evento);
//CreateEmpresaEvent({required EmpresaModelo empresa}):super(empresa:empresa);
}