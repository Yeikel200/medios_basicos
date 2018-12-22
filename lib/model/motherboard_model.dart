import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';
import 'package:medios_basicos/constants.dart';

class Motherboard extends BasicPropRegister {
  String _idMotherboard;
  Uuid _randomId = Uuid();

  Motherboard( String numInv, String marca, String modelo, String tipo, String detalle, String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){
    this._idMotherboard = _randomId.v1().toString().substring(24, 36);
  }

  Motherboard.map(dynamic obj) : super.map(obj) {
    this._idMotherboard = obj[CAMP_ID_MOTHERBOARD];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_MOTHERBOARD] = this._idMotherboard;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_FECHA] = fecha;
    return map;
  }

  Motherboard.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idMotherboard = map[CAMP_ID_MOTHERBOARD];
  }

  String get idMotherboard => _idMotherboard;

  set idMotherboard(String value) {
    _idMotherboard = value;
  }

  @override
  String toString() {
    return 'Motherboard{_idMotherboard: $_idMotherboard, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _fecha: $fecha}';
  }


}