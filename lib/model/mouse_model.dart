import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';
import 'package:medios_basicos/constants.dart';

class Mouse extends BasicPropRegister {
  String _idMouse;
  Uuid _randomId = Uuid();

  Mouse( String numInv, String marca, String modelo, String tipo, String detalle,String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){
    this._idMouse = _randomId.v1().toString().substring(24, 36);

  }

  Mouse.map(dynamic obj) : super.map(obj) {
    this._idMouse = obj[CAMP_ID_MOUSE];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_MOUSE] = this._idMouse;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_FECHA] = fecha;
    return map;
  }

  Mouse.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idMouse = map[CAMP_ID_MOUSE];
  }


  String get idMouse => _idMouse;

  set idMouse(String value) {
    _idMouse = value;
  }

  @override
  String toString() {
    return 'Mouse{_idMouse: $_idMouse, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _estado: $estado, _fecha: $fecha}';
  }


}