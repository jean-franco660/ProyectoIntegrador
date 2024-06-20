part of 'actividad_bloc.dart';

//ignore: must_be_immutable
@immutable
abstract class ActividadEvent {}

class ListarActividadEvent extends ActividadEvent {
  ListarActividadEvent() {
    print("Evento si");
  }
}

class DeleteActividadEvent extends ActividadEvent {
  final ActividadModelo actividad;

  DeleteActividadEvent(this.actividad);
}

class UpdateActividadEvent extends ActividadEvent {
  final ActividadModelo actividad;

  UpdateActividadEvent(this.actividad);
}

class CreateActividadEvent extends ActividadEvent {
  final ActividadModelo actividad;

  CreateActividadEvent(this.actividad);
}
