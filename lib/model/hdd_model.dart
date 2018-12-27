import 'package:sqflite/sqflite.dart';

import 'basic_prop_register.dart';
import 'package:uuid/uuid.dart';
import 'package:medios_basicos/constants.dart';

class Hdd extends BasicPropRegister {
  String _idHdd;
  Uuid _randomId = Uuid();

  Hdd( String numInv, String marca, String modelo, String tipo, String detalle,String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle,estado, fecha){
    this._idHdd = _randomId.v1().toString().substring(24, 36);
  }

  Hdd.map(dynamic obj) : super.map(obj) {
    this._idHdd = obj[CAMP_ID_HDD];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_HDD] = this._idHdd;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_FECHA] = fecha;
    return map;
  }

  Hdd.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idHdd = map[CAMP_ID_HDD];
  }

  /// Metodos de guardar y leer la tabla HDD
  static void saveHdd(Hdd hdd, Future<Database> db) async {
    var dbClient = await db;
    String addQuery = '''
         INSERT INTO $TAB_HDD ( 
         $CAMP_ID_HDD, $CAMP_NUM_INVENTARIO, $CAMP_MARCA,
          $CAMP_MODELO, $CAMP_TIPO, $CAMP_DETALLES, $CAMP_ESTADO, 
          $CAMP_FECHA ) VALUES 
          (
            \'${hdd.idHdd}\',
            \'${hdd.numInv}\',
            \'${hdd.marca}\', 
            \'${hdd.modelo}\',  
            \'${hdd.tipo}\', 
            \'${hdd.detalle}\', 
            \'${hdd.estado}\', 
            \'${hdd.fecha}\'
          )
    ''';
    await dbClient.transaction((trans) async {
      return await trans.rawQuery(addQuery);
    });
    print('[DBHelper] saveHdd: Success');
  }

  String get idHdd => _idHdd;

  set idHdd(String value) {
    _idHdd = value;
  }

  @override
  String toString() {
    return 'Hdd{_idHdd: $_idHdd,_numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _estado: $estado, _fecha: $fecha}';
  }


}