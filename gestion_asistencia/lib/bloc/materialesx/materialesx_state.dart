part of 'materialesx_bloc.dart';

@immutable
abstract class MaterialesxState {}

class MaterialesxInitialState extends MaterialesxState {}

class MaterialesxLoadingState extends MaterialesxState {}

class MaterialesxLoadedState extends MaterialesxState {
  final List<MaterialesxRepModelo> materiales;

  MaterialesxLoadedState(this.materiales);
}

class MaterialesxError extends MaterialesxState {
  final Error error;

  MaterialesxError(this.error);
}
