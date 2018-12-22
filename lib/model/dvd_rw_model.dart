import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';
import 'package:medios_basicos/constants.dart';

class DvdRw extends BasicPropRegister {
  String _idDvdRw;
  Uuid _randomId = Uuid();

  DvdRw( String numInv, String marca, String modelo, String tipo, String detalle, String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){
    this._idDvdRw = _randomId.v1().toString().substring(24, 36);
  }

  DvdRw.map(dynamic obj) : super.map(obj) {
    this._idDvdRw = obj[CAMP_ID_DVD_RW];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_DVD_RW] = this._idDvdRw;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_FECHA] = fecha;
    return map;
  }

  DvdRw.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idDvdRw = map[CAMP_ID_DVD_RW];
  }


  String get idDvdRw => _idDvdRw;

  set idDvdRw(String value) {
    _idDvdRw = value;
  }

  @override
  String toString() {
    return 'DvdRw{_idDvdRw: $_idDvdRw, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _fecha: $fecha}';
  }


}