import 'package:flutter/foundation.dart';
import 'package:medios_basicos/constants.dart';

class BasicPropRegister {
  String _numInv;
  String _marca;
  String _modelo;
  String _tipo;
  String _detalle;
  String _estado;
  String _fecha;

  BasicPropRegister(@required this._numInv, this._marca, this._modelo,
      this._tipo, this._detalle, this._estado, this._fecha);

  BasicPropRegister.map(dynamic obj) {
    this._numInv = obj[CAMP_NUM_INVENTARIO];
    this._marca = obj[CAMP_MARCA];
    this._modelo = obj[CAMP_MODELO];
    this._tipo = obj[CAMP_TIPO];
    this._detalle = obj[CAMP_DETALLES];
    this._estado = obj[CAMP_ESTADO];
    this._fecha = obj[CAMP_FECHA];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_NUM_INVENTARIO] = _numInv;
    map[CAMP_MARCA] = _marca;
    map[CAMP_MODELO] = _modelo;
    map[CAMP_TIPO] = _tipo;
    map[CAMP_DETALLES] = _detalle;
    map[CAMP_ESTADO] = _estado;
    map[CAMP_FECHA] = _fecha;
    return map;
  }

  BasicPropRegister.fromMap(Map<String, dynamic> map) {
    this._numInv = map[CAMP_NUM_INVENTARIO];
    this._marca = map[CAMP_MARCA];
    this._modelo = map[CAMP_MODELO];
    this._tipo = map[CAMP_TIPO];
    this._detalle = map[CAMP_DETALLES];
    this._estado = map[CAMP_ESTADO];
    this._fecha = map[CAMP_FECHA];
  }

  String get estado => _estado;

  set estado(String value) {
    _estado = value;
  }

  String get fecha => _fecha;

  set fecha(String value) {
    _fecha = value;
  }

  String get detalle => _detalle;

  set detalle(String value) {
    _detalle = value;
  }

  String get tipo => _tipo;

  set tipo(String value) {
    _tipo = value;
  }

  String get modelo => _modelo;

  set modelo(String value) {
    _modelo = value;
  }

  String get marca => _marca;

  set marca(String value) {
    _marca = value;
  }

  String get numInv => _numInv;

  set numInv(String value) {
    _numInv = value;
  }

  @override
  String toString() {
    return 'BasicPropRegister{_numInv: $_numInv, _marca: $_marca, _modelo: $_modelo, _tipo: $_tipo, _detalle: $_detalle}';
  }
}
