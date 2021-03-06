import 'package:sqflite/sqflite.dart';

import 'basic_prop_register.dart';
import 'package:uuid/uuid.dart';

import 'package:medios_basicos/constants.dart';

class Monitor extends BasicPropRegister {
  String _idMonitor;

  Uuid _randomId = Uuid();

  Monitor(String numInv, String marca, String modelo, String tipo, String detalle,String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){
    this._idMonitor = _randomId.v1().toString().substring(24, 36);
  }

  Monitor.map(dynamic obj) : super.map(obj) {
    this._idMonitor = obj[CAMP_ID_MONITOR];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_MONITOR] = this._idMonitor;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_FECHA] = fecha;
    return map;
  }

  Monitor.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idMonitor = map[CAMP_ID_MONITOR];
  }

  /// Metodos de guardar y leer la tabla MONITOR
  static void saveMonitor(Monitor monitor, Future<Database> db) async {
    var dbClient = await db;
    String addQuery = '''
         INSERT INTO $TAB_MONITOR ( 
         $CAMP_ID_MONITOR, $CAMP_NUM_INVENTARIO, $CAMP_MARCA,
          $CAMP_MODELO, $CAMP_TIPO, $CAMP_DETALLES, $CAMP_ESTADO, 
          $CAMP_FECHA ) VALUES 
          (
            \'${monitor.idMonitor}\',
            \'${monitor.numInv}\',
            \'${monitor.marca}\', 
            \'${monitor.modelo}\',  
            \'${monitor.tipo}\', 
            \'${monitor.detalle}\', 
            \'${monitor.estado}\', 
            \'${monitor.fecha}\'
          )
    ''';
    await dbClient.transaction((trans) async {
      return await trans.rawQuery(addQuery);
    });
    print('[DBHelper] saveMonitor: Success');
  }

  static Future<List<Monitor>> getAllMonitors(Future<Database> db) async {
    var dbClient = await db;
    List<Map> queryList = await dbClient.query('$TAB_MONITOR');
    List<Monitor> monitorList = List();

    for (int i = 0; i < queryList.length; i++) {
      Monitor monitor = Monitor.fromMap(queryList[i]);
      monitorList.add(monitor);
      print(monitor);
    }
    print(monitorList);
    return monitorList;
  }

  static Future<Monitor> getMonitor(Future<Database> db, String idMonitor) async {
    var dbClient = await db;
    List<Map> queryMonitor =
    await dbClient.query('$TAB_MONITOR', where:'$CAMP_ID_MONITOR = ? ', whereArgs: [idMonitor] );
    //print(queryMonitor);
    if(queryMonitor.length > 0){
      return Monitor.fromMap(queryMonitor.first);
    }else{
      return null;
    }
  }

  String get idMonitor => _idMonitor;

  set idMonitor(String value) {
    _idMonitor = value;
  }

  @override
  String toString() {
    return 'Monitor{_idMonitor: $_idMonitor, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _fecha: $fecha}';
  }


}