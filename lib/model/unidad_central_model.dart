import 'package:medios_basicos/model/cpu_model.dart';
import 'package:uuid/uuid.dart';
import 'package:medios_basicos/constants.dart';

class UnidadCentral {
  String _idUCentral;
  Uuid _randomId = Uuid();

  String _numInv;
  String _sello;
  String _fecha;

  String _idMotherboard, _idCpu, _idRam, _idHdd, _idDvdRw;

  UnidadCentral(
    this._numInv,
    this._sello,
    this._idMotherboard,
    this._idCpu,
    this._idRam,
    this._idHdd,
    this._idDvdRw,
    this._fecha,
  ) {
    this._idUCentral = _randomId.v1().toString().substring(24, 36);
  }

  UnidadCentral.ClienteLigero(this._numInv, this._sello, this._fecha,
      this._idMotherboard, this._idCpu, this._idRam, this._idHdd) {
    this._idUCentral = _randomId.v1().toString().substring(24, 36);
  }

  UnidadCentral.map(dynamic obj) {
    this._idUCentral = obj[CAMP_ID_UNIDAD_CENTRAL];

    this._numInv = obj[CAMP_NUM_INVENTARIO];
    this._sello = obj[CAMP_SELLO_UC];
    this._fecha = obj[CAMP_FECHA];

    this._idMotherboard = obj[CAMP_ID_MOTHERBOARD];
    this._idCpu = obj[CAMP_ID_CPU];
    this._idRam = obj[CAMP_ID_RAM];
    this._idHdd = obj[CAMP_ID_HDD];
    this._idDvdRw = obj[CAMP_ID_DVD_RW];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_UNIDAD_CENTRAL] = this._idUCentral;

    map[CAMP_NUM_INVENTARIO] = this._numInv;
    map[CAMP_SELLO_UC] = this._sello;
    map[CAMP_FECHA] = this._fecha;

    map[CAMP_ID_MOTHERBOARD] = this._idMotherboard;
    map[CAMP_ID_CPU] = this._idCpu;
    map[CAMP_ID_RAM] = this._idRam;
    map[CAMP_ID_HDD] = this._idHdd;
    map[CAMP_ID_DVD_RW] = this._idDvdRw;

    return map;
  }

  UnidadCentral.fromMap(Map<String, dynamic> map) {
    this._idUCentral = map[CAMP_ID_UNIDAD_CENTRAL];

    this._numInv = map[CAMP_NUM_INVENTARIO];
    this._sello = map[CAMP_SELLO_UC];
    this._fecha = map[CAMP_FECHA];

    this._idMotherboard = map[CAMP_ID_MOTHERBOARD];
    this._idCpu = map[CAMP_ID_CPU];
    this._idRam = map[CAMP_ID_RAM];
    this._idHdd = map[CAMP_ID_HDD];
    this._idDvdRw = map[CAMP_ID_DVD_RW];
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
