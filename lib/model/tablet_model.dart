import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';
import 'package:medios_basicos/constants.dart';

class Tablet extends BasicPropRegister {
  String _idTablet, _encargado;
  Uuid _randomId = new Uuid();

  Tablet(String numInv, String marca, String modelo, String tipo,
      String detalle, String estado, this._encargado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha) {
    this._idTablet = _randomId.v1().toString().substring(24, 36);
  }

  Tablet.map(dynamic obj) : super.map(obj) {
    this._idTablet = obj[CAMP_ID_TABLET];
    this._encargado = obj[CAMP_ENCARGADO];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_TABLET] = this._idTablet;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_ENCARGADO] = this._encargado;
    map[CAMP_FECHA] = fecha;
  }

  Tablet.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idTablet = map[CAMP_ID_TABLET];
    this._encargado = map[CAMP_ENCARGADO];
  }


  get encargado => _encargado;

  set encargado(value) {
    _encargado = value;
  }

  String get idTablet => _idTablet;

  set idTablet(String value) {
    _idTablet = value;
  }

  @override
  String toString() {
    return 'Tablet{_idTablet: $_idTablet, _encargado: $_encargado, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _estado: $estado, _fecha: $fecha}';
  }
}
