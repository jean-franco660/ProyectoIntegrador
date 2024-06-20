import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:gestion_asistencia/models/MaterialesxModelo.dart';
import 'package:gestion_asistencia/repository/MaterialesxRepository.dart';

part 'materialesx_event.dart';
part 'materialesx_state.dart';

class MaterialesxBloc extends Bloc<MaterialesxEvent, MaterialesxState> {
  late final MaterialesxRepository _materialesxRepository;
  late List<MaterialesxRepModelo> lista;
  late List<MaterialesxRepModelo> listaB;

  MaterialesxBloc(this._materialesxRepository) : super(MaterialesxInitialState()) {
    on<ListarMaterialesxEvent>(_onListarMaterialesxEvent);
    on<ListarMaterialesxFiltroEvent>(_onListarMaterialesxFiltroEvent);
    on<DeleteMaterialesxEvent>(_onDeleteMaterialesxEvent);
    on<CreateMaterialesxEvent>(_onCreateMaterialesxEvent);
    on<UpdateMaterialesxEvent>(_onUpdateMaterialesxEvent);
  }

  Future<void> _onListarMaterialesxEvent(ListarMaterialesxEvent event, Emitter<MaterialesxState> emit) async {
    emit(MaterialesxLoadingState());
    try {
      print("pasox!!");
      List<MaterialesxRepModelo> entidadList = await _materialesxRepository.getEntidad();
      lista = List.from(entidadList);
      listaB = List.from(lista);
      emit(MaterialesxLoadedState(lista));
    } catch (e) {
      emit(MaterialesxError(e.toString() as Error));
    }
  }

  Future<void> _onListarMaterialesxFiltroEvent(ListarMaterialesxFiltroEvent event, Emitter<MaterialesxState> emit) async {
    try {
      lista = listaB
          .where((element) => element.materEntre.toLowerCase().contains(event.dato.toLowerCase()))
          .toList();
      emit(MaterialesxLoadedState(lista));
    } catch (e) {
      emit(MaterialesxError(e.toString() as Error));
    }
  }

  Future<void> _onDeleteMaterialesxEvent(DeleteMaterialesxEvent event, Emitter<MaterialesxState> emit) async {
    try {
      await _materialesxRepository.deleteEntidad(event.materialesx!.id);
      emit(MaterialesxLoadingState());
      List<MaterialesxRepModelo> entidadList = await _materialesxRepository.getEntidad();
      emit(MaterialesxLoadedState(entidadList));
    } catch (e) {
      emit(MaterialesxError(e.toString() as Error));
    }
  }

  Future<void> _onCreateMaterialesxEvent(CreateMaterialesxEvent event, Emitter<MaterialesxState> emit) async {
    try {
      await _materialesxRepository.createActividad(event.materialesx! as MaterialesxModelo);
      emit(MaterialesxLoadingState());
      List<MaterialesxRepModelo> entidadList = await _materialesxRepository.getEntidad();
      emit(MaterialesxLoadedState(entidadList));
    } catch (e) {
      emit(MaterialesxError(e.toString() as Error));
    }
  }

  Future<void> _onUpdateMaterialesxEvent(UpdateMaterialesxEvent event, Emitter<MaterialesxState> emit) async {
    try {
      await _materialesxRepository.updateActividad(event.materialesx!.id, event.materialesx! as MaterialesxModelo);
      emit(MaterialesxLoadingState());
      List<MaterialesxRepModelo> entidadList = await _materialesxRepository.getEntidad();
      emit(MaterialesxLoadedState(entidadList));
    } catch (e) {
      emit(MaterialesxError(e.toString() as Error));
    }
  }

  List<MaterialesxRepModelo> getListActividad() {
    return lista;
  }
}
