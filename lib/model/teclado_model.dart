import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';
import 'package:medios_basicos/constants.dart';

class Teclado extends BasicPropRegister {
  String _idTeclado;
  Uuid _randomId = Uuid();

  Teclado( String numInv, String marca, String modelo, String tipo, String detalle, String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){

    this._idTeclado = _randomId.v1().toString().substring(24, 36);
  }

  Teclado.map(dynamic obj) : super.map(obj) {
    this._idTeclado = obj[CAMP_ID_TECLADO];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_TECLADO] = this._idTeclado;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_FECHA] = fecha;
    return map;
  }

  Teclado.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idTeclado = map[CAMP_ID_TECLADO];
  }


  /// Metodos de guardar y leer la tabla TECLADO
  static void saveTeclado(Teclado teclado, Future<Database> db) async {
    var dbClient = await db;
    String addQuery = '''
         INSERT INTO $TAB_TECLADO ( 
         $CAMP_ID_TECLADO, $CAMP_NUM_INVENTARIO, $CAMP_MARCA,
          $CAMP_MODELO, $CAMP_TIPO, $CAMP_DETALLES, $CAMP_ESTADO, 
          $CAMP_FECHA ) VALUES 
          (
            \'${teclado.idTeclado}\',
            \'${teclado.numInv}\',
            \'${teclado.marca}\', 
            \'${teclado.modelo}\',  
            \'${teclado.tipo}\', 
            \'${teclado.detalle}\', 
            \'${teclado.estado}\', 
            \'${teclado.fecha}\'
          )
    ''';
    await dbClient.transaction((trans) async {
      return await trans.rawQuery(addQuery);
    });
    print('[DBHelper] saveTeclado: Success');
  }


  String get idTeclado => _idTeclado;

  set idTeclado(String value) {
    _idTeclado = value;
  }

  @override
  String toString() {
    return 'Teclado{_idTeclado: $_idTeclado, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _fecha: $fecha}';
  }


}