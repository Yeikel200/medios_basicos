import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';
import 'package:medios_basicos/constants.dart';

class Laptop extends BasicPropRegister {
  String _idLaptop,
  _encargado;
  Uuid _randomId = Uuid();

  Laptop(String numInv, String marca, String modelo, String tipo, String detalle, String estado, this._encargado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){
    //this._idLsptop = _randomId.v1().toString();
    this._idLaptop = _randomId.v1().toString().substring(24, 36);
    //6009d8e0-e440-11e8-e459-ef36ab52cf1b

  }

  Laptop.map(dynamic obj) : super.map(obj){
    this._idLaptop = obj[CAMP_ID_LAPTOP];
    this._encargado = obj[CAMP_ENCARGADO];
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map[CAMP_ID_LAPTOP] = this._idLaptop;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_ENCARGADO] = this._encargado;
    map[CAMP_FECHA] = fecha;
  }

  Laptop.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idLaptop = map[CAMP_ID_LAPTOP];
    this._encargado = map[CAMP_ENCARGADO];
  }

  /// Metodos de guardar y leer la tabla LAPTOP
  static void saveLaptop(Laptop laptop, Future<Database> db) async {
    print(laptop);
    var dbClient = await db;
    String addQuery = '''
           INSERT INTO $TAB_LAPTOP ( 
           $CAMP_ID_LAPTOP, $CAMP_NUM_INVENTARIO, $CAMP_MARCA,
            $CAMP_MODELO, $CAMP_TIPO, $CAMP_DETALLES, $CAMP_ESTADO, 
            $CAMP_ENCARGADO, $CAMP_FECHA ) VALUES 
            (
              \'${laptop.idLaptop}\',
              \'${laptop.numInv}\',
              \'${laptop.marca}\', 
              \'${laptop.modelo}\',  
              \'${laptop.tipo}\', 
              \'${laptop.detalle}\', 
              \'${laptop.estado}\', 
              \'${laptop.encargado}\', 
              \'${laptop.fecha}\'
            )
      ''';
    await dbClient.transaction((trans) async {
      return await trans.rawQuery(addQuery);
    });
    print('[DBHelper] saveLAPTOP: Success');
  }

  static Future<List<Laptop>> getAllLaptops(Future<Database> db) async {
    var dbClient = await db;
    List<Map> queryList = await dbClient.query('$TAB_LAPTOP');
    List<Laptop> laptopList = List();

    for (int i = 0; i < queryList.length; i++) {
      Laptop laptop = Laptop.fromMap(queryList[i]);
      laptopList.add(laptop);
      print(Laptop);
    }

    print(laptopList);
    return laptopList;
  }

  static Future<Laptop> getLaptop(Future<Database> db, String idLaptop) async {
    var dbClient = await db;
    List<Map> queryLaptop =
    await dbClient.query('$TAB_LAPTOP', where:'$CAMP_ID_LAPTOP = ? ', whereArgs: [idLaptop] );
    //print(queryLaptop);
    if(queryLaptop.length > 0){
      return Laptop.fromMap(queryLaptop.first);
    }else{
      return null;
    }
  }

  get encargado => _encargado;

  set encargado(value) {
    _encargado = value;
  }

  String get idLaptop => _idLaptop;

  set idLaptop(String value) {
    _idLaptop = value;
  }

  @override
  String toString() {
    return 'Laptop{_idLaptop: $_idLaptop, _encargado: $_encargado, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _estado: $estado, _fecha: $fecha}';
  }


}