
import 'package:bloc/bloc.dart';
import 'package:eventos_app/bloc/evento/evento_event.dart';
import 'package:eventos_app/bloc/evento/evento_state.dart';
import 'package:eventos_app/models/EventoModelo.dart';


part 'evento_state.dart';

class EmpresaBloc extends Bloc<EventoEvent, EventoState> {
  late final EventoRepository _empresaRepository;

  EmpresaBloc(this._empresaRepository) : super(EmpresaInitialState()) {
    on<EventoEvent>((event, emit) async {
      // TODO: implement event handler
      print("Bloc x");
      if (event is ListarEventoEvent) {
        emit(EventoLoadingState());
        try {
          print("pasox!!");
          List<EventoModelo> PersonaList = await _empresaRepository.getEmpresa();
          emit(EventoLoadedState(PersonaList));
        } catch (e) {
          emit(EventoError(e as Error));
        }
      } else if (event is DeleteEventoEvent) {
        try {
          await _empresaRepository.deleteEmpresa(event.empresa!.id);
          emit(EventoLoadingState());
          List<EventoModelo> PersonaList = await _empresaRepository.getEmpresa();
          emit(EventoLoadedState(PersonaList));
        } catch (e) {
          emit(EventoError(e as Error));
        }
      } else if (event is CreateEventoEvent) {
        try {
          await _empresaRepository.createEmpresa(event.empresa!);
          emit(EventoLoadingState());
          List<EventoModelo> PersonaList = await _empresaRepository.getEmpresa();
          emit(EventoLoadedState(PersonaList));
        } catch (e) {
          emit(EventoError(e as Error));
        }
      } else if (event is UpdateEventoEvent) {
        try {
          await _empresaRepository.updateEmpresa(event.empresa!.id, event.empresa!);
          emit(EventoLoadingState());
          List<EventoModelo> PersonaList = await _empresaRepository.getEmpresa();
          emit(EventoLoadedState(PersonaList));
        } catch (e) {
          emit(EventoError(e as Error));
        }
      }
    });
  }
}