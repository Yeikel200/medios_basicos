import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';
import 'package:medios_basicos/constants.dart';

class Bocina extends BasicPropRegister {
  String _idBocina;
  Uuid _randomId = Uuid();

  Bocina( String numInv, String marca, String modelo, String tipo, String detalle, String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){
    this._idBocina = _randomId.v1().toString().substring(24, 36);

  }

  Bocina.map(dynamic obj) : super.map(obj) {
    this._idBocina = obj[CAMP_ID_BOCINA];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_BOCINA] = this._idBocina;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_FECHA] = fecha;
    return map;
  }

  Bocina.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idBocina = map[CAMP_ID_BOCINA];
  }


  /// Metodos de guardar y leer la tabla BOCINA
  static void saveBocina(Bocina bocina, Future<Database> db) async {
    var dbClient = await db;
    String addQuery = '''
         INSERT INTO $TAB_BOCINA ( 
         $CAMP_ID_BOCINA, $CAMP_NUM_INVENTARIO, $CAMP_MARCA,
          $CAMP_MODELO, $CAMP_TIPO, $CAMP_DETALLES, $CAMP_ESTADO, 
          $CAMP_FECHA ) VALUES 
          (
            \'${bocina.idBocina}\',
            \'${bocina.numInv}\',
            \'${bocina.marca}\', 
            \'${bocina.modelo}\',  
            \'${bocina.tipo}\', 
            \'${bocina.detalle}\', 
            \'${bocina.estado}\', 
            \'${bocina.fecha}\'
          )
    ''';
    await dbClient.transaction((trans) async {
      return await trans.rawQuery(addQuery);
    });
    print('[DBHelper] saveMouse: Success');
  }

  String get idBocina => _idBocina;

  set idBocina(String value) {
    _idBocina = value;
  }

  @override
  String toString() {
    return 'Bocina{_idBocina: $_idBocina, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _fecha: $fecha}';
  }


}