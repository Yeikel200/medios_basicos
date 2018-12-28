import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';
import 'package:medios_basicos/constants.dart';

class Impresora extends BasicPropRegister {
  String _idImpresora;
  Uuid _randomId = Uuid();

  Impresora( String numInv, String marca, String modelo, String tipo, String detalle, String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle,estado, fecha){
    this._idImpresora = _randomId.v1().toString().substring(24, 36);
  }

  Impresora.map(dynamic obj) : super.map(obj) {
    this._idImpresora = obj[CAMP_ID_IMPRESORA];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_IMPRESORA] = this._idImpresora;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_FECHA] = fecha;
    return map;
  }

  Impresora.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idImpresora = map[CAMP_ID_IMPRESORA];
  }

  /// Metodos de guardar y leer la tabla IMPRESORA
  static void saveImpresora(Impresora impresora, Future<Database> db) async {
    var dbClient = await db;
    String addQuery = '''
         INSERT INTO $TAB_IMPRESORA ( 
         $CAMP_ID_IMPRESORA, $CAMP_NUM_INVENTARIO, $CAMP_MARCA,
          $CAMP_MODELO, $CAMP_TIPO, $CAMP_DETALLES, $CAMP_ESTADO, 
          $CAMP_FECHA ) VALUES 
          (
            \'${impresora.idImpresora}\',
            \'${impresora.numInv}\',
            \'${impresora.marca}\', 
            \'${impresora.modelo}\',  
            \'${impresora.tipo}\', 
            \'${impresora.detalle}\', 
            \'${impresora.estado}\', 
            \'${impresora.fecha}\'
          )
    ''';
    await dbClient.transaction((trans) async {
      return await trans.rawQuery(addQuery);
    });
    print('[DBHelper] saveImpresora: Success');
  }

  static Future<List<Impresora>> getAllImpresoras(Future<Database> db) async {
    var dbClient = await db;
    List<Map> queryList = await dbClient.query('$TAB_IMPRESORA');
    List<Impresora> impresoraList = List();

    for (int i = 0; i < queryList.length; i++) {
      Impresora impresora = Impresora.fromMap(queryList[i]);
      impresoraList.add(impresora);
      print(impresora);
    }
    print(impresoraList);
    return impresoraList;
  }

  static Future<Impresora> getImpresora(Future<Database> db, String idImpresora) async {
    var dbClient = await db;
    List<Map> queryImpresora =
    await dbClient.query('$TAB_IMPRESORA', where:'$CAMP_ID_IMPRESORA = ? ', whereArgs: [idImpresora] );
    //print(queryImpresora);
    if(queryImpresora.length > 0){
      return Impresora.fromMap(queryImpresora.first);
    }else{
      return null;
    }
  }

  String get idImpresora => _idImpresora;

  set idImpresora(String value) {
    _idImpresora = value;
  }

  @override
  String toString() {
    return 'Impresora{_idImpresora: $_idImpresora, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _estado: $estado, _fecha: $fecha}';
  }
}