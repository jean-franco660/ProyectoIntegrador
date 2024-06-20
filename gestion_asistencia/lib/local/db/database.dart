import 'dart:async';
import 'package:floor/floor.dart';
import 'package:gestion_asistencia/local/dao/ActividadDao.dart';
import 'package:gestion_asistencia/models/ActividadModelo.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'database.g.dart'; // the generated code will be there
//https://github.com/pinchbv/floor
//flutter packages pub run build_runner build
//flutter packages pub run build_runner watch
@Database(version: 2, entities: [ActividadModelo(id: id, nombreActividad: nombreActividad, fecha: fecha, horai: horai, minToler: minToler, latitud: latitud, longitud: longitud, estado: estado, evaluar: evaluar, userCreate: userCreate, mater: mater, validInsc: validInsc, asisSubact: asisSubact, entsal: entsal, offlinex: offlinex)])
abstract class AppDatabase extends FloorDatabase {
  ActividadDao get actividadDao;

}