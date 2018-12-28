import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';
import 'package:medios_basicos/constants.dart';

class Cpu extends BasicPropRegister {
  String _idCpu;
  Uuid _randomId = Uuid();

  Cpu(String numInv, String marca, String modelo, String tipo, String detalle,String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){
    this._idCpu = _randomId.v1().toString().substring(24, 36);
  }

  Cpu.map(dynamic obj) : super.map(obj) {
    this._idCpu = obj[CAMP_ID_CPU];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_CPU] = this._idCpu;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_FECHA] = fecha;
    return map;
  }

  Cpu.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idCpu = map[CAMP_ID_CPU];
  }

  /// Metodos de guardar y leer la tabla CPU
  static void saveCpu(Cpu cpu, Future<Database> db) async {
    var dbClient = await db;
    String addQuery = '''
         INSERT INTO $TAB_CPU ( 
         $CAMP_ID_CPU, $CAMP_NUM_INVENTARIO, $CAMP_MARCA,
          $CAMP_MODELO, $CAMP_TIPO, $CAMP_DETALLES, $CAMP_ESTADO, 
          $CAMP_FECHA ) VALUES 
          (
            \'${cpu.idCpu}\',
            \'${cpu.numInv}\',
            \'${cpu.marca}\', 
            \'${cpu.modelo}\',  
            \'${cpu.tipo}\', 
            \'${cpu.detalle}\', 
            \'${cpu.estado}\', 
            \'${cpu.fecha}\'
          )
    ''';
    await dbClient.transaction((trans) async {
      return await trans.rawQuery(addQuery);
    });
    print('[DBHelper] saveCpu: Success');
  }

  static Future<List<Cpu>> getAllCpus(Future<Database> db) async {
    var dbClient = await db;
    List<Map> queryList = await dbClient.query('$TAB_CPU');
    List<Cpu> cpuList = List();

    for (int i = 0; i < queryList.length; i++) {
      Cpu cpu = Cpu.fromMap(queryList[i]);
      cpuList.add(cpu);
      print(cpu);
    }
    print(cpuList);
    return cpuList;
  }

  static Future<Cpu> getCpu(Future<Database> db, String idCpu) async {
    var dbClient = await db;
    List<Map> queryCpu =
    await dbClient.query('$TAB_CPU', where:'$CAMP_ID_CPU = ? ', whereArgs: [idCpu] );
    //print(queryCpu);
    if(queryCpu.length > 0){
      return Cpu.fromMap(queryCpu.first);
    }else{
      return null;
    }
  }

  String get idCpu => _idCpu;

  set idCpu(String value) {
    _idCpu = value;
  }

  @override
  String toString() {
    return 'Cpu{_idCpu: $_idCpu, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _fecha: $fecha}';
  }


}