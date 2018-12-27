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
          '$CAMP_AREA_ESTACION' TEXT,
          '$CAMP_ENCARGADO' TEXT,
          '$CAMP_ID_UNIDAD_CENTRAL' TEXT,
          '$CAMP_ID_MONITOR' TEXT NULL,
          '$CAMP_ID_TECLADO' TEXT,
          '$CAMP_ID_BOCINA' TEXT,
          '$CAMP_ID_MOUSE' TEXT,
          '$CAMP_ID_UPS' TEXT,
          '$CAMP_ID_SCANNER' TEXT,
          '$CAMP_ID_IMPRESORA' TEXT 
         )
          ''');
    print('[DBHelper] _createTables - $TAB_ESTACION : Success');

    /// TABLA DE UNIDAD CENTRAL
    await db.execute('''
          CREATE TABLE $TAB_UNIDAD_CENTRAL (
          '$CAMP_ID_UNIDAD_CENTRAL' TEXT PRIMARY KEY NOT NULL,
          '$CAMP_NUM_INVENTARIO' TEXT,
          '$CAMP_SELLO_UC' TEXT,
          '$CAMP_ID_MOTHERBOARD' TEXT,
          '$CAMP_ID_CPU' TEXT NULL,
          '$CAMP_ID_RAM' TEXT,
          '$CAMP_ID_HDD' TEXT,
          '$CAMP_ID_DVD_RW' TEXT,
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
          '$CAMP_FECHA' TEXT 
         )
          ''');
    print('[DBHelper] _createTables - $TAB_HDD : Success');

    /// TABLA DE TAB DVD-RW
    await db.execute('''
          CREATE TABLE $TAB_DVD_RW (
          '$CAMP_ID_DVD_RW' TEXT PRIMARY KEY NOT NULL,
          '$CAMP_NUM_INVENTARIO' TEXT,
          '$CAMP_MARCA' TEXT,
          '$CAMP_MODELO' TEXT,
          '$CAMP_TIPO' TEXT NULL,
          '$CAMP_DETALLES' TEXT,
          '$CAMP_ESTADO' TEXT,
          '$CAMP_FECHA' TEXT 
         )
          ''');
    print('[DBHelper] _createTables - $TAB_DVD_RW : Success');

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
          '$CAMP_FECHA' TEXT 
         )
          ''');
    print('[DBHelper] _createTables - $TAB_MOUSE : Success');

    /// TABLA DE UPS
    await db.execute('''
          CREATE TABLE $TAB_UPS (
          '$CAMP_ID_UPS' TEXT PRIMARY KEY NOT NULL,
          '$CAMP_NUM_INVENTARIO' TEXT,
          '$CAMP_MARCA' TEXT,
          '$CAMP_MODELO' TEXT,
          '$CAMP_TIPO' TEXT NULL,
          '$CAMP_DETALLES' TEXT,
          '$CAMP_ESTADO' TEXT,
          '$CAMP_FECHA' TEXT 
         )
          ''');
    print('[DBHelper] _createTables - $TAB_UPS : Success');

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
          '$CAMP_FECHA' TEXT 
         )
          ''');
    print('[DBHelper] _createTables - $TAB_IMPRESORA : Success');
  }






}
