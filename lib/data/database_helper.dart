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

    /// TABLA DE TABLETS
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

    /// TABLA DE LAPTOP
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

    /// TABLA DE MEMORIA
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

    /// TABLA DE ESTACION
    await db.execute('''
          CREATE TABLE $TAB_ESTACION (
          '$CAMP_ID_ESTACION' TEXT PRIMARY KEY NOT NULL,
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
    print('[DBHelper] _createTables - $TAB_ESTACION : Success');

    /// TABLA DE UNIDAD CENTRAL
    await db.execute('''
          CREATE TABLE $TAB_UNIDAD_CENTRAL (
          '$CAMP_ID_UNIDAD_CENTRAL' TEXT PRIMARY KEY NOT NULL,
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
    print('[DBHelper] _createTables - $TAB_UNIDAD_CENTRAL : Success');

    /// TABLA DE MOTHERBOARD
    await db.execute('''
          CREATE TABLE $TAB_MOTHERBOARD (
          '$CAMP_ID_MOTHERBOARD' TEXT PRIMARY KEY NOT NULL,
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
    print('[DBHelper] _createTables - $TAB_MOTHERBOARD : Success');

    /// TABLA DE CPU
    await db.execute('''
          CREATE TABLE $TAB_CPU (
          '$CAMP_ID_CPU' TEXT PRIMARY KEY NOT NULL,
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
    print('[DBHelper] _createTables - $TAB_CPU : Success');

    /// TABLA DE RAM
    await db.execute('''
          CREATE TABLE $TAB_RAM (
          '$CAMP_ID_RAM' TEXT PRIMARY KEY NOT NULL,
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
    print('[DBHelper] _createTables - $TAB_RAM : Success');

    /// TABLA DE HDD
    await db.execute('''
          CREATE TABLE $TAB_HDD (
          '$CAMP_ID_HDD' TEXT PRIMARY KEY NOT NULL,
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
    print('[DBHelper] _createTables - $TAB_HDD : Success');

    /// TABLA DE MONITOR
    await db.execute('''
          CREATE TABLE $TAB_MONITOR (
          '$CAMP_ID_MONITOR' TEXT PRIMARY KEY NOT NULL,
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
    print('[DBHelper] _createTables - $TAB_MONITOR : Success');

    /// TABLA DE TECLADO
    await db.execute('''
          CREATE TABLE $TAB_TECLADO (
          '$CAMP_ID_TECLADO' TEXT PRIMARY KEY NOT NULL,
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
    print('[DBHelper] _createTables - $TAB_TECLADO : Success');

    /// TABLA DE BOCINA
    await db.execute('''
          CREATE TABLE $TAB_BOCINA (
          '$CAMP_ID_BOCINA' TEXT PRIMARY KEY NOT NULL,
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
    print('[DBHelper] _createTables - $TAB_BOCINA : Success');

    /// TABLA DE MOUSE
    await db.execute('''
          CREATE TABLE $TAB_MOUSE (
          '$CAMP_ID_MOUSE' TEXT PRIMARY KEY NOT NULL,
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
    print('[DBHelper] _createTables - $TAB_MOUSE : Success');

    /// TABLA DE SCANNER
    await db.execute('''
          CREATE TABLE $TAB_SCANNER (
          '$CAMP_ID_SCANNER' TEXT PRIMARY KEY NOT NULL,
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
    print('[DBHelper] _createTables - $TAB_SCANNER : Success');

    /// TABLA DE IMPRESORA
    await db.execute('''
          CREATE TABLE $TAB_IMPRESORA (
          '$CAMP_ID_IMPRESORA' TEXT PRIMARY KEY NOT NULL,
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
    print('[DBHelper] _createTables - $TAB_IMPRESORA : Success');

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
