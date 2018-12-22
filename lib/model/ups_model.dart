import 'basic_prop_register.dart';

import 'package:uuid/uuid.dart';
import 'package:medios_basicos/constants.dart';

class Ups extends BasicPropRegister {
  String _idUps;

  Uuid _randomId = Uuid();

  Ups(String numInv, String marca, String modelo, String tipo, String detalle, String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){
    this._idUps = _randomId.v1().toString().substring(24, 36);
  }

  Ups.map(dynamic obj) : super.map(obj) {
    this._idUps = obj[CAMP_ID_UPS];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_UPS] = this._idUps;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_FECHA] = fecha;
    return map;
  }

  Ups.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idUps = map[CAMP_ID_UPS];
  }

  String get idUps => _idUps;

  set idUps(String value) {
    _idUps = value;
  }

  @override
  String toString() {
    return 'Ups{_idUps: $_idUps, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _estado: $estado, _fecha: $fecha}';
  }


}