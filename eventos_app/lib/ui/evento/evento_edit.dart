import 'package:eventos_app/models/EventoModelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventoFormEdit extends StatefulWidget {
  final EventoModelo modelA;

  EventoFormEdit({required this.modelA}) : super();

  @override
  _EventoFormEditState createState() => _EventoFormEditState(modelA: modelA);
}

class _EventoFormEditState extends State<EventoFormEdit> {
  final EventoModelo modelA;
  _EventoFormEditState({required this.modelA}) : super();

  late String _nombreEvento = "";

  Position? currentPosition;
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  void capturaNombreEvento(valor) {
    this._nombreEvento = valor;
  }

  @override
  Widget build(BuildContext context) {
    getCurrentLocation();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Form. Reg. Evento"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildDatoCadena(capturaNombreEvento, modelA.nombre, "Nombre Evento:"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: Text('Cancelar')),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Processing Data'),
                                  ),
                                );
                                _formKey.currentState!.save();
                                EventoModelo evento = EventoModelo(
                                  id: modelA.id,
                                  nombre: _nombreEvento,
                                  descripcion: modelA.descripcion,
                                  fechaInicio: modelA.fechaInicio,
                                  fechaFin: modelA.fechaFin,
                                  participantes: modelA.participantes,
                                  direccion: modelA.direccion,
                                );

                                final prefs = await SharedPreferences.getInstance();
                                evento.id = modelA.id;

                                print("Evento: ${_nombreEvento}");

                                // Replace EventoBloc with the correct Bloc for Evento
                                // BlocProvider.of<EventoBloc>(context).add(UpdateEventoEvent(evento));

                                Navigator.pop(context, () {
                                  // setState(() {});
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('No estan bien los datos de los campos!'),
                                  ),
                                );
                              }
                            },
                            child: const Text('Guardar'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }

  Widget _buildDatoCadena(Function obtValor, String _dato, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      initialValue: _dato,
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Nombre Requerido!';
        }
        return null;
      },
      onSaved: (String? value) {
        obtValor(value!);
      },
    );
  }

  Future<bool> permiso() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future<void> getCurrentLocation() async {
    final hasPermission = await permiso();
    if (!hasPermission) {
      return;
    }
    if (mounted) {
      Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best,
              forceAndroidLocationManager: true)
          .then((Position position) {
        if (mounted) {
          setState(() {
            currentPosition = position;
          });
        }
      }).catchError((e) {
        print(e);
      });
    }
  }
}
