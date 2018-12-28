import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';
import 'package:medios_basicos/constants.dart';

class Motherboard extends BasicPropRegister {
  String _idMotherboard;
  Uuid _randomId = Uuid();

  Motherboard( String numInv, String marca, String modelo, String tipo, String detalle, String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){
    this._idMotherboard = _randomId.v1().toString().substring(24, 36);
  }

  Motherboard.map(dynamic obj) : super.map(obj) {
    this._idMotherboard = obj[CAMP_ID_MOTHERBOARD];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_MOTHERBOARD] = this._idMotherboard;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_FECHA] = fecha;
    return map;
  }



  Motherboard.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idMotherboard = map[CAMP_ID_MOTHERBOARD];
  }

  /// Metodos de guardar y leer la tabla MOTHERBOARD
  static void saveMotherboard(Motherboard motherboard, Future<Database> db) async {
    var dbClient = await db;
    String addQuery = '''
         INSERT INTO $TAB_MOTHERBOARD ( 
         $CAMP_ID_MOTHERBOARD, $CAMP_NUM_INVENTARIO, $CAMP_MARCA,
          $CAMP_MODELO, $CAMP_TIPO, $CAMP_DETALLES, $CAMP_ESTADO, 
          $CAMP_FECHA ) VALUES 
          (
            \'${motherboard.idMotherboard}\',
            \'${motherboard.numInv}\',
            \'${motherboard.marca}\', 
            \'${motherboard.modelo}\',  
            \'${motherboard.tipo}\', 
            \'${motherboard.detalle}\', 
            \'${motherboard.estado}\', 
            \'${motherboard.fecha}\'
          )
    ''';
    await dbClient.transaction((trans) async {
      return await trans.rawQuery(addQuery);
    });
    print('[DBHelper] saveMotherboard: Success');
  }

  static Future<List<Motherboard>> getAllMotherboards(Future<Database> db) async {
    var dbClient = await db;
    List<Map> queryList = await dbClient.query('$TAB_MOTHERBOARD');
    List<Motherboard> motherboardList = List();

    for (int i = 0; i < queryList.length; i++) {
      Motherboard motherboard = Motherboard.fromMap(queryList[i]);
      motherboardList.add(motherboard);
      print(motherboard);
    }
    print(motherboardList);
    return motherboardList;
  }

  static Future<Motherboard> getMotherboard(Future<Database> db, String idMotherboard) async {
    var dbClient = await db;
    List<Map> queryMotherboard =
    await dbClient.query('$TAB_MOTHERBOARD', where:'$CAMP_ID_MOTHERBOARD = ? ', whereArgs: [idMotherboard] );
    //print(queryMotherboard);
    if(queryMotherboard.length > 0){
      return Motherboard.fromMap(queryMotherboard.first);
    }else{
      return null;
    }
  }

  String get idMotherboard => _idMotherboard;

  set idMotherboard(String value) {
    _idMotherboard = value;
  }

  @override
  String toString() {
    return 'Motherboard{_idMotherboard: $_idMotherboard, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _fecha: $fecha}';
  }


}