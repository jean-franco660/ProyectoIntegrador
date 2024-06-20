import 'package:gestion_asistencia/repository/ActividadRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:gestion_asistencia/models/ActividadModelo.dart';
import 'package:meta/meta.dart';

part 'actividad_event.dart';
part 'actividad_state.dart';

class ActividadBloc extends Bloc<ActividadEvent, ActividadState> {
  late final ActividadRepository _actividadRepository;
  ActividadBloc(this._actividadRepository) : super(ActividadInitialState()) {
    on<ActividadEvent>((event, emit) async {
      // TODO: implement event handler
      print("Bloc x");
      if (event is ListarActividadEvent) {
        emit(ActividadLoadingState());
        try {
          print("pasox!!");
          List<ActividadModelo> actividadList = await _actividadRepository.getActividad();
          emit(ActividadLoadedState(actividadList.cast<ActividadModelo>()));
        } catch (e) {
          emit(ActividadError(e as Error));
        }
      } else if (event is DeleteActividadEvent) {
        try {
          await _actividadRepository.deleteActividad(event.actividad.id as int);
          emit(ActividadLoadingState());
          List<ActividadModelo> actividadList = await _actividadRepository.getActividad();
          emit(ActividadLoadedState(actividadList.cast<ActividadModelo>()));
        } catch (e) {
          emit(ActividadError(e as Error));
        }
      } else if (event is CreateActividadEvent) {
        try {
          await _actividadRepository.createActividad(event.actividad as ActividadModelo);
          emit(ActividadLoadingState());
          List<ActividadModelo> actividadList = await _actividadRepository.getActividad();
          emit(ActividadLoadedState(actividadList.cast<ActividadModelo>()));
        } catch (e) {
          emit(ActividadError(e as Error));
        }
      } else if (event is UpdateActividadEvent) {
        try {
          await _actividadRepository.updateActividad(event.actividad.id as int, event.actividad as ActividadModelo);
          emit(ActividadLoadingState());
          List<ActividadModelo> actividadList = await _actividadRepository.getActividad();
          emit(ActividadLoadedState(actividadList.cast<ActividadModelo>()));
        } catch (e) {
          emit(ActividadError(e as Error));
        }
      }
    });
  }
}