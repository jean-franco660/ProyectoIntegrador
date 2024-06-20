part of 'materialesx_bloc.dart';

@immutable
abstract class MaterialesxEvent {}

class ListarMaterialesxEvent extends MaterialesxEvent {}

class ListarMaterialesxFiltroEvent extends MaterialesxEvent {
  final String dato;

  ListarMaterialesxFiltroEvent(this.dato);
}

class DeleteMaterialesxEvent extends MaterialesxEvent {
  final MaterialesxRepModelo? materialesx;

  DeleteMaterialesxEvent(this.materialesx);
}

class CreateMaterialesxEvent extends MaterialesxEvent {
  final MaterialesxRepModelo? materialesx;

  CreateMaterialesxEvent(this.materialesx);
}

class UpdateMaterialesxEvent extends MaterialesxEvent {
  final MaterialesxRepModelo? materialesx;

  UpdateMaterialesxEvent(this.materialesx);
}
