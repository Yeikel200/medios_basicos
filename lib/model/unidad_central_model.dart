import 'package:uuid/uuid.dart';

import 'motherboard_model.dart';
import 'hdd_model.dart';
import 'ram_model.dart';
import 'dvd_rw_model.dart';



class UnidadCentral  {
  String _idUCentral;
  Uuid _randomId = Uuid();

  String _numInv;
  String _sello;
  String _area;
  String _encargado;

  Motherboard _motherboard;
  Ram _ram;
  Hdd _hdd;
  DvdRw _dvdRw;

  UnidadCentral( this._numInv, this._sello, this._area,
      this._encargado, this._motherboard, this._ram, this._hdd, this._dvdRw){
    this._idUCentral = _randomId.v1().toString().substring(24, 36);

  }

  UnidadCentral.cliente(this._numInv, this._sello, this._area,
      this._encargado, this._motherboard, this._ram, this._hdd){
    this._idUCentral = _randomId.v1().toString().substring(24, 36);

  }

  DvdRw get dvdRw => _dvdRw;

  set dvdRw(DvdRw value) {
    _dvdRw = value;
  }

  Hdd get hdd => _hdd;

  set hdd(Hdd value) {
    _hdd = value;
  }

  Ram get ram => _ram;

  set ram(Ram value) {
    _ram = value;
  }

  Motherboard get motherboard => _motherboard;

  set motherboard(Motherboard value) {
    _motherboard = value;
  }

  String get responsable => _encargado;

  set responsable(String value) {
    _encargado = value;
  }

  String get area => _area;

  set area(String value) {
    _area = value;
  }

  String get sello => _sello;

  set sello(String value) {
    _sello = value;
  }

  String get numInv => _numInv;

  set numInv(String value) {
    _numInv = value;
  }

  String get idUCentral => _idUCentral;

  set idUCentral(String value) {
    _idUCentral = value;
  }

  @override
  String toString() {
    return '''UnidadCentral{
      _idUCentral: $_idUCentral, 
      _numInv: $_numInv,
      _sello: $_sello,
      _area: $_area,
      _responsable: $_encargado, 
      _motherboard: $_motherboard,
      _ram: $_ram, 
      _hdd: $_hdd, 
      _dvdRw: $_dvdRw
    }''';
  }


}