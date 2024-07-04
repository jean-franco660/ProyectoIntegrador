import 'package:eventos_app/bloc/evento/evento_bloc.dart';
import 'package:eventos_app/models/EventoModelo.dart';
import 'package:eventos_app/theme/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventoForm extends StatefulWidget {
  @override
  _EventoFormState createState() => _EventoFormState();
}

class _EventoFormState extends State<EventoForm> {
  late String _nombreEvento = "";

  TextEditingController _fechaInicioController = TextEditingController();
  TextEditingController _fechaFinController = TextEditingController();
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  late String _estado = "D";

  Position? currentPosition;
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  void capturaNombreEvento(String valor) {
    _nombreEvento = valor;
  }

  void _selectStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null && pickedDate != selectedStartDate) {
      setState(() {
        selectedStartDate = pickedDate;
        _fechaInicioController.text = DateFormat('yyyy-MM-dd').format(selectedStartDate!);
      });
    }
  }

  void _selectEndDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null && pickedDate != selectedEndDate) {
      setState(() {
        selectedEndDate = pickedDate;
        _fechaFinController.text = DateFormat('yyyy-MM-dd').format(selectedEndDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getCurrentLocation();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Formulario de Evento"),
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
                _buildDatoCadena(capturaNombreEvento, "Nombre del Evento:"),
                _buildDatoFecha(_fechaInicioController, _selectStartDate, "Fecha de Inicio:"),
                _buildDatoFecha(_fechaFinController, _selectEndDate, "Fecha de Fin:"),
                _buildDatoLista(_estado, "Estado:", [
                  {'value': 'A', 'display': 'Activo'},
                  {'value': 'D', 'display': 'Desactivo'}
                ]),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: Text('Cancelar'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Procesando Datos'),
                              ),
                            );
                            _formKey.currentState!.save();
                            EventoModelo evento = EventoModelo(
                              nombre: _nombreEvento,
                              fechaInicio: _fechaInicioController.text,
                              fechaFin: _fechaFinController.text,
                              estado: _estado,
                              // otros campos según sea necesario
                            );

                            // Aquí deberías usar el BlocProvider adecuado y el evento para crear el evento
                            BlocProvider.of<EventoBloc>(context).add(CreateEventoEvent(evento));

                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Revise los campos!'),
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
          ),
        ),
      ),
    );
  }

  Widget _buildDatoCadena(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Campo requerido';
        }
        return null;
      },
      onSaved: (String? value) {
        obtValor(value!);
      },
    );
  }

  Widget _buildDat
