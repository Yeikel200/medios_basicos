import 'package:flutter/foundation.dart';

class BasicPropRegister {

  String _numInv;
  String _marca;
  String _modelo;
  String _tipo;
  String _detalle;
  String _fecha;

  BasicPropRegister(@required this._numInv, this._marca, this._modelo, this._tipo,
      this._detalle, this._fecha);


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