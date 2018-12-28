import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';
import 'package:medios_basicos/constants.dart';

class Mouse extends BasicPropRegister {
  String _idMouse;
  Uuid _randomId = Uuid();

  Mouse( String numInv, String marca, String modelo, String tipo, String detalle,String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){
    this._idMouse = _randomId.v1().toString().substring(24, 36);

  }

  Mouse.map(dynamic obj) : super.map(obj) {
    this._idMouse = obj[CAMP_ID_MOUSE];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_MOUSE] = this._idMouse;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_FECHA] = fecha;
    return map;
  }

  Mouse.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idMouse = map[CAMP_ID_MOUSE];
  }

  /// Metodos de guardar y leer la tabla MOUSE
  static void saveMouse(Mouse mouse, Future<Database> db) async {
    var dbClient = await db;
    String addQuery = '''
         INSERT INTO $TAB_MOUSE ( 
         $CAMP_ID_MOUSE, $CAMP_NUM_INVENTARIO, $CAMP_MARCA,
          $CAMP_MODELO, $CAMP_TIPO, $CAMP_DETALLES, $CAMP_ESTADO, 
          $CAMP_FECHA ) VALUES 
          (
            \'${mouse.idMouse}\',
            \'${mouse.numInv}\',
            \'${mouse.marca}\', 
            \'${mouse.modelo}\',  
            \'${mouse.tipo}\', 
            \'${mouse.detalle}\', 
            \'${mouse.estado}\', 
            \'${mouse.fecha}\'
          )
    ''';
    await dbClient.transaction((trans) async {
      return await trans.rawQuery(addQuery);
    });
    print('[DBHelper] saveMouse: Success');
  }

  static Future<List<Mouse>> getAllMouses(Future<Database> db) async {
    var dbClient = await db;
    List<Map> queryList = await dbClient.query('$TAB_MOUSE');
    List<Mouse> mouseList = List();

    for (int i = 0; i < queryList.length; i++) {
      Mouse mouse = Mouse.fromMap(queryList[i]);
      mouseList.add(mouse);
      print(mouse);
    }
    print(mouseList);
    return mouseList;
  }

  static Future<Mouse> getMouse(Future<Database> db, String idMouse) async {
    var dbClient = await db;
    List<Map> queryMouse =
    await dbClient.query('$TAB_MOUSE', where:'$CAMP_ID_MOUSE = ? ', whereArgs: [idMouse] );
    //print(queryMouse);
    if(queryMouse.length > 0){
      return Mouse.fromMap(queryMouse.first);
    }else{
      return null;
    }
  }

  String get idMouse => _idMouse;

  set idMouse(String value) {
    _idMouse = value;
  }

  @override
  String toString() {
    return 'Mouse{_idMouse: $_idMouse, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _estado: $estado, _fecha: $fecha}';
  }


}