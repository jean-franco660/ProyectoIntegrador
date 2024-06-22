import 'package:eventos_app/models/ParticipanteModelo.dart'
import 'package:eventos_app/models/ParticipanteRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'participante_event.dart';
part 'participante_state.dart';

class ParticipanteBloc extends Bloc<ParticipanteEvent, ParticipanteState> {
  late final ParticipanteRepository _participanteRepository;
  ParticipanteBloc(this._participanteRepository) : super(ParticipanteInitialState()) {
    on<ParticipanteEvent>((event, emit) async {
      // TODO: implement event handler
      print("Bloc x");
      if (event is ListarParticipanteEvent) {
        emit(ParticipanteLoadingState());
        try {
          print("pasox!!");
          List<ParticipanteModelo> ParticipanteList =
              await _participanteRepository.getParticipante();
          emit(ParticipanteLoadedState(ParticipanteList));
        } catch (e) {
          emit(ParticipanteError(e as Error));
        }
      } else if (event is DeleteParticipanteEvent) {
        try {
          await _participanteRepository.deleteParticipante(event.participante!.id);
          emit(ParticipanteLoadingState());
          List<ParticipanteModelo> ParticipanteList =
              await _participanteRepository.getParticipante();
          emit(ParticipanteLoadedState(ParticipanteList));
        } catch (e) {
          emit(ParticipanteError(e as Error));
        }
      } else if (event is CreateParticipanteEvent) {
        try {
          await _participanteRepository.createParticipante(event.participante!);
          emit(ParticipanteLoadingState());
          List<ParticipanteModelo> ParticipanteList =
              await _participanteRepository.getParticipante();
          emit(ParticipanteLoadedState(ParticipanteList));
        } catch (e) {
          emit(ParticipanteError(e as Error));
        }
      } else if (event is UpdateParticipanteEvent) {
        try {
          await _participanteRepository.updateParticipante(
              event.participante!.id, event.participante!);
          emit(ParticipanteLoadingState());
          List<ParticipanteModelo> ParticipanteList =
              await _participanteRepository.getParticipante();
          emit(ParticipanteLoadedState(ParticipanteList));
        } catch (e) {
          emit(ParticipanteError(e as Error));
        }
      }
    });
  }
}