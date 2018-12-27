import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import 'package:medios_basicos/constants.dart';
import 'package:flutter/foundation.dart';

class Estacion {
  String _idEstacion, _name;
  String _area;
  String _encargado;
  Uuid _randomId = Uuid();

  String _idUnidadCentral;
  String _idMonitor;
  String _idTeclado;
  String _idBocina;
  String _idMouse;
  String _idUps;
  String _idScanner;
  String _idImpresora;

  Estacion(@required this._name, @required this._area, @required this._encargado, this._idUnidadCentral) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }

  Estacion.ucMonitor(this._name, this._area, this._encargado,
       this._idMonitor) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }

  Estacion.ucMonitorTeclado(this._name, this._area, this._encargado,
      this._idUnidadCentral, this._idMonitor, this._idTeclado) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }

  Estacion.ucMonitorTecladoBocina(this._name, this._area, this._encargado,
      this._idUnidadCentral, this._idMonitor, this._idTeclado, this._idBocina) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }

  Estacion.ucMonitorTecladoBocinaMouse(
      this._name,
      this._area,
      this._encargado,
      this._idUnidadCentral,
      this._idMonitor,
      this._idTeclado,
      this._idBocina,
      this._idMouse) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }

  Estacion.ucMonitorTecladoBocinaMouseUps(
      this._name,
      this._area,
      this._encargado,
      this._idUnidadCentral,
      this._idMonitor,
      this._idTeclado,
      this._idBocina,
      this._idMouse,
      this._idUps) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }

  Estacion.ucMonitorTecladoBocinaMouseImpresora(
      this._name,
      this._area,
      this._encargado,
      this._idUnidadCentral,
      this._idMonitor,
      this._idTeclado,
      this._idBocina,
      this._idMouse,
      this._idImpresora) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }

  Estacion.ucMonitorTecladoBocinaMouseScanner(
      this._name,
      this._area,
      this._encargado,
      this._idUnidadCentral,
      this._idMonitor,
      this._idTeclado,
      this._idBocina,
      this._idMouse,
      this._idScanner) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }

  Estacion.ucMonitorTecladoBocinaMouseUpsScanner(
      this._name,
      this._area,
      this._encargado,
      this._idUnidadCentral,
      this._idMonitor,
      this._idTeclado,
      this._idBocina,
      this._idMouse,
      this._idUps,
      this._idScanner) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }

  Estacion.ucMonitorTecladoBocinaMouseUpsImpresora(
      this._name,
      this._area,
      this._encargado,
      this._idUnidadCentral,
      this._idMonitor,
      this._idTeclado,
      this._idBocina,
      this._idMouse,
      this._idUps,
      this._idImpresora) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }

  Estacion.ucMonitorTecladoBocinaMouseUpsImpresoraScanner(
      this._name,
      this._area,
      this._encargado,
      this._idUnidadCentral,
      this._idMonitor,
      this._idTeclado,
      this._idBocina,
      this._idMouse,
      this._idUps,
      this._idImpresora,
      this._idScanner) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }

  Estacion.map(dynamic obj) {
    this._idEstacion = obj[CAMP_ID_ESTACION];
    this._name = obj[CAMP_NOMBRE_ESTACION];
    this._area = obj[CAMP_AREA_ESTACION];
    this._encargado = obj[CAMP_ENCARGADO];
    this._idUnidadCentral = obj[CAMP_ID_UNIDAD_CENTRAL];
    this._idMonitor = obj[CAMP_ID_MONITOR];
    this._idTeclado = obj[CAMP_ID_TECLADO];
    this._idBocina = obj[CAMP_ID_BOCINA];
    this._idMouse = obj[CAMP_ID_MOUSE];
    this._idUps = obj[CAMP_ID_UPS];
    this._idScanner = obj[CAMP_ID_SCANNER];
    this._idImpresora = obj[CAMP_ID_IMPRESORA];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_ESTACION] = this._idEstacion;
    map[CAMP_NOMBRE_ESTACION] = this._name;
    map[CAMP_AREA_ESTACION] = this._area;
    map[CAMP_ENCARGADO] = this._encargado;
    map[CAMP_ID_UNIDAD_CENTRAL] = this._idUnidadCentral;
    map[CAMP_ID_MONITOR] = this._idMonitor;
    map[CAMP_ID_TECLADO] = this._idTeclado;
    map[CAMP_ID_BOCINA] = this._idBocina;
    map[CAMP_ID_MOUSE] = this._idMouse;
    map[CAMP_ID_UPS] = this._idUps;
    map[CAMP_ID_SCANNER] = this._idScanner;
    map[CAMP_ID_IMPRESORA] = this._idImpresora;
    return map;
  }

  Estacion.fromMap(Map<String, dynamic> map) {
    this._idEstacion = map[CAMP_ID_ESTACION];
    this._name = map[CAMP_NOMBRE_ESTACION];
    this._area = map[CAMP_AREA_ESTACION];
    this._encargado = map[CAMP_ENCARGADO];
    this._idUnidadCentral = map[CAMP_ID_UNIDAD_CENTRAL];
    this._idMonitor = map[CAMP_ID_MONITOR];
    this._idTeclado = map[CAMP_ID_TECLADO];
    this._idBocina = map[CAMP_ID_BOCINA];
    this._idMouse = map[CAMP_ID_MOUSE];
    this._idUps = map[CAMP_ID_UPS];
    this._idScanner = map[CAMP_ID_SCANNER];
    this._idImpresora = map[CAMP_ID_IMPRESORA];
  }

  /// Metodos de guardar y leer la tabla ESTACION
  static void saveEstacion(Estacion estacion, Future<Database> db) async {
    var dbClient = await db;
    String addQuery = '''
         INSERT INTO $TAB_ESTACION ( 
         $CAMP_ID_ESTACION, $CAMP_NOMBRE_ESTACION, $CAMP_AREA_ESTACION,
          $CAMP_ENCARGADO, $CAMP_ID_UNIDAD_CENTRAL, $CAMP_ID_MONITOR,
          $CAMP_ID_TECLADO, $CAMP_ID_BOCINA, $CAMP_ID_MOUSE, $CAMP_ID_UPS, 
          $CAMP_ID_SCANNER, $CAMP_ID_IMPRESORA ) VALUES 
          (
            \'${estacion.idEstacion}\',
            \'${estacion.name}\',
            \'${estacion.area}\', 
            \'${estacion.encargado}\',  
            \'${estacion.idUnidadCentral}\', 
            \'${estacion.idMonitor}\', 
            \'${estacion.idTeclado}\', 
            \'${estacion.idBocina}\', 
            \'${estacion.idMouse}\', 
            \'${estacion.idUps}\', 
            \'${estacion.idScanner}\', 
            \'${estacion.idImpresora}\'
          )
    ''';
    await dbClient.transaction((trans) async {
      return await trans.rawQuery(addQuery);
    });
    print('[DBHelper] saveUnidadCentral: Success');
  }

  static Future<List<Estacion>> getAllEstacions(Future<Database> db) async {
    var dbClient = await db;
    List<Map> queryList = await dbClient.query('$TAB_ESTACION');
    List<Estacion> estacionList = List();

    for (int i = 0; i < queryList.length; i++) {
      Estacion estacion = Estacion.fromMap(queryList[i]);
      estacionList.add(estacion);
      print(Estacion);
    }

    print(estacionList);
    return estacionList;
  }

  String get encargado => _encargado;

  set encargado(String value) {
    _encargado = value;
  }

  String get area => _area;

  set area(String value) {
    _area = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

  String get idEstacion => _idEstacion;

  set idEstacion(String value) {
    _idEstacion = value;
  }

  String get idUnidadCentral => _idUnidadCentral;

  set idUnidadCentral(String value) {
    _idUnidadCentral = value;
  }

  String get idMonitor => _idMonitor;

  set idMonitor(String value) {
    _idMonitor = value;
  }

  String get idTeclado => _idTeclado;

  set idTeclado(String value) {
    _idTeclado = value;
  }

  String get idBocina => _idBocina;

  set idBocina(String value) {
    _idBocina = value;
  }

  String get idMouse => _idMouse;

  set idMouse(String value) {
    _idMouse = value;
  }

  String get idUps => _idUps;

  set idUps(String value) {
    _idUps = value;
  }

  String get idScanner => _idScanner;

  set idScanner(String value) {
    _idScanner = value;
  }

  String get idImpresora => _idImpresora;

  set idImpresora(String value) {
    _idImpresora = value;
  }

  @override
  String toString() {
    return 'Estacion{_idEstacion: $_idEstacion, _name: $_name, _area: $_area,'
        ' _encargado: $_encargado, _idUnidadCentral: $_idUnidadCentral,'
        ' _idMonitor: $_idMonitor, _idTeclado: $_idTeclado, '
        '_idBocina: $_idBocina, _idMouse: $_idMouse, _idUps: $_idUps,'
        ' _idScanner: $_idScanner, _idImpresora: $_idImpresora}';
  }
}
