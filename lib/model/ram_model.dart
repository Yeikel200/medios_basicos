import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';
import 'package:medios_basicos/constants.dart';

class Ram extends BasicPropRegister {
  String _idRam;
  Uuid _randomId = Uuid();

  Ram( String numInv, String marca, String modelo, String tipo, String detalle, String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){
    this._idRam = _randomId.v1().toString().substring(24, 36);
  }

  Ram.map(dynamic obj) : super.map(obj) {
    this._idRam = obj[CAMP_ID_RAM];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_RAM] = this._idRam;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_FECHA] = fecha;
    return map;
  }

  Ram.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idRam = map[CAMP_ID_RAM];
  }

  /// Metodos de guardar y leer la tabla RAM
  static void saveRam(Ram ram, Future<Database> db) async {
    var dbClient = await db;
    String addQuery = '''
         INSERT INTO $TAB_RAM ( 
         $CAMP_ID_RAM, $CAMP_NUM_INVENTARIO, $CAMP_MARCA,
          $CAMP_MODELO, $CAMP_TIPO, $CAMP_DETALLES, $CAMP_ESTADO, 
          $CAMP_FECHA ) VALUES 
          (
            \'${ram.idRam}\',
            \'${ram.numInv}\',
            \'${ram.marca}\', 
            \'${ram.modelo}\',  
            \'${ram.tipo}\', 
            \'${ram.detalle}\', 
            \'${ram.estado}\', 
            \'${ram.fecha}\'
          )
    ''';
    await dbClient.transaction((trans) async {
      return await trans.rawQuery(addQuery);
    });
    print('[DBHelper] saveRam: Success');
  }

  String get idRam => _idRam;

  set idRam(String value) {
    _idRam = value;
  }

  @override
  String toString() {
    return 'Ram{_idRam: $_idRam, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _estado: $estado, _fecha: $fecha}';
  }


}