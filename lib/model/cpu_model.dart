import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';
import 'package:medios_basicos/constants.dart';

class Cpu extends BasicPropRegister {
  String _idCpu;
  Uuid _randomId = Uuid();

  Cpu(String numInv, String marca, String modelo, String tipo, String detalle,String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){
    this._idCpu = _randomId.v1().toString().substring(24, 36);
  }

  Cpu.map(dynamic obj) : super.map(obj) {
    this._idCpu = obj[CAMP_ID_CPU];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_CPU] = this._idCpu;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_FECHA] = fecha;
    return map;
  }

  Cpu.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idCpu = map[CAMP_ID_CPU];
  }


  Uuid get randomId => _randomId;

  set randomId(Uuid value) {
    _randomId = value;
  }

  String get idCpu => _idCpu;

  set idCpu(String value) {
    _idCpu = value;
  }


}