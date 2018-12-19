import 'package:medios_basicos/model/cpu_model.dart';
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
  String _fecha;

  String _idMotherboard, _idCpu, _idRam, _idHdd, _idDvdRw;

  UnidadCentral(this._numInv, this._sello, this._area,
      this._encargado, this._idMotherboard, this._idCpu,
      this._idRam, this._idHdd, this._idDvdRw, this._fecha,){
    this._idUCentral = _randomId.v1().toString().substring(24, 36);
  }

  UnidadCentral.ClienteLigero(this._numInv, this._sello,
      this._area,
      this._encargado, this._fecha, this._idMotherboard, this._idCpu,
      this._idRam, this._idHdd){
    this._idUCentral = _randomId.v1().toString().substring(24, 36);
  }

  get idDvdRw => _idDvdRw;

  set idDvdRw(value) {
    _idDvdRw = value;
  }

  get idHdd => _idHdd;

  set idHdd(value) {
    _idHdd = value;
  }

  get idRam => _idRam;

  set idRam(value) {
    _idRam = value;
  }

  get idCpu => _idCpu;

  set idCpu(value) {
    _idCpu = value;
  }

  String get idMotherboard => _idMotherboard;

  set idMotherboard(String value) {
    _idMotherboard = value;
  }

  String get fecha => _fecha;

  set fecha(String value) {
    _fecha = value;
  }

  String get encargado => _encargado;

  set encargado(String value) {
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


}