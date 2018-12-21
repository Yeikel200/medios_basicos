import 'package:medios_basicos/model/laptop_model.dart';
import 'package:medios_basicos/model/memoria_model.dart';
import 'package:medios_basicos/model/tablet_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:medios_basicos/constants.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();

  DBHelper.internal();

  factory DBHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  Future<Database> initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'medios_basicos.db');
    Database db = await openDatabase(
      path,
      version: 1,
      onConfigure: _onConfig,
      onCreate: _createTables,
    );

    await Sqflite.devSetDebugModeOn(true);

    print('[DBHelper] initDB: Success');
    return db;
  }

  void _onConfig(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  void _createTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $TAB_TABLET (
      '$CAMP_ID_TABLET' TEXT PRIMARY KEY NOT NULL,
      '$CAMP_NUM_INVENTARIO' TEXT,
      '$CAMP_MARCA' TEXT,
      '$CAMP_MODELO' TEXT,
      '$CAMP_TIPO' TEXT NULL,
      '$CAMP_DETALLES' TEXT,
      '$CAMP_ESTADO' TEXT,
      '$CAMP_ENCARGADO' TEXT,
      '$CAMP_FECHA' TEXT 
     )
      ''');
    print('[DBHelper] _createTables - $TAB_TABLET : Success');

    await db.execute('''
          CREATE TABLE $TAB_LAPTOP (
          '$CAMP_ID_LAPTOP' TEXT PRIMARY KEY NOT NULL,
          '$CAMP_NUM_INVENTARIO' TEXT,
          '$CAMP_MARCA' TEXT,
          '$CAMP_MODELO' TEXT,
          '$CAMP_TIPO' TEXT NULL,
          '$CAMP_DETALLES' TEXT,
          '$CAMP_ESTADO' TEXT,
          '$CAMP_ENCARGADO' TEXT,
          '$CAMP_FECHA' TEXT 
         )
          ''');
    print('[DBHelper] _createTables - $TAB_LAPTOP : Success');

    await db.execute('''
          CREATE TABLE $TAB_MEMORIA (
          '$CAMP_ID_MEMORIA' TEXT PRIMARY KEY NOT NULL,
          '$CAMP_NUM_INVENTARIO' TEXT,
          '$CAMP_MARCA' TEXT,
          '$CAMP_MODELO' TEXT,
          '$CAMP_TIPO' TEXT NULL,
          '$CAMP_DETALLES' TEXT,
          '$CAMP_ESTADO' TEXT,
          '$CAMP_ENCARGADO' TEXT,
          '$CAMP_FECHA' TEXT 
         )
          ''');
    print('[DBHelper] _createTables - $TAB_MEMORIA : Success');
  }

  /// Metodos de guardar y leer la tabla TABLET
  void saveTablet(Tablet tablet) async {
    var dbClient = await db;
    String addQuery = '''
         INSERT INTO $TAB_TABLET ( 
         $CAMP_ID_TABLET, $CAMP_NUM_INVENTARIO, $CAMP_MARCA,
          $CAMP_MODELO, $CAMP_TIPO, $CAMP_DETALLES, $CAMP_ESTADO, 
          $CAMP_ENCARGADO, $CAMP_FECHA ) VALUES 
          (
            \'${tablet.idTablet}\',
            \'${tablet.numInv}\',
            \'${tablet.marca}\', 
            \'${tablet.modelo}\',  
            \'${tablet.tipo}\', 
            \'${tablet.detalle}\', 
            \'${tablet.estado}\', 
            \'${tablet.encargado}\', 
            \'${tablet.fecha}\'
          )
    ''';
    await dbClient.transaction((trans) async {
      return await trans.rawQuery(addQuery);
    });
    print('[DBHelper] saveTablet: Success');
  }

  Future<List<Tablet>> getAllTablets() async {
    var dbClient = await db;
    List<Map> queryList = await dbClient.query('$TAB_TABLET');
    List<Tablet> tabletList = List();

    for (int i = 0; i < queryList.length; i++) {
      Tablet tablet = Tablet.fromMap(queryList[i]);
      tabletList.add(tablet);
      print(tablet);
    }

    print(tabletList);
    return tabletList;
  }

  /// Metodos de guardar y leer la tabla LAPTOP
  void saveLaptop(Laptop laptop) async {
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

  Future<List<Laptop>> getAllLaptops() async {
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

  /// Metodos de guardar y leer la tabla MEMORIA
  void saveMemoria(Memoria memoria) async {
    print(memoria);
    var dbClient = await db;
    String addQuery = '''
           INSERT INTO $TAB_MEMORIA ( 
           $CAMP_ID_MEMORIA, $CAMP_NUM_INVENTARIO, $CAMP_MARCA,
            $CAMP_MODELO, $CAMP_TIPO, $CAMP_DETALLES, $CAMP_ESTADO, 
            $CAMP_ENCARGADO, $CAMP_FECHA ) VALUES 
            (
              \'${memoria.idMemoria}\',
              \'${memoria.numInv}\',
              \'${memoria.marca}\', 
              \'${memoria.modelo}\',  
              \'${memoria.tipo}\', 
              \'${memoria.detalle}\', 
              \'${memoria.estado}\', 
              \'${memoria.encargadoMemoria}\', 
              \'${memoria.fecha}\'
            )
      ''';
    await dbClient.transaction((trans) async {
      return await trans.rawQuery(addQuery);
    });
    print('[DBHelper] savememoria: Success');
  }

  Future<List<Memoria>> getAllMemorias() async {
    var dbClient = await db;
    List<Map> queryList = await dbClient.query('$TAB_LAPTOP');
    List<Memoria> memoriaList = List();

    for (int i = 0; i < queryList.length; i++) {
      Memoria memoria = Memoria.fromMap(queryList[i]);
      memoriaList.add(memoria);
      print(Memoria);
    }

    print(memoriaList);
    return memoriaList;
  }
}
